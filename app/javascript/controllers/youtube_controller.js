import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="youtube"
export default class extends Controller {

  static targets = ["player"]

  connect() {
    console.log("youtube connecté")
    this.loadYouTubeAPI()
  }

  loadYouTubeAPI() {
    // Charge la vidéo
    if (window.YT) {
      this.initPlayer()
      return
    }

    // Charge l'api de l'iframe
    const tag = document.createElement('script')
    tag.src = "https://www.youtube.com/iframe_api"
    document.head.appendChild(tag)

    // lorsqu'elle est prête
    window.onYouTubeIframeAPIReady = () => {
      this.initPlayer()
    }
  }

  initPlayer() {
    const iframe = this.playerTarget.querySelector('iframe')
    if (!iframe) return

    // S'assure que l'iframe a un id
    if (!iframe.id) {
      iframe.id = `youtube-player-${Math.random().toString(36).substr(2, 9)}`
    }

    // Crée l'instance de YT.Player à aprtir de l'iframe
    this.ytPlayer = new YT.Player(iframe.id)
  }

  pause() {
    console.log("pause() called")
    if (this.ytPlayer) {
      this.ytPlayer.pauseVideo()
    }
  }

  play() {
    console.log("play() called")
    if (this.ytPlayer) {
      this.ytPlayer.playVideo()
    }
  }



}
