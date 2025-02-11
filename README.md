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

#### Depuis Février 2024

En février 2024, nous avons décidé d'investir sur la captation sonore pour fixer quelques problèmes récurrents qui commençaient à devenir pénibles
- l'obligation de faire répéter les questions de l'auditoire par les speakers qui nuit au confort de ces derniers
- la double installation des micro lorsqu'il faut équiper deux intervenants
- le bouton off des émetteurs, un peu trop facile actionné une fois ce dernier dans la poche
- l'impossibilité de sonoriser une salle qui n'est pas équipée au préalable

Pour résoudre ses points nous avons opter pour le matériel suivant:
- un kit micro sans fil [Sirus Quad R 2H 2B](https://www.thomann.de/fr/sirus_quad_r_2h_2b_2_headmike_d_set.htm) rackable permettant d'équiper jusqu'à 2 personnes en présentation et 2 personnes du publique pour la captation des questions (on aurait dit que ce kit est fait pour ça 😆). Les fréquences de communication sont personnalisables et faciles à configurer. Le kit est installé dans un [flight case](https://www.thomann.de/fr/thon_case_4u_sirus_quad_4ch.htm) muni d'un [déport pour les antennes](https://www.thomann.de/fr/thomann_antennenumsetzter.htm) pour en faciliter le transport ET la mise en service (et il reste même un peu de place pour y ranger les micro serre-tête 😉)
- une table de mixage [Behringer Xenyx 1204USB](https://www.thomann.de/fr/behringer_xenyx_1204_usb.htm) disposant de 4 entrées microphone, et faisant également office de carte son USB. Le préampli de chaque micro est couplé à un compresseur ce qui améliore drastiquement la qualité de la prise.
- une enceinte avec stand [Bose S1 Pro](https://www.thomann.de/fr/bose_s1_pro_stand_bundle.htm) pour diffuser et sonoriser l'audience dans une salle sans équipement
- le tout branché en XLR et/ou Jack Stéréo (aka [Symétrique](https://fr.wikipedia.org/wiki/Ligne_sym%C3%A9trique)) pour limiter les interférences

Le [compresseur](https://fr.wikipedia.org/wiki/Compresseur_(audio)), c'est la Vie!
En gros, il permet de restreindre la voix dans une certaine plage de volume (en vrai c'est faux, mais pour simplifier ici: c'est l'idée)
ce qui permet de monter le niveau de volume assez haut sans trop craindre de saturation (quand l'aiguïlle passe la zone rouge).
C'est notamment le secret des voix à la radio, dans les PodCasts, … et ici ça fait effet aussi.
Plus besoin de retoucher le niveau des voix en post prod car captée trop basse.

#### Avant Février 2024

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

### ✅ Janvier 2025, Unlocking Observability in Kafka-Based Systems with OpenTelemetry

* Session en 🇬🇧
* Une captation presque sans accrocs
* Setup toujours dans le stress avec OBS qui continue de faire n'imp avec les réglages
* On remplace notre splitter HDMI avec le tout nouveau [Maître Splitter](https://www.amazon.fr/dp/B083JVPXDY), qui fait aussi HDCP killer pour contourner les protections de contenu via DRM en place notamment sur les Mac récents (ARM et sans sortie HDMI, peut-être aussi une question d'OS 🤔)
* Nous [publions ici](https://youtu.be/GyXNlsLYZ4s)

### ⚠️ Novembre 2024, Comment exporter l'inexportable ?

* Encore un setup dans la douleur, pourquoi OBS fait-il n'importe quoi avec les réglages des scènes !?😡
* La scène speaker+laptop est inutilisable
* Nouveauté cette fois-ci: une coloration jaunâtre des diapos qui ne vient pas du laptop speaker😞
* La captation son est au top, la sonorisation salle offre le feedback nécessaire aux interlocuteurs pour utiliser correctement le micro 👍
* Nous [publions ici](https://youtu.be/WI7a9t2ibD0)

### ⚠️ Octobre 2024, Legal JVM Dopes For Your Apps

* Session en 🇬🇧
* Setup dans la douleur et impossible de capter le flux speaker
* On passe en mode dégradé en filmant la session à la caméra (speaker + projection vidéo)
* Nous [publions ici](https://youtu.be/_oXnnQcD_wc)

### ✅ Septembre 2024, Double Session ElasticSearch

* Rien à faire ici, la captation live est assurée par les équipes de notre hôte Euratechnologies, merci à eux.
* Nous [publions ici](https://youtu.be/Z1UlUf2g4_A) et [publions là](https://youtu.be/7xoxYx10QBw)

### ⚠️ Juin 2024, triple session

* «Quand la vidéo fait défaut»
* La captation du flux camera a flanché juste avant le debut du talk,
  on passe alors en mode dégradé en se concentrant sur le flux speaker
* Des soucis de résolution et de colorimétrie, le suspect principal est OBS
  qui a une fâcheuse tendance à saboter les réglages avant chaque session,
  c'est pénible et il est peut-être temps de trouver un remplaçant
* Nous [publions ici](https://youtu.be/F3MCUJ0spPQ), [là](https://youtu.be/NIV4SIIjSeI) et [ici aussi](https://youtu.be/OtdClxc3kSY)

### ✅ Mai 2024, La compression Web : comment (re)prendre le contrôle ?

* Captation dans un amphi avec sonorisation car nous n'avons pas pu nous brancher sur l'infra de la salle
* Petit souci de larsen ce qui nous a malheureusement fait opter à nouveau pour la reformulation des questions
* Pour limiter l'impact sur l'enregistrement, des filtres (anti-bruit et compression) on été ajouter à OBS
  ce qui a eu pour effet un léger impact sur la vidéo et créé un décalage son/video de 500 ms rattrapé en post-prod
* Nous [publions ici](https://youtu.be/BVM5vsPYbfg)

### ✅ Mars 2024, Generative AI par la pratique: Cas concrets d'utilisation d'un LLM en Java

* Rien à faire ici, la captation live est assurée par les équipes de notre hôte Euratechnologies, merci à eux.
* Nous [publions ici](https://youtu.be/Ty_WKXu0kFw)

### ✅ Février 2024, REST next level : Ecrire des APIs web orientées métier

* Captation avec le nouveau setup son, au poil. Désormais, le(s) speaker(s) n'ont plus à reformuler les questions de l'auditoire, elles sont captées "live"
* Nous avions la possibilité de sonoriser la salle, ce que nous n'avons pas fait mais qui aurait pu être utile afin que la personne du public ait un feedback et maintienne le micro pendant ses échanges.
* Nous [publions ici](https://youtu.be/K2FIhIhKufs)

### ✅ Janvier 2024, CQRS chez Zenka Lille

* Captation au poil malgrès un setup un peu dans la douleur
* Nouveauté ici: on intègre le contenu vidéo des speakers dans le rendu final 😎
* Nous [publions ici](https://youtu.be/0v7zHnNbqfA)

### ✅ Décembre 2023, Fast Data chez AXA France

* Captation dans la douleur, tout ce qui pouvait capoter a poser problème
* Nous sauvons les meubles en mode dégradé et [publions ici](https://youtu.be/yWhCBk__SaM)

### ✅ Novembre 2023, Java 21

* Rien à faire ici, la captation live est assurée par les équipes de notre hôte Euratechnologies, merci à eux.
* Nous [publions ici](https://youtu.be/n6Oqn7v3Pmk)

### ❎ Octobre 2023, double session testing

* Échec critique, setup laborieux conclu par un souci de projection lié au matériel de captation
* Nous abandonnons l'enregistrement 😭

### ✅ Septembre 2023, Kestra

* Rien à faire ici, la captation live est assurée par les équipes de notre hôte Euratechnologies, merci à eux.
* Nous [publions ici](https://youtu.be/vUtlLUdKNPA)

### ✅ Juin 2023, Spring Boot 3

* Rien à faire ici, la captation live est assurée par les équipes de notre hôte Euratechnologies, merci à eux.
* Nous [publions ici](https://youtu.be/8cNClesl2VY)

### ✅ Mai 2023, Projet Makair: Comment Et Pourquoi Construire un Respirateur OpenSource ?

* Rien à faire ici, la captation live est assurée par les équipes de notre hôte Euratechnologies, merci à eux.
* Nous [publions ici](https://youtu.be/rcTWevK7nIA)

### ✅ Mars 2023, Mon application Java sans serveur sur AWS

* Rien à faire ici, la captation live est assurée par les équipes de notre hôte Euratechnologies, merci à eux.
* Nous [publions ici](https://youtu.be/91ehp9RYv8g)

### ✅ Février 2023, Pourquoi développer des applications 'Event Driven' avec Apache Pulsar

* Rien à faire ici, la captation live est assurée par les équipes de notre hôte Euratechnologies, merci à eux.
* Nous [publions ici](https://youtu.be/DCDfelXAPmA)

### ✅ Janvier 2023, Developper et Deployer avec GitHub, Codespaces, Copilot et Actions

* Petit souci lors de la captatation du flux speaker, cette fois la résolution avec un ratio de 16:10 a du être ajustée à la dernière minute,
il nous faudra : soit un nouveau caneva, soit forcer la résolution du speaker à 16:9, nous s'aimons pas changer quoi que ce soit sur l'ordi de présentation ...
* autre petit souci: la taille du fichier est d'environ 13 Gib au lieu de 2 habituellement, cela sexplique peut-être à par l'application du filtre night shift
* Nous [publisons à J+4](https://youtu.be/TsCR-xHZyF0)

### ✅ Décembre 2022, Testez vos microservices sans peine avec Micronaut

* Petit souci lors de la captation du flux speaker, un mauvais réglage au niveau des scènes OBS a sabotté la résolution. Rien de vraiment gênant, mais la qualité n'est pas optimale
* Nous [publions à J+1](https://youtu.be/j8GAWQIEtqI)

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
