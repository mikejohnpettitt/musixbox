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

  def buzzer_pressed(data)
    ActionCable.server.broadcast(
      "lobby_#{@group.id}",
      {
        type: "buzzer_locked",
        user_id: data['user_id'],
        # user_name: data['user_name']
      }
    )
  end

    def answer_wrong(data)
    ActionCable.server.broadcast(
      "lobby_#{@group.id}",
      {
        type: 'buzzer_unlocked',
        user_id: data['user_id']
      }
    )
    end

     def answer_correct(data)
    ActionCable.server.broadcast(
      "lobby_#{@group.id}",
      {
        type: 'round_won',
        user_id: data['user_id']
      }
    )
  end

  def next_question(data)
  ActionCable.server.broadcast(
    "lobby_#{@group.id}",
    {
      type: 'next_question',
      question_id: data['question_id']
    }
  )
  end

  def pause_video(data)
  ActionCable.server.broadcast(
    "lobby_#{@group.id}",
    {
      type: 'video_paused',
      user_id: data['user_id']
    }
  )
  end

  def play_video(data)
  ActionCable.server.broadcast(
    "lobby_#{@group.id}",
    {
      type: 'video_playing',
      user_id: data['user_id']
    }
  )
  end

end
