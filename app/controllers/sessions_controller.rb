class SessionsController < ApplicationController

  def new
    # this is the playlist select page
    @playlists = Playlist.all
    @session = Session.new
  end



  def create  
    @session = Session.new(session_params)
    if @session.save
      # raise
      @user_session = UserSession.create!(
        user:    current_or_guest_user,
        session: @session,
        # this only applies to Quickplay for now
        group: Group.create
      )
      # raise
      # needed to rename as "user_session_path" conflicts with devise
      # redirect_to user_session_path(@user_session)
      redirect_to play_session_path(@user_session)

    else
      @playlists = Playlist.all
      render :new, status: :unprocessable_entity
    end
  end

 
  private

  def session_params
    params.require(:session).permit(:playlist_id)
  end

end
