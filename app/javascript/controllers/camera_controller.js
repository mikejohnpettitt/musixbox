// ============================================
// IMPORT DU FRAMEWORK STIMULUS
// ============================================
// On importe "Controller" de Stimulus (framework Rails pour gérer l'interactivité)
import { Controller } from "@hotwired/stimulus"

// ============================================
// CRÉATION DE LA CLASSE (le cœur du contrôleur)
// ============================================
// "export default class extends Controller" = on crée une classe qui hérite de Controller
// C'est comme un "modèle" qui va gérer toute la logique de la caméra
export default class extends Controller {

  // ============================================
  // DÉFINITION DES "TARGETS" (les éléments HTML à contrôler)
  // ============================================
  // Ces targets correspondent aux `data-camera-target="..."` dans ta vue HTML
  // Grâce à ça, on peut accéder à ces éléments facilement : this.videoTarget, this.canvasTarget, etc.
  static targets = ["video", "canvas", "preview", "cardWrapper", "cardPhoto"]

  // ============================================
  // PROPRIÉTÉS DE LA CLASSE (variables globales du contrôleur)
  // ============================================
  // "stream" = le flux vidéo de la caméra (on le stocke pour pouvoir l'arrêter plus tard)
  stream = null
  
  // "photoData" = la photo en format base64 (utilisée pour l'affichage et le téléchargement)
  photoData = null

  // ============================================
  // MÉTHODE 1 : DÉMARRER LA CAMÉRA
  // ============================================
  // Cette méthode est appelée quand on clique sur "Démarrer caméra"
  // "async" = la fonction peut attendre des résultats asynchrones (comme l'accès à la caméra)
  async startCamera(event) {
    // event.preventDefault() = empêche le comportement par défaut du bouton
    event.preventDefault()
    
    // "try/catch" = on essaie quelque chose, et si ça échoue, on gère l'erreur
    try {
      // On demande l'accès à la caméra de l'utilisateur
      // "await" = on attend que la caméra soit accessible avant de continuer
      // "{ video: true }" = on veut juste la vidéo, pas l'audio
      this.stream = await navigator.mediaDevices.getUserMedia({ video: true })
      
      // On affecte le flux vidéo à l'élément <video> HTML
      // Ça va afficher la caméra dans la vidéo
      this.videoTarget.srcObject = this.stream
      
      // On affiche l'élément vidéo (il était caché au départ avec display: none)
      this.videoTarget.style.display = "block"
      
      // On affiche les boutons "Prendre photo" et "Reprendre"
      this.showButton("capturePhoto")
      this.showButton("retakePhoto")
      
      // Message dans la console (pour déboguer)
      console.log("Caméra démarrée !")
      
    } catch (error) {
      // Si une erreur se produit (ex: caméra refusée), on affiche une alerte
      alert("Erreur caméra: " + error.message)
    }
  }

  // ============================================
  // MÉTHODE 2 : PRENDRE UNE PHOTO
  // ============================================
  // Cette méthode est appelée quand on clique sur "Prendre photo"
  capturePhoto(event) {
    event.preventDefault()
    
    // On récupère le contexte du canvas (l'outil pour dessiner sur le canvas)
    // "2d" = on veut dessiner en 2D (pas en 3D)
    const context = this.canvasTarget.getContext("2d")
    
    // On règle la largeur du canvas à la même que la vidéo
    this.canvasTarget.width = this.videoTarget.videoWidth
    
    // On règle la hauteur du canvas à la même que la vidéo
    this.canvasTarget.height = this.videoTarget.videoHeight
    
    // On "dessine" l'image actuelle de la vidéo sur le canvas
    // C'est comme une capture d'écran du flux vidéo
    context.drawImage(this.videoTarget, 0, 0)
    
    // On convertit le canvas en image JPEG et on le stocke en format base64
    // "base64" = un format texte pour encoder une image
    const photoData = this.canvasTarget.toDataURL("image/jpeg")
    
    // On cache l'image de preview (si elle était visible)
    this.previewTarget.style.display = "none"
    
    // On cache la vidéo (plus besoin de la voir après la photo)
    this.videoTarget.style.display = "none"
    
    // On arrête le flux vidéo (libère la caméra)
    this.stopStream()
    
    // On cache le bouton "Prendre photo"
    this.hideButton("capturePhoto")
    
    // On affiche la card avec les résultats
    this.cardWrapperTarget.style.display = "block"
    
    // On met la photo dans l'image de la card
    this.cardPhotoTarget.src = photoData
    
    // On affiche la photo dans la card
    this.cardPhotoTarget.style.display = "block"
    
    // On stocke la photo pour pouvoir la télécharger plus tard
    this.photoData = photoData
    
    // Message dans la console
    console.log("Photo prise !")
  }

  // ============================================
  // MÉTHODE 3 : REPRENDRE UNE PHOTO
  // ============================================
  // Cette méthode est appelée quand on clique sur "Reprendre"
  retakePhoto(event) {
    event.preventDefault()
    
    // On affiche de nouveau la vidéo
    this.videoTarget.style.display = "block"
    
    // On cache l'image de preview
    this.previewTarget.style.display = "none"
    
    // On cache la card
    this.cardWrapperTarget.style.display = "none"
    
    // On affiche de nouveau le bouton "Prendre photo"
    this.showButton("capturePhoto")
    
    // On redemande l'accès à la caméra pour reprendre une vidéo
    navigator.mediaDevices.getUserMedia({ video: true })
      // ".then()" = quand la caméra est accessible, on exécute cette fonction
      .then(stream => {
        // On stocke le nouveau flux vidéo
        this.stream = stream
        
        // On affiche le flux vidéo dans l'élément <video>
        this.videoTarget.srcObject = stream
      })
    
    // Message dans la console
    console.log("Recommencer !")
  }

  // ============================================
  // MÉTHODE UTILITAIRE : CACHER UN BOUTON
  // ============================================
  // "action" = le nom de l'action (ex: "capturePhoto", "retakePhoto")
  hideButton(action) {
    // On cherche le bouton avec l'action spécifiée
    // `[data-action="click->camera#${action}"]` = cherche le bouton avec cette action
    // "``" (template literal) = permet d'insérer des variables dans du texte
    const button = this.element.querySelector(`[data-action="click->camera#${action}"]`)
    
    // Si le bouton existe, on le cache
    if (button) button.style.display = "none"
  }

  // ============================================
  // MÉTHODE UTILITAIRE : AFFICHER UN BOUTON
  // ============================================
  // Même chose que hideButton, mais on affiche au lieu de cacher
  showButton(action) {
    // On cherche le bouton avec l'action spécifiée
    const button = this.element.querySelector(`[data-action="click->camera#${action}"]`)
    
    // Si le bouton existe, on l'affiche
    // "display: block" = le bouton occupe toute la largeur disponible
    if (button) button.style.display = "block"
  }

  // ============================================
  // MÉTHODE UTILITAIRE : ARRÊTER LA CAMÉRA
  // ============================================
  // Cette méthode libère les ressources de la caméra
  stopStream() {
    // On vérifie que le stream existe (qu'on a bien une caméra)
    if (this.stream) {
      // "getTracks()" = récupère tous les flux (vidéo, audio, etc.)
      // ".forEach()" = on boucle sur chaque flux
      this.stream.getTracks().forEach(track => {
        // "track.stop()" = on arrête chaque flux
        track.stop()
      })
    }
  }

  // ============================================
  // MÉTHODE STIMULUS SPÉCIALE : NETTOYAGE
  // ============================================
  // "disconnect()" est appelée automatiquement par Stimulus quand le contrôleur est déchargé
  // (ex: quand tu quittes la page)
  disconnect() {
    // On arrête la caméra pour libérer les ressources
    this.stopStream()
  }

  // ============================================
  // MÉTHODE 4 : TÉLÉCHARGER LA PHOTO
  // ============================================
  // Cette méthode est appelée quand on clique sur "Save to phone"
  downloadPhoto(event) {
    event.preventDefault()
    
    // On vérifie qu'on a bien une photo à télécharger
    if (!this.photoData) {
      alert("Pas de photo à télécharger")
      return
    }
    
    // On crée un élément <a> (lien) invisible
    // C'est un "trick" pour forcer le téléchargement
    const link = document.createElement("a")
    
    // On met la photo comme lien (en base64)
    link.href = this.photoData
    
    // On donne un nom au fichier téléchargé
    // "photo_" + timestamp = ex: "photo_1701604800000.jpg"
    link.download = `photo_${Date.now()}.jpg`
    
    // On ajoute le lien au body (nécessaire pour que le click fonctionne)
    document.body.appendChild(link)
    
    // On simule un click sur le lien (ça lance le téléchargement)
    link.click()
    
    // On supprime le lien du body (nettoyage)
    document.body.removeChild(link)
  }

  // ============================================
  // MÉTHODE 5 : PARTAGER SUR INSTAGRAM
  // ============================================
  // Cette méthode est appelée quand on clique sur "Share"
  shareToInstagram(event) {
    event.preventDefault()
    
    // On vérifie qu'on a bien une photo à partager
    if (!this.photoData) {
      alert("Pas de photo à partager")
      return
    }
    
    // On convertit la photo base64 en blob (format fichier)
    // "blob" = un fichier en mémoire qu'on peut partager
    const blob = this.dataURItoBlob(this.photoData)
    
    // On crée un fichier à partir du blob
    const file = new File([blob], `photo_${Date.now()}.jpg`, { type: "image/jpeg" })
    
    // On vérifie si le navigateur supporte l'API Web Share
    // "navigator.share" = fonction de partage native du téléphone
    if (navigator.share) {
      // On partage le fichier directement (ça ouvre les options de partage)
      navigator.share({
        files: [file],
        title: "Ma photo",
        text: "Regarde ma photo prise avec Musixbox !"
      })
        .then(() => console.log("Photo partagée !"))
        .catch(err => console.error("Erreur de partage:", err))
    } else {
      // Si le navigateur ne supporte pas Web Share (ex: desktop)
      alert("Le partage n'est pas supporté sur ce navigateur. Utilise 'Save to phone' d'abord.")
    }
  }

  // ============================================
  // MÉTHODE UTILITAIRE : CONVERTIR BASE64 EN BLOB
  // ============================================
  // "base64" = format texte pour l'image
  // "blob" = format fichier binaire qu'on peut partager
  dataURItoBlob(dataURI) {
    // On récupère la partie data de l'image (après "data:image/jpeg;base64,")
    const byteString = atob(dataURI.split(',')[1])
    
    // On crée un tableau de bytes à partir de la chaîne
    const ab = new ArrayBuffer(byteString.length)
    const ia = new Uint8Array(ab)
    
    for (let i = 0; i < byteString.length; i++) {
      ia[i] = byteString.charCodeAt(i)
    }
    
    // On crée et on retourne le blob
    return new Blob([ab], { type: 'image/jpeg' })
  }
}