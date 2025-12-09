class LobbyChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    @group = Group.find(params[:group_id])
    stream_from "lobby_#{@group.id}"

    # Add user to connected list in cache
    connected_users = Rails.cache.fetch("lobby_#{@group.id}_users") { [] }
    connected_users << params[:user_id] unless connected_users.include?(params[:user_id])
    Rails.cache.write("lobby_#{@group.id}_users", connected_users)


    user = User.find(params[:user_id])

    ActionCable.server.broadcast(
      "lobby_#{@group.id}",
      {
        type: "user_joined",
        user_id: params[:user_id],
        html: ApplicationController.render(partial: 'groups/players', locals: { user: user })
      }
    )
  end

  def unsubscribed
    @group = Group.find(params[:group_id])

    # Remove user from connected list in cache
    connected_users = Rails.cache.fetch("lobby_#{@group.id}_users") { [] }
    connected_users.delete(params[:user_id])
    Rails.cache.write("lobby_#{@group.id}_users", connected_users)

    ActionCable.server.broadcast(
      "lobby_#{@group.id}",
      {
        type: "user_left",
        user_id: params[:user_id],
      }
    )
  end
end
