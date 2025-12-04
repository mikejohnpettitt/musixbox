import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="counter"
export default class extends Controller {
  static targets = ["display", "input"]

  // Lancement du temps à la connection et initialisation du elapsed
  connect() {
    this.startTime = Date.now()
    this.elapsed = 0
    this.startStopwatch()
  }

  // Arrêt du chrono, différence entre le temps de fin et le temps lancé à la connection,
  // et remplacement du texte par le temps formaté
  startStopwatch() {
    this.timer = setInterval(() => {
      this.elapsed = Date.now() - this.startTime
      this.displayTarget.textContent = this.formatTime(this.elapsed)
    }, 1000);
  }

  // Vérifie si l'élément existe et si oui remplace la valeur de l'input (le hidden field) par le temps écoulé.
  saveTime() {
    this.elapsed = Date.now() - this.startTime
    if (this.hasInputTarget) {
      this.inputTarget.value = this.elapsed
    }
  }

  // Formatage du temps pour obtenir un résultat de type 1:00
  formatTime(ms) {
    const totalSeconds = Math.floor(ms / 1000)
    const mins = Math.floor(totalSeconds/60)
    const secs = totalSeconds % 60
    return `${mins}:${secs.toString().padStart(2, '0')}`
  }

  // Nettoyage du chrono
  disconnect() {
    clearInterval(this.timer)
  }
}
