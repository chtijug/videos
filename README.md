# Vidéos du Ch'ti JUG

Début 2018, [Guillaume](https://twitter.com/GuillaumeWallet) nous a proposé de recommencer la production des vidéos des sessions du JUG.
Nous allons détailler içi notre système de capture son et vidéo et notre manière de monter les vidéos.

Ce document n'a pas la prétention de donner des leçons, nous avançons de manière pragmatique, en faisant des erreurs.

## Objectifs

Notre objectif est de diffuser les vidéos sur Youtube pour

* Permettre à notre communauté de voir les sessions manquées.
* Permettre aux participants de revoir d'anciennes sessions.
* Permettre à l'orateur d'avoir une audience plus large.

En terme de contenu, nous mettons la priorité sur la voix de l'orateur et sur la capture du signal vidéo de l'ordinateur de présentation.
Nous souhaitons perturber le moins possible la session en elle même, quand on vient au Ch'ti JUG on assiste à une session enregistrée, pas à l'enregistrement d'une vidéo.
Nous voulons également éviter d'imposer des prérequis à l'orateur, type installer un logiciel sur son ordinateur.

## Matériel d'enregistrement

### Enregistrement de la voix de l'orateur

Nous avons hérité d'un système de transmission sans fil de marque Sennheiser composé d'un émetteur de poche SK 2 et d'un récepteur EM 1.

Nous avons ajouté un micro serre tête [the t.bone HeadmiKe - D EW](https://www.thomann.de/fr/the_tbone_headmike_d_ew.htm).

Nous verrons sur le long terme si ce matériel est suffisant, la qualité de la prise de son étant le sujet le plus important.

### Capture de l'ordinateur de l'orateur

En 2014, le JUG a acheté un boitier [Epiphan lecture recorder x2](https://www.epiphan.com/products/lecture-recorder-x2/), il a été utilisé pour diffuser les sessions sur le défunt Parleys.
Le boitier permet la capture du signal vidéo de l'ordinateur de l'orateur, que ce soit des diapositives, une session de programmation en direct ou encore une démonstration.

Nous utilisons donc ce boitier qui dispose d'une entrée et d'une sortie DVI et d'une entrée et d'une sortie jack 3,5mm.

Nous branchons le récepteur de micro sans fil sur le boitier, la voix de l'orateur est donc enregistrée sur la vidéo de capture de son ordinateur.

Comme la connectique du boitier est en DVI, nous avons une magnifique collection d'adaptateurs (tout vers DVI et DVI vers VGA et HDMI)

### Caméra pour enregistrer l'orateur

Nous avons acheté une caméra [JVC GC-PX100BEU](http://fr.jvc.com/camescopes/camera/GC-PX100BEU/), posée sur un trépied [Manfrotto](https://www.manfrotto.fr/compact-action-blanc-trepied-rotule-joystick)

## Montage

Notre but est de réduire cette phase au maximum, afin de limiter la charge de travail après une session.

Idéalement nous aimerions supprimer cette étape, comme nos amis du [BreizhCamp](https://github.com/breizhcamp/camaaloth) avec qui nous avons pas mal échangé (merci).

Dès le début, [Guillaume](https://twitter.com/GuillaumeWallet)  était persuadé que [ffmpeg](http://ffmpeg.org/) pourrait faire le boulot ... et il était dans le vrai. Il a donc complètement scripté le montage, avec séquence d'intro, incrustation des deux vidéos au dessus d'une image de fond.

Vous trouverez le script de la session de Février 2018 (sous forme de Makefile 😳) [ici](https://github.com/chtijug/videos/blob/master/2018-02/Makefile).

La seule étape manuelle est de trouver le point de synchro entre les deux vidéos (capture ordinateur et caméra) ainsi que les moments ou démarrer et arrêter le montage.

## Journal

### ✅ Février 2018, Kotlin

* Galères d'installation, branchement du boitier à l'envers 😱
* Image qui "tremble" sur le projecteur
* Voix de l'orateur qui sature (trop de gain)
* L'orateur sous exposé sur la vidéo
* Batterie de la caméra qui lâche à 60s de la fin 😡.
* Fin de la vidéo un peu brutale, pas d'applaudissements.
* Gros point positif: [la vidéo est utilisable](https://www.youtube.com/watch?v=GdQec3-xqjU), nous la publions à J+3 .

## Futur

Pour le moment nous allons essayer d'exploiter le matériel à notre disposition, roder notre installation, le réglage du son et de la caméra.

Nous envisageons d'ajouter une table de mixage pour contrôler et ajuster le son pendant la session.

Nous aimerions détecter automatiquement le point de synchro entre les différents flux.

Pour le moment nous ne pouvons pas enregistrer les voix de deux orateurs, ou alors sur un troisième flux (micro cravate et smartphone).