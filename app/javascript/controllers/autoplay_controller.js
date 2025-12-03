import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="autoplay"
export default class extends Controller {
  connect() {
    console.log("coucou")
  }
}
