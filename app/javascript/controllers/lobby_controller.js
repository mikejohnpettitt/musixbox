import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer.js"

// Connects to data-controller="lobby"
export default class extends Controller {
  static values = {
    groupId: Number,
    userId: Number,
    userName: String
  }

  connect() {
    this.channel = consumer.subscriptions.create(
      {
        channel: "LobbyChannel",
        group_id: this.groupIdValue,
        user_id: this.userIdValue,
        user_name: this.userNameValue
      },
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
      console.log(`${data.user_name} joined the lobby`)
    }

    if (data.type === "user_left") {
      console.log(`${data.user_name} left the lobby`)
    }
  }
}
