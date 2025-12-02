class PlaylistsController < ApplicationController
  def index
    @playlists = Playlist.all
  end

  def user
    @user = current_user
  end
end
