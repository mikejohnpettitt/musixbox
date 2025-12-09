// app/javascript/controllers/toggle_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["buzzer", "form", "feedback", "welldone"]

  buzz(event) {
    event.preventDefault()
    this.buzzerTarget.classList.add("d-none")
    this.formTarget.classList.remove("d-none")
  }

  submitted(event) {
    // Wait a tick for Turbo to update the DOM
    setTimeout(() => {
      const feedback = this.element.querySelector('[data-toggle-target="feedback"]')

      if (!feedback) {
        console.log("Feedback not found yet")
        return
      }

      const isSuccess = feedback.dataset.success === "true"

      // Get lobby controller to broadcast result
      const lobbyEl = document.querySelector('[data-controller~="lobby"]')
      const lobbyController = this.application.getControllerForElementAndIdentifier(lobbyEl, 'lobby')


      if (isSuccess) {
        // Correct! Hide form, show feedback
        this.formTarget.classList.add("d-none")
        feedback.classList.remove("d-none")
        this.welldoneTarget.classList.remove("d-none")

        // Broadcast correct answer
        if (lobbyController) lobbyController.answerCorrect()
      } else {
        // Wrong! Hide form, show buzzer, play video
        this.formTarget.classList.add("d-none")
        this.buzzerTarget.classList.remove("d-none")

    //     // Play video
    //     const youtubeEl = this.element
    //     const youtubeController = this.application.getControllerForElementAndIdentifier(youtubeEl, 'youtube')
    //     if (youtubeController) {
    //       youtubeController.play()
    //     }

    //     if (lobbyController) lobbyController.answerWrong()

    //   }
    // }, 100)

        // Broadcast play video to everyone
        if (lobbyController) {
          lobbyController.answerWrong()
          lobbyController.playVideo()
        }
      }
    }, 100)
  }
}
