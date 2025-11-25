# OBS

## Installation - À faire une fois pour préparer le poste de captation:

- Installer au préalable les logiciels accompagnant les boitiers de capture Blackmagic (Blackmagic Desktop Video)
- Lancer le logiciel Desktop Video Setup, ce dernier affichera les boitiers de captures connectés
- Brancher un premier boîtier de capture et constater sa présence dans le logiciel Desktop Video Setup
- Débrancher puis branche le deuxième boitier de capture et constater sa présence dans le logiciel Desktop Video Setup
- Brancher à nouveau le premier boîtier de capture et constater la présence des 2 boîtiers dans le loiciel Desktop Video Setup (l'écran n'affiche qu'un équipement à la fois, mais un chevron présent sur le côté permet de basculer de l'un à l'autre)
- Brancher la carte son en USB, aucun driver requis. Constater sa présence dans les périphériques de sortie son (USB Audio CODEC)

ℹ️NOTE: le logiciel Desktop Video Setup permet de donner un nom à chaque boîtier de captation.
le nom donné est stocker sur l'ordinateur et n'affecte pas le boitier (ie: à faire sur chaque nouvel ordi de captation)

### Importer les scènes — ⚠️ Expérimental

- Lancer OBS
- Importer les scénes depuis le fichier JSON `scene-chtijug.json`
- risque de ne pas fonctionner car des chemins sont absolus et les identifiant de matériel pourrait ne pas correspondre

### (Re)Construire les scènes

Une première scène: la plus éprouvante

- ajouter une scène
- renommer la scène **speaker screen 16:9**
- ajouter une source **Image**
- créer une nouvelle source nommée **bkgnd speaker screen 16:9**
- localiser le fichier image **&lt;worktree>/background/background_speaker_screen_16_9.png**
- vérouiller la source avec le 🔒
- ajouter une source **Périphérique Blackmagic**
- créer une nouvelle source nommée **laptop**
- sélectionner le boitier branché au laptop à présenter et le connecteur utilisé (SDI/HDMI)
- éditer la transformation (click droit > transformation > éditer la transformation)
  - suivre les informations sur la capture d'écran
- vérouiller la source avec le 🔒
- créer une nouvelle source nommée **camera**
- sélectionner le boitier branché au camescope et le connecteur utilisé (SDI/HDMI)
- éditer la transformation (click droit > transformation > éditer la transformation)
  - suivre les informations sur la capture d'écran
- vérouiller la source avec le 🔒

Deux scènes rapides à mettre en place

- ajouter une scène
- renommer la scène **full screen**
- ajouter une source **Périphérique Blackmagic**
- ajouter la source existante **laptop**
- éditer la transformation (click droit > transformation > éditer la transformation)
  - suivre les informations sur la capture d'écran
- vérouiller la source avec le 🔒
- ajouter une scène
- renommer la scène **full speaker**
- ajouter une source **Périphérique Blackmagic**
- ajouter la source existante **camera**
- éditer la transformation (click droit > transformation > éditer la transformation)
  - suivre les informations sur la capture d'écran
- vérouiller la source avec le 🔒

Une scène miroir de la première

- ajouter une scène
- renommer la scène **screen 16:9 speaker**
- ajouter une source **Image**
- créer une nouvelle source nommée **bkgnd screen 16:9 speaker**
- localiser le fichier image **&lt;worktree>/background/background_screen_16_9_speaker.png**
- vérouiller la source avec le 🔒
- ajouter une source **Périphérique Blackmagic**
- ajouter la source existante **laptop**
- éditer la transformation (click droit > transformation > éditer la transformation)
  - suivre les informations sur la capture d'écran
- vérouiller la source avec le 🔒
- ajouter une source **Périphérique Blackmagic**
- ajouter la source existante **camera**
- éditer la transformation (click droit > transformation > éditer la transformation)
  - suivre les informations sur la capture d'écran
- vérouiller la source avec le 🔒

Deux scènes en option pour le format 16:10 le cas échéant (en option)

- ajouter une scène
- renommer la scène **screen 16:10 speaker**
- ajouter une source **Image**
- créer une nouvelle source nommée **bkgnd screen 16:10 speaker**
- localiser le fichier image **&lt;worktree>/background/background_screen_16_10_speaker.png**
- vérouiller la source avec le 🔒
- ajouter une source **Périphérique Blackmagic**
- ajouter la source existante **laptop**
- éditer la transformation (click droit > transformation > éditer la transformation)
  - suivre les informations sur la capture d'écran
- vérouiller la source avec le 🔒
- ajouter une source **Périphérique Blackmagic**
- ajouter la source existante **camera**
- éditer la transformation (click droit > transformation > éditer la transformation)
  - suivre les informations sur la capture d'écran
- vérouiller la source avec le 🔒

## Avant la session

- Brancher les équipements (captation video + carte son)
- Lancer OBS et constater le bon fonctionnement de ce dernier
  - les 2 sources sont visibles dans les scènes mixte (speaker + screen)
  - Dans le **mélangeur audio** > **source Mix/Aux**,  ⠇, **propriétés**, le périphériques indiqué doit être USB Audio CODEC
- lancer l'enregistrement avec un peu d'avance (~5 min avant le début de la séance)

### Troubleshooting

- ❓ Les images sont inversées, le speaker est à la place de l'écran, l'écrant est à la place du speaker
- ➡️ inverser les branchements, en cas de résultat identique, changer la source dans OBS

## Durant la session

### Son

- veiller à ce que le niveau sonore reste dans la zone jaune ou verte presque jaune
- éviter la zone rouge, le signal risque de clipper est être déterioré définitivement
- il vaut mieux un son trop faible qu'un son détruit
  - dans le premier cas il sera possible de monter le niveau de son en post-production (ffmpeg FTW!)
  - dans le deuxième cas, baisser le son en post-production ne pourra rien contre les dégradations du signal

### Image

- Éviter de bouger la camera trop fréquement, cela favorise le mal des trasnports à la relecture
- Si le/la speakeur•e devait beaucoup bouger, élargir le plan (zoom out) pour couvrir la zone et mettre la scéne en plein écran (full speaker)
- Laisser 3 à 5 secondes s'écouler après une transition pour changer à nouveau de scène
