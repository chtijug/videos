# Vidéos du Ch'ti JUG

Début 2018, [Guillaume](https://twitter.com/GuillaumeWallet) nous a proposé de recommencer la production des vidéos des sessions du JUG.
Nous allons détailler içi notre système de capture son et vidéo et notre manière de monter les vidéos.

Ce document n'a pas la prétention de donner des leçons, nous avançons de manière pragmatique, en faisant des erreurs.

## Objectif

Notre objectif est de (re)diffuser les vidéos sur Youtube pour

* Permettre à notre communauté de voir les sessions manquées.
* Permettre aux participants de revoir d'anciennes sessions.
* Permettre à l'orateur d'avoir une audience plus large.

En terme de contenu, nous mettons la priorité sur la voix de l'orateur et sur la capture du signal vidéo de l'ordinateur de présentation.
Nous souhaitons perturber le moins possible la session en elle même, quand on vient au Ch'ti JUG on assiste à une session enregistrée, pas à l'enregistrement d'une vidéo.
Nous voulons également éviter d'imposer des prérequis à l'orateur, type installer un logiciel sur son ordinateur.

## Matériel d'enregistrement

### Enregistrement de la voix de l'orateur·trice

Nous avons hérité d'un système de transmission sans fil de marque Sennheiser composé d'un émetteur de poche SK 2 et d'un récepteur EM 1.
Nous avons trouver sur le marché de l'occasion un deuxième kit nous servant pour la capture d'un éventuellement deuxième speaker ou, à défaut, de spare en cas de souci.
Les deux seront mixés sur une mini table de mixage [Behringer Xenyx 502](https://www.thomann.de/fr/behringer_xenyx_502.htm) si besoin.

Nous avons ajouté un micro serre tête [the t.bone HeadmiKe - D EW](https://www.thomann.de/fr/the_tbone_headmike_d_ew.htm).

Nous verrons sur le long terme si ce matériel est suffisant, la qualité de la prise de son étant le sujet le plus important.

### Capture de l'ordinateur de l'orateur·trice

#### Depuis Octobre 2022

Après plusieurs déboires avec notre vénérable [Epiphan lecture recorder x2](https://www.epiphan.com/products/lecture-recorder-x2/), nous avons décidé de passer à l'étape supérieure: la réalisation live.

Inspirés par d'autres (comme nos amis du [BreizhCamp](https://github.com/breizhcamp/camaaloth) par exemple, merci encore les gars 🙂) nous avons transformé la chaîne comme suit:

 - enregistrement et réalisation avec [OBS](https://obsproject.com/) sur une machine tournant avec [Fedora Workstation](https://getfedora.org/fr/workstation/) 36
 - captation des flux vidéos avec deux boîtiers AVerMedia: [ExtremeCAP HDMI/USB 3.0](https://www.avermedia.com/fr/product-detail/BU110) et  [ExtremeCAP SDI/USB 3.0](https://www.avermedia.com/fr/product-detail/BU111)
 - un splitter HDMI pour faire un Y en sortie du laptop de présentation et envoyer un signal propre au système de diffusion de la salle de conférence tout en en captant une copie
 - un [convertisseurs HDMI → SDI](https://www.blackmagicdesign.com/fr/products/microconverters/techspecs/W-CONU-11) pour permettre de faire "courir" le signal vidéo de notre choix sur une "longue" distance grâce à un cable SDI de 20m
 - une [carte son externe USB](https://focusrite.com/fr/usb-audio-interface/scarlett/scarlett-2i2) avec deux entrées, une pour chaque conférencier·e (sachant que nous n'avons que deux micros) et une sortie de monitoring nous permettant de diffuser dans la salle quand cette dernière est sonorisée

Cela nous ouvre plusieurs possibilités en fonction de la salle qui accueille l'évènement, parmi lesquelles :

 - être posé discrètement (idéalement en fond de salle derrière l'auditoire) et loin des conférencier·e·s avec OBS et la caméra pour une réalisation à 1 personne
 - être séparés avec OBS proche des conférencier·e·s et donc loin de la caméra pour une réalisation à deux cette fois
 - … *et plus si affinité* …

Cela nous ferme aussi une possibilité (pour le moment) :

 - fini la sécurité de pouvoir au moins rediffuser l'écran seul avec l'audio dans le cas d'un pépin avec OBS par exemple, ce que nous pouvions faire avec le recorder

La chaîne se complexifiant, il nous reste encore des ajustements à faire; notamment envisager une solution de repli nous permettant de sécuriser chaque flux indépendamment d'OBS.
Nous aimerions pouvoir faire l'équivalent d'un `tee` avec les flux vidéos et audio afin d'en conserver une copie de sauvegarde en amont d'OBS et pouvoir, le cas échéant, faire un montage à posteriori, comme nous le faisions avant. La piste à creuser est l'utilisation de [V4L2 Loopback](https://github.com/umlaeute/v4l2loopback) et de notre couteau suisse du multimédia: ffmpeg (et peut-être une bonne dose de script shell aussi … (^_^') ).
Affaire à suivre 🙂

#### Avant Octobre 2022

En 2014, le JUG a acheté un boîtier [Epiphan lecture recorder x2](https://www.epiphan.com/products/lecture-recorder-x2/), il a été utilisé pour diffuser les sessions sur le défunt Parleys.
Le boîtier permet la capture du signal vidéo de l'ordinateur de l'orateur, que ce soit des diapositives, une session de programmation en direct ou encore une démonstration.

Nous utilisons donc ce boîtier qui dispose d'une entrée et d'une sortie DVI et d'une entrée et d'une sortie jack 3,5mm.

Nous branchons le récepteur de micro sans fil sur le boîtier, la voix de l'orateur est donc enregistrée sur la vidéo de capture de son ordinateur.

Comme la connectique du boîtier est en DVI, nous avons une magnifique collection d'adaptateurs (tout vers DVI et DVI vers VGA et HDMI)

### Caméra pour enregistrer l'orateur

Nous avons acheté une caméra [JVC GC-PX100BEU](http://fr.jvc.com/camescopes/camera/GC-PX100BEU/), posée sur un trépied [Manfrotto](https://www.manfrotto.fr/compact-action-blanc-trepied-rotule-joystick)

## Montage (Avant Octobre 2022)

Notre but est de réduire cette phase au maximum, afin de limiter la charge de travail après une session.

Idéalement nous aimerions supprimer cette étape, comme nos amis du [BreizhCamp](https://github.com/breizhcamp/camaaloth) avec qui nous avons pas mal échangé (merci).

Dès le début, [Guillaume](https://twitter.com/GuillaumeWallet)  était persuadé que [ffmpeg](http://ffmpeg.org/) pourrait faire le boulot ... et il était dans le vrai. Il a donc complètement scripté le montage, avec séquence d'intro, incrustation des deux vidéos au dessus d'une image de fond.

Vous trouverez le script de la session de Février 2018 (sous forme de Makefile 😳) [ici](https://github.com/chtijug/videos/blob/master/2018-02/Makefile).

La seule étape manuelle est de trouver le point de synchro entre les deux vidéos (capture ordinateur et caméra) ainsi que les moments ou démarrer et arrêter le montage.

## Journal

### ✅ Novembre 2022, Gravitee : From developers to entrepreneurs

* Rien à faire ici, la captation live est assurée par les équipes de notre hôte Euratechnologies, merci à eux.
* Nous [publions à J+1](https://youtu.be/r9owlF1_c1k)

### ✅ Octobre 2022, L’architecture Micro-Front, un levier pour la webperf ?

* 🎉 We did it! 🎉 le studio ambulant de captation a fait ses premiers pas et quelle satisfaction !
* durant la session, il nous aura fallu être à deux pour gérer à la fois le cadrage et la réalisation, les deux postes étant éloignés l'un de l'autre
* petite exercice de post production pour cette fois en occultant les URLs affichées dans les bares d'adresses, ffmpeg a encore une fois fait montre de ses capacités 🙂👍
* Nous [publions à J+7](https://youtu.be/gVKw3C6l7kQ) avec l'accord de nos speakers

### ✅ Juin 2022, 1M de messages / CPU / Go avec Kafka Micro Messaging Reactive

* Gros pb de souffle pendant l'enregistrement dont la source venait de notre setup, ce qui s'est ressenti pendant le talk, ce qui a rompu notre serment d'invisibilité 😠; nous renouvelons nos excuses auprès de Loïc MATHIEU pour la gène occasionnée 😔
* En conséquence, nous établirons une nouvelle stack pour la captation de la prochaine séance … 😈
* Congés obligent, nous [publions à J+14](https://youtu.be/ho1gJ8REnQg)

### ✅ Avril 2022, Quarkus et Operateur Kubernetes en Java (et avec Quarkus)

* Un problème de diffusion sur le projecteur mettant en cause notre bon vieux Lecture Recorder nous à contraint à abandonner la capture d'écran
* Cependant, nous avons pu faire une capture du son que nous retransmettons en live dans la salle avec un sacré Win-Win: nous capturons le son, nos speakers ont les mains libres pour coder/causer 🙂👍
* Double session donc, et voici les résultats que nous publions à J+2: [Clément Escoffier](https://youtu.be/cu8LQ4_367M) et [Sébastien Blanc](https://youtu.be/4XkIN3Gdlks)

NB: La capture son de nos 2 speakers est réalisée grâce à notre deuxième transmetteurs sans fil Sennheiser (initialement un spare chiner sur le marche de l'occasion)
mixer avec le premier sur cette [petite table de mixage](https://www.thomann.de/fr/behringer_xenyx_502.htm).

### ✅ Septembre 2021, Java 17

* Rien à faire ici, la captation live est assurée par les équipes de notre hôte Euratechnologies, merci à eux.
* Nous [publions à J+1](https://youtu.be/dunoZF1rs7o)

### ✅ Février 2020, Machine learning en prod

* Rien à faire ici, la captation live est assurée par les équipes de notre hôte Euratechnologies, merci à eux.
* Nous [publions à J+2](https://youtu.be/B7Qnsd1XRLQ)

### ✅ Décembre 2019, Redis du Clé/Valeur au Multi-Modèle

* Encore un problème de son, nous devons recourir une fois de plus à la captation caméra en lieu et place de la captation micro 😠, [nous publions là](https://youtu.be/JL1DVrNxfWo)

### ✅ Novembre 2019, Pourquoi Gradle ?

* Encore un problème de réglage son, nous devons recourir à la captation caméra en lieu et place de la captation micro 😠, [nous publions après une semaine de bidouille](https://youtu.be/KAr28fysEDA)

### ✅ Octobre 2019, les 10 ans!

* Double session pour cette soirée spéciale enregistrée à Euratechnologies
* Première partie: [Emmanuel Bernard](https://youtu.be/UB-pRJgGhZc)
* Deuxième partie: [Shirley Almosni Chiche](https://youtu.be/01aXo9GXGV0)

### ✅ Septembre 2019, Securing your API from basics to beyond

* Premier enregistrement effectué dans les locaux d'EFFICOM Lille, r.a.s., [nous publions à J+1](https://youtu.be/01aXo9GXGV0)

### ✅ Mai 2019, To be or not to be Serverless

* Premier enregistrement effectué dans l'amphi de Decathlon Campus, avec son capturé en sortie de sono, [nous publions à J+6](https://youtu.be/k2xFh_eH7Dk)

### ✅ Février 2019, Au delà de Java 8: Embrassez les nouvelles versions de Java

* Le cadrage n'était pas simple mais la solution trouvée offre un bon compromis, [nous publions à J+2](https://youtu.be/tWoyXjVQRCk)

### ✅ Janvier 2019, Spring Boot Kofu et coroutines

* Nouvelle année et nouveau masque, la vidéo du speaker est positionné sur la gauche.
* L'assemblage trouvé est satisfaisant, [nous publions à J+1](https://youtu.be/IuIR_xgfUV0)

### ✅ Juin 2018, Kafka

* Le stagiaire ayant oublié d'allumer la caméra pour filmer le speaker pendant une dizaine de minutes, il nous faut un nouveau montage pour faire illusion ;P
* L'assemblage trouvé est satisfaisant, [nous publions à J+3](https://youtu.be/TPmzBekhdy4)

### ✅ Mai 2018, SQL + PostgreSQL

* Cette fois-ci, nous nous reposons sur le matériel et l'équipe technique, oui on _cheat_ :)
* Reste à monter un peu différemment car les slides sont en 4:3
* Les rushs sont énormes et il nous faudra un peu de temps pour en assurer la récupération, [nous publions quand même](https://youtu.be/YJScBvT0bxg)

### ✅ Avril 2018, Docker + Kubernetes + Istio

* Nouveau lieu, nouvelle difficulté avec une grande distance de la caméra, NB: en mode sniper, être très, très, ... très  délicat
* Le montage est maintenant bien rodé, [nous publions à J+1](https://youtu.be/YJScBvT0bxg)

### ✅ Mars 2018, Vue.js

* Nouveau lieu, moins de galères d'installation lié à un repérage préalable
* Nous sonorisons mais le son est cette fois un poil trop faible, pas facile à régler in situ juste avant de commencer avec nos moyens actuels
* Le montage est mieux fini, [nous publions à J+1](https://youtu.be/yEYb1IaaG98)

### ✅ Février 2018, Kotlin

* Galères d'installation, branchement du boitier à l'envers 😱
* Image qui "tremble" sur le projecteur
* Voix de l'orateur qui sature (trop de gain)
* L'orateur sous exposé sur la vidéo
* Batterie de la caméra qui lâche à 60s de la fin 😡.
* Fin de la vidéo un peu brutale, pas d'applaudissements.
* Gros point positif: [la vidéo est utilisable](https://youtu.be/GdQec3-xqjU), nous la publions à J+3 .

## Futur

Pour le moment nous allons essayer d'exploiter le matériel à notre disposition, roder notre installation, le réglage du son et de la caméra.

Nous envisageons d'ajouter une table de mixage pour contrôler et ajuster le son pendant la session.

Nous aimerions détecter automatiquement le point de synchro entre les différents flux.

Pour le moment nous ne pouvons pas enregistrer les voix de deux orateurs, ou alors sur un troisième flux (micro cravate et smartphone).
