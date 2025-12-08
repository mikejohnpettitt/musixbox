import { Controller } from "@hotwired/stimulus"
import consumer from "channels/consumer"

// Connects to data-controller="lobby"
export default class extends Controller {
  static values = {
    groupId: Number,
    userId: Number,
  }

  connect() {
    console.log("connected")
    this.channel = consumer.subscriptions.create(
      {
        channel: "LobbyChannel",
        group_id: this.groupIdValue,
        user_id: this.userIdValue      },
      {
        received: this.received.bind(this)
      }
    )
  }


  disconnect() {
    if (this.channel) {
      this.channel.unsubscribe()
    }
  }

  received(data) {
    console.log("Received:", data)

    if (data.type === "user_joined") {
      console.log(`${data.user_id} joined the lobby`)
    }

    if (data.type === "user_left") {
      console.log(`${data.user_id} left the lobby`)
    }
  }
}
