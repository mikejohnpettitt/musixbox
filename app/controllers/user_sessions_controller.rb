class UserSessionsController < ApplicationController

  
  def show
    @user_session = current_or_guest_user.user_sessions.find(params[:id])
    @playlist = @user_session.session.playlist
    if params[:current_question].present?
      @current_question = Question.find(params[:current_question])
      @next_question = Question.where(session_id: @user_session.session_id).where("id > ?", @current_question).first
      @current_question = @next_question
    else
      Song.where(playlist_id: @playlist.id).each do |song|
        Question.create(session_id: @user_session.session_id, song: song )
      end
      @current_question = Question.where(session_id: @user_session.session_id).first
    end
  end


end
