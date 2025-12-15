import { Controller } from "@hotwired/stimulus"
import consumer from "channels/consumer"

// Connects to data-controller="lobby"
export default class extends Controller {
  static values = {
    groupId: Number,
    userId: Number,
    startUrl: String,
    sessionPath: String
  }

  connect() {
    this.channel = consumer.subscriptions.create(
      {
        channel: "LobbyChannel",
        group_id: this.groupIdValue,
        user_session_id: this.userSessionIdValue,
        user_id: this.userIdValue
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

  start() {
    fetch(`/groups/${this.groupIdValue}/start`, {
      method: "POST",
      headers: {
        "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content,
        "Content-Type": "application/json"
      },
      body: JSON.stringify({ user_id: this.userIdValue })
    })
  }



  received(data) {

    if (data.type === 'user_joined') {
      const playersEl = document.getElementById('players')
      const existingPlayer = document.getElementById(`player_${data.user_id}`)

      if (playersEl && !existingPlayer) {
        playersEl.insertAdjacentHTML('beforeend', data.html)
      }
    }

    if (data.type === 'video_paused') {
      const youtubeEl = document.querySelector('[data-controller~="youtube"]')
      if (youtubeEl) {
        const youtubeController = this.application.getControllerForElementAndIdentifier(youtubeEl, 'youtube')
        if (youtubeController) youtubeController.pause()
      }
    }

    if (data.type === 'video_playing') {
      const youtubeEl = document.querySelector('[data-controller~="youtube"]')
      if (youtubeEl) {
        const youtubeController = this.application.getControllerForElementAndIdentifier(youtubeEl, 'youtube')
        if (youtubeController) youtubeController.play()
      }
    }

    if (data.type === "user_left") {
      const playerElement = document.getElementById(`player_${data.user_id}`)
      if (playerElement) {
        playerElement.remove()
      }
    }

    if (data.type === 'buzzer_locked') {
      const buzzer = document.querySelector('[data-toggle-target="buzzer"]')
      const buzzerMessage = document.getElementById('buzzer-message')

      // Bouton Next déactivé pour tout le monde
      this.disableNextButton()

      if (data.user_id !== this.userIdValue) {
        // I pressed the buzzer - toggle controller handles this
        // Someone else pressed - hide my buzzer, show message
        if (buzzer) buzzer.classList.add('d-none')
        if (buzzerMessage) {
          buzzerMessage.textContent = `${data.user_id} is answering...`
          buzzerMessage.classList.remove('d-none')
        }
      }
    }

    if (data.type === 'buzzer_unlocked') {
      const buzzer = document.querySelector('[data-toggle-target="buzzer"]')
      const buzzerMessage = document.getElementById('buzzer-message')

      // Réactive le bouton Next pour tout le monde seulement si 1O secondes sont passées
      this.enableNextButtonIfAllowed()

      // Show buzzer for everyone except the user who got it wrong
      if (data.user_id !== this.userIdValue) {
        if (buzzer) buzzer.classList.remove('d-none')
      }
      if (buzzerMessage) buzzerMessage.classList.add('d-none')
    }

    if (data.type === 'round_won') {
      const buzzer = document.querySelector('[data-toggle-target="buzzer"]')
      const buzzerMessage = document.getElementById('buzzer-message')

      // Active le bouton Next lorsque le round est gagné
      this.enableNextButton()

      if (buzzer) buzzer.classList.add('d-none')
      if (buzzerMessage) {
        buzzerMessage.textContent = `Player ${data.user_id} got it right!`
        buzzerMessage.classList.remove('d-none')
      }
    }

    if (data.type === "start_game") {
      // each client goes to its own play_session_path(@user_session)
      window.location = this.startUrlValue
    }

    if (data.type === 'next_question') {
      window.location = `${this.sessionPathValue}?current_question=${data.question_id}`
    }
  }

  buzzerPressed() {
    this.channel.perform('buzzer_pressed', {
      user_id: this.userIdValue,
    })
  }

  answerWrong() {
    this.channel.perform('answer_wrong', {
      user_id: this.userIdValue
    })
  }

  // Call this when answer is correct
  answerCorrect() {
    this.channel.perform('answer_correct', {
      user_id: this.userIdValue
    })
  }

  goToNext(event) {
    event.preventDefault()
    const questionId = event.currentTarget.dataset.questionId
    this.channel.perform('next_question', { question_id: questionId })
  }

  pauseVideo() {
    this.channel.perform('pause_video', { user_id: this.userIdValue })
  }

  playVideo() {
    this.channel.perform('play_video', { user_id: this.userIdValue })
  }

  disableNextButton() {
    const nextButton = document.querySelector('[data-counter-target="nextButton"]')
    if (nextButton) {
      nextButton.disabled = true
    }
  }

  enableNextButton() {
    const nextButton = document.querySelector('[data-counter-target="nextButton"]')
    if (nextButton) {
      nextButton.disabled = false
    }
  }

  enableNextButtonIfAllowed() {
    const counterEl = document.querySelector('[data-controller~="counter"]')
    if (counterEl) {
      const counterController = this.application.getControllerForElementAndIdentifier(counterEl, 'counter')
      if (counterController && counterController.elapsed >= 10000) {
        const nextButton = document.querySelector('[data-counter-target="nextButton"]')
        if (nextButton) {
          nextButton.disabled = false
        }
      }
    }
  }
}
