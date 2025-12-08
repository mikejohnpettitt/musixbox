class LobbyChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    @group = Group.find(params[:group_id])  
    stream_from "lobby_#{@group.id}"

    ActionCable.server.broadcast(
      "lobby_#{@group.id}",
      {
        type: "user_joined",
        user_id: params[user_id],
        user_name: "User-#{params[user_id]}"
      }
    )
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    ActionCable.server.broadcast(
      "lobby_#{@group.id}",
      {
        type: "user_left",
        user_id: params[user_id],
        user_name: "User-#{params[user_id]}"
      }
    )
  end
end
