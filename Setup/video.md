# Video

## Installation

- Positionner la caméra de façon a filmer les speakers sans gêner l'audience
- Installer le poste de captation où c'est pratique et sans gêne pour l'audience

## Branchement

                 I 4 3 2 1
laptop: o-HDMI-[-o|o.o.o.o]       : splitter 4x
                   | | | \-HDMI-o : projection principale
                   | | \---HDMI-o : projection secondaire
                   | \-----HDMI-o : projection terciaire
                   \-------HDMI-o : captation (laptop/screen)
camera: o------------------HDMI-o : captation (camera/speaker)

Selon la géométrie de la salle, les branchements se font, selon le cas :

- en HDMI direct si la distance est courte
- en SDI via le convertisseur HDMI vers SDI
  - les 2 convertisseurs HDMI vers SDI sont utilisables
  - on péférrera utiliser le 3G en priorité, capable de meilleur débit et alimenté via USB-C

‼️ATTENTION: la première sortie du splitter doit toujours être connectée au dispositif
de projection de la salle.

⚠️NOTE: le splitter est capable de scaler le flux en 1080p.
Activer via les 4 dipswitches les sorties qui doivent être scaler à 1080p.
En général, seules les sorties pour les boitiers de captation doivent être ON (scaler actif),
les autres doivent être laisser OFF (scaler inactif) saus en cas de pb.


## Pre-flight check J-2

- si pas déjà fait, ou en cas de mise à jour, télécharger les logiciels sur [le site du fabriquant](https://www.blackmagicdesign.com/fr/support/family/capture-and-playback)
  - Rechercher **Desktop Video 15.2** par exemple pour l'OS de destination
- s'assurer que les driver Blackmagic soit installés et opérationnel
  - sous Linux: dkms list, doit montrer 2 modules, sinon dkms build blackmagic-io/15.2, puis dkms install blackmagic-io/15.2
  - sous MacOS: suivre les capture d'écran en pj
- brancher la sortie HDMI de l'ordi de captation en entrée du splitter
- utiliser le bureau étendu pour diffuser un contenu sur l'écran supplémentaire
- brancher 2 sorties HDMI du splitter dans chaque boitier Blackmagic Recorder 3G
- s'assurer que le scaler est actif sur les sorties utilisées
- lancer OBS et constater la présence du contenu dans les 2 entrées vidéo (camera/laptop)

## Avant la session — Préparation

- confirmer le bon fonctionnement de l'ordinateur de présentation en direct sur le dispositif de projection
- placer ensuite le splitter entre l'ordinateur de présentation et le dispositif de projection et confirmer le bon fonctionnement avant de continuer les branchements
- confirmer le bon fonctionnement des entrées video 
- choisir la scène mixte adaptée à la situation (speaker à gauche ou à droite)
- positionner la scène mixte entre les 2 scènes speaker only et screen only
- lancer l'enregistrement ≈10min ou ≈5min avant la première prise de parole

## Durant la session

- selon le contenu de la présentation, choisir la bonne scène pour optimiser la compréhension du sujet
- arrêter l'enregistrement à l'issu des derniers applaudissements
- faire une copie de l'enregistrement sur disque dur externe
- vérifier la copie via md5sum par ex
