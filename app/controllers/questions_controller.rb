require 'fuzzystringmatch'

class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @session = @question.session
    @user_session = UserSession.where(user: current_or_guest_user).where(session: @session).first

    if @question.update(question_params)
      jarow = FuzzyStringMatch::JaroWinkler.create(:native)
      @accuracy_title = jarow.getDistance(@question.user_answer_title.downcase, @question.song.title.downcase)
      @accuracy_artist = jarow.getDistance(@question.user_answer_artist.downcase, @question.song.artist.downcase)

      if @accuracy_artist >= 0.9 
        if @question.successful_artist.nil? || @question.successful_artist == false
          @user_session.score += 1
        end
        @question.successful_artist = 1 
      else
        @question.successful_artist = 0
      end

      if @accuracy_title >= 0.9
        if @question.successful_title.nil? || @question.successful_title == false
          @user_session.score += 1
        end
        @question.successful_title = 1 
      else 
        @question.successful_title = 0
      end

      if @question.successful_artist == true && @question.successful_title == true
        @question.user = current_or_guest_user
      end

      if (@question.successful_artist == true && @question.successful_title == false) || (@question.successful_artist == false && @question.successful_title == true)
        if @question.user == nil
          @question.user = current_or_guest_user
        end
      end

      @question.save
      @user_session.save

      # Données pour la barre de progression
      @questions = Question.where(session_id: @question.session_id).order(:id)
      @total_questions = @questions.count
      @current_index = @questions.find_index { |q| q.id == @question.id }.to_i + 1

      # Répond aux deux formats possibles
      respond_to do |format|
        format.turbo_stream  # Utilise update.turbo_stream.erb
        format.html { render partial: "feedback_content", locals: { question: @question } }
      end

    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def question_params
    params.require(:question).permit(:user_answer_title, :user_answer_artist, :successful_artist, :successful_title, :time_taken)
  end
end
