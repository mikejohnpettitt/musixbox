require 'fuzzystringmatch'

class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    raise
    @user_session = UserSession.find(params[:id])

    if @question.update(question_params)
      jarow = FuzzyStringMatch::JaroWinkler.create(:native)
      @accuracy_title = jarow.getDistance(@question.user_answer_title.downcase, @question.song.title.downcase)
      @accuracy_artist = jarow.getDistance(@question.user_answer_artist.downcase, @question.song.artist.downcase)

      @accuracy_artist >= 0.85 ? @question.successful_artist = 1 : @question.successful_artist = 0
      @accuracy_title >= 0.85 ? @question.successful_title = 1 : @question.successful_title = 0



      @question.save

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
