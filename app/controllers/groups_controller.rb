class GroupsController < ApplicationController
  def show
    @group = Group.find(params[:id])
    if UserSession.find(params[:id]).nil?
     @user_session = UserSession.create(user: current_or_guest_user, group: @group, session: UserSession.where(group: @group).first.session)
    else
     @user_session = UserSession.find(params[:id])
    end
  end
end
