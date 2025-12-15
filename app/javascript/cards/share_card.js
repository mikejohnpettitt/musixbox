// Partage des résultats
window.shareResults = function () {
  if (navigator.share) {
    navigator.share({
      title: "Mes résultats MusixBox",
      text: "J'ai terminé ma session sur MusixBox ! 🎵",
      url: window.location.href,
    }).catch((err) => {
      console.error("Erreur partage:", err);
    });
  } else {
    navigator.clipboard
      .writeText(window.location.href)
      .then(() => alert("Lien copié ! Collez-le pour partager."))
      .catch((err) => {
        console.error("Erreur copie lien:", err);
        alert("Impossible de copier le lien.");
      });
  }
};

// Sauvegarde de la card en image
window.savePhoto = function () {
  const cardElement = document.querySelector(".card-result");

  if (!cardElement) {
    alert("Pas de card à sauvegarder");
    return;
  }

  if (typeof html2canvas === "undefined") {
    console.error("html2canvas n'est pas chargé");
    alert("Erreur: html2canvas n'est pas chargé");
    return;
  }

  html2canvas(cardElement, {
    scale: 2,
    backgroundColor: "#0f0f0f", // ou la couleur de fond de ta page
  })
    .then((canvas) => {
      const imageData = canvas.toDataURL("image/png");
      const link = document.createElement("a");
      link.href = imageData;
      link.download = `musixbox_${Date.now()}.png`;
      document.body.appendChild(link);
      link.onclick = () => {
        document.body.removeChild(link);
      };
      link.click();
    })
    .catch((error) => {
      console.error("Erreur de capture:", error);
      alert("Erreur lors de la sauvegarde");
    });
};
