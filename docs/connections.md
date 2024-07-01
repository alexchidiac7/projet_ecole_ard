# Connections électroniques

Les principaux composants utilisés dans ce projet sont les suivants : un contrôleur CNC, un CF3DN, un MGO , un Raspberry Pi 4, Keithley 2410, tout en utilisant comme langage de programmation python pour la communication avec la machine CNC

![outils](https://github.com/alexchidiac7/projet_ecole_ard/assets/54644626/854171a2-287b-4d2f-984f-40760ea5972d)


## Schéma général de connexion du projet

![connections](https://github.com/alexchidiac7/projet_ecole_ard/assets/54644626/df2ed778-8e7a-458f-bdd9-214edb0bf953)

## Arduino Uno 

Il est chargé de fournir +5V à chacun des six phototransistors du projet et de contrôler chaque canal disponible des phototransistors.

![phototransitors](https://github.com/alexchidiac7/projet_ecole_ard/assets/54644626/84c6458a-ddf2-4695-bade-ab8b661c803c)

## Phototransitores

![image5](https://github.com/alexchidiac7/projet_ecole_ard/assets/54644626/e5d8a9e5-b6bc-4485-bf89-0f5287fdbf82)

Un phototransistor bipolaire est essentiellement une structure de transistor électronique, où la lumière extérieure peut frapper la jonction base-collecteur. Les porteurs de charge électriques ainsi créés sont injectés dans la base, produisant un effet similaire à celui d'un courant de base injecté à travers un fil dans un transistor ordinaire. Le courant de collecteur résultant montre une amplification substantielle, facilement par un facteur de 100 ou plus.

Le phototransistor NPN tel que le WL-STSW SMT fonctionne en convertissant la lumière en un signal électrique à travers la génération d'un courant de base, qui est ensuite amplifié pour produire un courant de collecteur proportionnel, fournissant un signal de sortie utilisable dans diverses applications de détection de lumière.

Pour la lecture des signaux provenant de phototransistors intégrés dans des guides d'ondes, une méthode de multiplexage séquentiel a été mise en œuvre. Cette technique traite six canaux de phototransistors, qui sont alimentés et amplifiés à +5V via une carte Arduino.


## 74HC4051 Mux

<img src="https://github.com/alexchidiac7/projet_ecole_ard/assets/54644626/e18c02e2-4e3f-4a50-8359-343472016ec0" width="400" />
<img src="https://github.com/alexchidiac7/projet_ecole_ard/assets/54644626/5f282ea2-924f-4521-a41e-04dcc9c74697" width="400" />


Le circuit intégré SOP16 intermédie les connexions entre l'Arduino Uno et les phototransistors en utilisant le CI 74HC4051. Chaque phototransistor a au moins une broche connectée à la broche 16 du SOP16, qui est reliée aux 3,3V de l'Arduino Uno, et la deuxième broche est connectée à un canal de notre MUX, de sorte qu'elle peut être contrôlée individuellement par notre Arduino Uno.
## MGO

<img src="https://github.com/alexchidiac7/projet_ecole_ard/assets/54644626/0aca9ca0-75d3-4a40-8980-0935d06e4f54" width="400" />

Le capteur MGO a été créé pour recevoir et traiter les signaux optiques en réponse aux déformations mécaniques. Il est équipé de 2 LED et de 6 phototransistors, utilisés respectivement pour émettre de la lumière blanche et convertir la lumière en courant électrique.

Les 2 LED présentes dans le MGO sont alimentées par une alimentation stabilisée de +3,2V.

Les six phototransistors WL-STSW SMT (NPN) fonctionnent en convertissant la lumière en un signal électrique. Ils possèdent uniquement deux broches et sont directement alimentés par l'Arduino Uno via la broche 3,3V, qui est connectée au multiplexeur amplifiant la source de sortie à 5V.

## CF3DN

<img src="https://github.com/alexchidiac7/projet_ecole_ard/assets/54644626/1b8cc4b1-5084-4caa-90ca-19b544f6fbcc" width="300" />

Le capteur de forces à 3 axes normalisé (CF3DN) est responsable de la mesure de la force. Elle est directement connectée à un Arduino Nano et à une alimentation stabilisée. 

L'axe Z (mouvement vertical) a été configuré pour être contrôlé directement via une connexion série avec un script Python (XYZ_Force_Sensor_test.py). Ce script permet à la machine de descendre et de venir en contact avec le module CF3DN pour mesurer cette force.

Les axes X et Y sont tous deux contrôlés simultanément à l'aide d'un script Python différent (CNC_Gcode.py). Ce script s'exécute également avec l'interface logicielle Planet CNC.

## Keithley System Source Meter

Le Keithley mesure le courant provenant de la sortie du Mux. Le courant généré par les phototransistors est mesuré par une unité Keithley 2400, câblée en configuration à quatre fils pour augmenter la précision de mesure et minimiser les problèmes de masse entre différents équipements. La ligne de sensibilité HI a une entrée à haute impédance qui sert de boucle de rétroaction avec un comparateur à l'intérieur du Keithley pour assurer que la force appliquée reste stable.

Les LED intégrées dans les guides d'ondes sont alimentées par une alimentation stabilisée à +3,2V.

Le taux d'acquisition de données pour la lecture des six photocourants est limité à 2,5 Hz par le Keithley, qui est un instrument très précis (+10 chiffres) mais pas adapté aux applications à haute fréquence.