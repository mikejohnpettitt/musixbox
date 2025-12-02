class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  # 
  def skip_destroy_guest_user
    # return true = do NOT delete guest
    guest_user.user_sessions.exists?
  end
end
