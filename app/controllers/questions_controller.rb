require 'fuzzystringmatch'

class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])

  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      jarow = FuzzyStringMatch::JaroWinkler.create( :native )
      @accuracy_title = jarow.getDistance(@question.user_answer_title.downcase, @question.song.title.downcase)
      @accuracy_artist = jarow.getDistance(@question.user_answer_artist.downcase, @question.song.artist.downcase)

      @accuracy_artist >= 0.85 ? @question.successful_artist = 1 : @question.successful_artist = 0
      @accuracy_title >= 0.85 ? @question.successful_title = 1 : @question.successful_title = 0
      @question.save
      render partial: "feedback_content", locals: {question: @question}
    else
      render :edit, status: :unprocessable_entity
    end

  end

  private

  def question_params
    params.require(:question).permit(:user_answer_title, :user_answer_artist, :successful_artist, :successful_title, :time_taken)
  end
end
