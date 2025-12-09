class GroupsController < ApplicationController
  def show
    @group = Group.find(params[:id])
    if UserSession.find(params[:id]).nil?
     @user_session = UserSession.create(user: current_or_guest_user, group: @group, session: UserSession.where(group: @group).first.session)
    else
     @user_session = UserSession.find(params[:id])
    end

    # Load connected users for the lobby
    connected_user_ids = Rails.cache.fetch("lobby_#{@group.id}_users") { [] }
    @connected_users = User.where(id: connected_user_ids)
  end

  def start
    @group = Group.find(params[:id])

    # Optional: mark group as started here if you want
    # group.update(started_at: Time.current)

    ActionCable.server.broadcast(
      "lobby_#{@group.id}",
      { type: "start_game" }
    )

    head :ok
  end


end
