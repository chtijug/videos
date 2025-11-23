# Son

Vocabulaire:

- l'orientation des potentiomètres peut être vu selon la direction des aiguilles d'une horloge à cadran
  - 12h pointant vers le haut, représentant souvant le mi chemin entre les 2 positions extrèmes
  - 12h pouvant être, selon le cas, 50% (entre 0 et 100%) ou 0 (entre -15dB et +15dB)
  - les potentiomètres vont de 7h (0% ou -15dB, en bas à gauche) à 5h (100% ou +15dB, en bas à droite) en le tournant dans le sens horaire

- toutes les graduations des potentiomètres sont au nombre de 10
  - un cran ≈ 10%
  - deux crans ≈ 20% correspondant à 09h
  - huit crans ≈ 80% correspondant à 03h

- les intérupteurs sont des push/push
  - pousser pour engager
  - pousser pour désengager

- un intérupteur est dit engagé quand il apparaît en position basse, proche de la platine
- un intérupteur est dit désengagé quand il apparaît en position haute, la plus éloignée de la platine
- certains intérupteurs servent de rupteur (ON/OFF)
- d'autres servent à diriger l'information dans une direction ou un autre (A/B)

## Installation

- Positionner les baffles de manière à sonoriser l'audience
- Éviter tout propagation du son en direction des micros
- Diffuser un peu de musique via Bluetooth pour prérégler le niveau de sortie
  compte tenu du volume et de la géométrie de la salle

## Branchement

- Les 4 micros sur les lignes 1 à 4
  - respecter le code
- Les 2 bafles sur les sorties XLR MAIN OUTPUT
- Le casque de monitoring sur la prise PHONES

## Réglage Initial

### Entrées Lignes 1-4

Lignes 1 & 2: micros sucette
Lignes 3 & 4: micros diadème

- low cut filter: engagé
- gain: 50% (12h)
- compresseur: 0%
- high freq: -15dB (07h)
- mid freq: 20% (09h)
- low freq: 20% (09h)
- aux: 0 (12h)
- FX POST: -∞
- PAN: centre (12h)
- Mute/ALT 3-4: engagé
- Fader: -∞ (en bas)

### Entrées Lignes 5/6 & 7/8

Non utilisées.
Pourrait servir à diffuser du contenu sonore supplémentaire.

- level +4/-10: engagé (-10dB)
- high freq: -15dB (07h)
- mid freq: 20% (09h)
- low freq: 20% (09h)
- aux: 0 (12h)
- FX POST: -∞
- PAN: centre (12h)
- Mute/ALT 3-4: engagé
- Fader: -∞ (en bas)

### Sortie ALT 3-4

- Fader: -∞ (en bas)

### Sortie MAIN MIX

- Fader: -∞ (en bas)

### Routage Source -> Phones/CTRL ROOM

Pour choisir la source à monitorer avec le casque branché dans Phones

- 2-TR/USB (rouge): désengagé
- ALT 3-4 (noir): désengagé
- MAIN MIX: engagé
- potard Phones/CTRL ROOM: 20% (09h)

⚠️NOTE: Le vu-mètre mesure la sortie monitoring/CTRL ROOM.
Le main mix n'est pas concerné par le vu-mètre.

### Routage 2-TR/USB TO MAIN

- désengagé

### AUX Send / Stereo AUX Return

Non utiliser

- laisser les potards à 0 (12h)
- desengager 🔺 main mix / 🔻 ALT 3-4

## Avant la session — Étalonnage

- Monter les fader MAIN MIX droit/gauche vers -5dB/0dB (volume de référence)
  - vers -5dB pour laisser un peu de place pour ajuster le volume durant la session

Répéter la procédure suivante pour chaque micro:

- désengager la sourdine du micro à étalonner
- monter le fader de la ligne jusqu'au niveau désiré
- le son doit sortir des enceintes de sonorisation
- le son doit être perçu dans OBS
  - le niveau de son dans OBS doit atteindre la zone jaune (≈ [-20dB, -10dB])
- si le niveau en salle est toujours insuffisant à 0dB
  - rapprocher le micro / parler plus fort
  - augmenter légèrement le volume son des baffles (⚠️ feedback ⚠️)
  - en dernier recours, augmenter légèrement le niveau de gain d'entrée (premier potard depuis la prise)
- vérifier une dernière fois le niveau dans OBS
- engagé à nouveau la sourdine du micro en attendant le début de la session.

ℹ️ NOTE: Ajuster les niveaux des micros grace au fader de chaque ligne
permet d'ajuster l'équilibre entre le volume sonore des intervenants.

ℹ️ NOTE: En cas de duo speaker,
utiliser le potard de panoramique des micros pour répartir légèrement les voix droite/gauche

## Durant la session

- Prendre garde aux boucles de feedback (effet larsen)
- Veiller au bon niveau d'entrée dans OBS
  - actionner pour cela les fader MAIN MIX uniquement
