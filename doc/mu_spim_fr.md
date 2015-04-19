On se propose de construire un microscope permettant d'observer et
d'imager en 3 dimensions les petits objets et les petites bestioles qui
nous entourent. Le microscope doit pouvoir s'adapter à un apareil photo
numérique, être transportable, et tenir sur un bureau.

Il s'agit essentiellement d'un
[fork](http://en.wikipedia.org/wiki/Fork_%28software_development%29) du
microscope à feuille de lumière [openspim](http://openspim.org)
développé par Pavel Tomancak à Dresde. Nous reviendrons plus loin sur
cette méthode de [microscopie de
fluorescence](http://fr.wikipedia.org/wiki/microscopie_de_fluorescence).

L'objectif est avant tout **éducatif**: rendre visible le monde
foisonnant et étrange du plus-petit-que-le-cheveu.

Ce projet s'inscrit dans une démarche **ouverte**: le code et les plans
de l'objet seront distribués sous licence libre (CC-by-SA, comme le
projet parent).

Résumé opérationnel
===================

Support & structure
-------------------

Ce projet est d'abord porté par Guillaume Gay, dans le cadre de
l'entreprise [DamCB](about-us.html), à Marseille. Je suis en cours de
discussion avec [la boa[t]e](http://laboate.com) et l'association made
in la bo[a]te pour l'hébergement de ce projet. On recherchera surtout
des financements publics et participatifs.

Durrée du projet et délivrables
-------------------------------

La durée initialement plannifiée est de **deux ans et demi**, de janvier
2014 à juin 2016.

TODO: Planning, délivrables

Public visé
-----------

-   À partir de 7-8 ans.
-   Écoles, lycées, centre aérés
-   Cité des sciences, centres de divulgation scientifiques

Partenaires possibles:
----------------------

-   Hackerspaces/fablab
-   Étudiants :
    -   IUT
    -   physique/méca
    -   biologie (micro-biologie et écologie)
    -   informatique

Budget
------

Le coût des pièces composant le prototype est estimé de l'ordre de 5000
€ (en achetant du matériel neuf de bonne qualité). À cette somme doivent
s'ajouter d'éventuels salaires et les coûts annexes (locations diverses,
déplacements, etc.).

Compétences, équipe
-------------------

-   Développement instrumental :
    -   Un-e biologiste.
    -   Un-e développeur-e arduino / Rasberry Pi, électronicien, mécano.
    -   Un-e développeur-e image / reconstruction 3D.
    -   Un opticien / microscopiste.
-   Développement interface humain / machine:
    -   Un-e développeur-euse web + visuallisation de donnée
    -   Un-e animateur-trice scientifique
    -   Un-e designer

Pour chacune de ces compétences, on pourra encadrer des étudiants ou des
élèves, dans le cadre d'ateliers par exemple.

Le petit microscope 3D libre
============================

Préliminaires: la fluorescence et l'autofluorescence
----------------------------------------------------

TODO

Le principe de la feuille de lumière
------------------------------------

![image](principe_echantillon.png)

Commençons en haut à gauche par ce qu'il y a dans le panneau gris: On
fabrique à l'aide d'un faisceau laser une *feuille de lumière* (en vert
sur le dessin). Le faisceau se propage le long de la flêche ondulante.
Vue de dessus, marquée **D**, le faisceau est focalisé, il s'affine au
moment de traverser notre échantillon. Vue caméra, marquée **C**, le
faisceau n'est pas focalisé et forme une bande de lumière, d'épaisseur
constante.

Vue de face (**F**), on voit bien la tranche de lumière qui traverse
l'échantillon. Il ne faut pas le faire en vrai, on recevrai le laser en
pleine figure...

On place donc notre échantillon (1) dans la feuille de lumière (2), qui
excite des [fluorophores](http://fr.wikipedia.org/wiki/fluorophore). Une
partie de la lumière émise (en rouge) est récupérée sur une caméra (4).

Le principe de l'acquisition 3D
-------------------------------

![image](principe_echantillon.png)

C'est très simple, on fait le point, on positionne l'échantillon et on
fait une première photo (a). Ensuite, on coupe la lumière et on déplace
légèrement notre échantillon (en l'éloignant ou le rapprochant de
l'objectif) (b). On prend de nouveau une photo, une tranche de
l'échantillon (a). On recommence ensuite jusqu'à couvrir l'ensemble de
l'échantillon. Par la suite, on utilisera un algorithme pour
reconstruire une vue en trois dimension de notre bestiolle.

Le microscope en personne
-------------------------

![image](principe_echantillon.png)

Voici notre instrument. On place l'échantillon (1) dans la feuille de
lumière (2) La fluorescence émise est récupérée sur un appareil photo
(4). Pour former la feuille de lumière, on utilise divers éléments
d'optique, dont un premier objectif de microscope (5). Pour produire la
lumière, on utilise une source (6), par exemple un laser de lecteur DVD
ou de console de jeux, des diodes électro luminescentes, ou un
projecteur vidéo de type 'pico'. On utilise quelques réglages (8 & 9)
pour alligner la feuille de lumière. Vue de dos est représenté le
support d'échantillon, qui permet de déplacer celui-ci selon trois axes
[^1] (11 & 12).

L'échantillon
-------------

![image](principe_echantillon.png)

L'échantillon justement. Il faut d'abord le capturer (a) (à vous de
jouer!), et l'ammener à côté du micoscope (b). Là, après l'avoir
centrifugé et peut être colloré (entre b et c), on le plonge dans une
cuvette contenant une gélâtine d'agarose (d), qui est liquide à 37 °C,
et solidifie à 24°C (e). On place la cuvette dans le support amovible du
microscope (f), et c'est parti!

Détails sanglants
-----------------

[^1]: Il y aussi une rotation, mais ne compliquons pas trop pour
    l'instant.
