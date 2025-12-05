// app/javascript/controllers/toggle_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["buzzer", "form", "feedback"]

  buzz(event) {
    event.preventDefault()
    this.buzzerTarget.classList.add("d-none")
    this.formTarget.classList.remove("d-none")
  }

  submitted(event) {

    // Only switch on successful response
    if (!event.detail.success) return

    this.formTarget.classList.add("d-none")
    this.feedbackTarget.classList.remove("d-none")
  }
}
