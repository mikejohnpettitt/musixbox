class UserSessionsController < ApplicationController

  def show
    @user_session = current_or_guest_user.user_sessions.find(params[:id])
  end

end
