import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="session"
export default class extends Controller {
static targets = ["value", "hiddenCount", "hiddenPlaylist", "playlist"]
  connect() { 
     this.count = parseInt(this.valueTarget.textContent)
     this.max = 10
     this.min = 0
     this.updateHiddenFields()
  }
  increment(){
     if (this.count < this.max) {  
      this.count += 1
      this.valueTarget.textContent = this.count
      this.updateHiddenFields()
  }
}
  decrement(){
 if (this.count > this.min) { 
      this.count -= 1
      this.valueTarget.textContent = this.count
      this.updateHiddenFields()
    
  }

 
  }

  select (){
    this.updateHiddenFields()
  }
     updateHiddenFields() {
    if (this.hasHiddenCountTarget) this.hiddenCountTarget.value = this.count
    if (this.hasHiddenPlaylistTarget) {
      const selected = this.playlistTargets.find(radio => radio.checked)
      this.hiddenPlaylistTarget.value = selected ? selected.value : ""
    }
  }

  }
