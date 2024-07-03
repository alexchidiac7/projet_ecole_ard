# Simulation

Pour un exemple concret, nous voulons faire la simulation suivante:

<p align="left">
  <img src="https://github.com/alexchidiac7/projet_ecole_ard/assets/54644626/a602c51f-e945-476a-aec4-3600502a77dc" alt="simulationMGO" style="width:300px; float:left; margin-right:20px;" />

  <br/><br/><br/><br/>

  La première mesure devait se faire de gauche à droite (E3 ver L2) comme indiqué sur la figure par le signe plus en forme, avec une force de 3N.

</p>

Pour commencer, exécutez le fichier appelé `app.py et suivre le étapes suivantes:

1. **Cliquez** sur “**Add G-code Inputs**” pour ajouter une ligne.
2. **Entrez** `0`, `-0.5`, et `1000` dans les cases de X, Y, et Vitesse respectivement.
3. **Cliquez** sur “**Save G-codes to File**”
4. **Exécutez** le script en cliquant **Run CNC**.

Cela va déplacer la machine vers les coordonnées enregistrées.
Une fois que la machine s'est déplacée vers la position enregistrée, nous devons maintenant saisir le numéro de position 2, qui est la position finale de cette machine. N'oubliez pas que nous devons considérer les coordonnées comme absolues (l'origine est fixe)

Nous devons donc maintenant saisir les coordonnées de la position 2 qui sont (-3;-0,5)

1. **Click** on “**Clear G-code Inputs**” (pour tout supprimer et recommencer.)
2. **Click** on “**Add G-code Inputs**”
3. **Enter** `-3`, `-0.5`, `1000` in the fields for X, Y, and Speed respectively
4. **Click** on “**Save G-codes to File**”



Ne cliquez pas sur "Run CNC" car cela sera fait plus tard dans la simulation, pour l'instant nous positionnons simplement la machine sur la position 1 et enregistrons les coordonnées de la position 2.
Maintenant que la machine est en position 1 et que les coordonnées de la position 2 sont enregistrées, nous pouvons démarrer la simulation.

Assurez-vous que la jauge de l'axe Z ne touche pas le matériau. (montez-le manuellement si c'est le cas)

![controlPanel](https://github.com/alexchidiac7/projet_ecole_ard/assets/54644626/c4d822b8-2826-4adb-826c-c74d32b66b52)

## Une simulation complète

1. **Mettez la Force.** (ex : 3) -> (ce qui signifie 3N)
2. **Cliquez** sur "**Soumettre la force de l'axe Z**"

   Ici, la machine commencera à descendre dans la direction du matériau.

   Avant de toucher le matériau, il faut "**Run Keithley**" pour commencer à mesurer le courant sur le phototransistor. Nous faisons cela avant de toucher le matériau pour prendre les premières valeurs enregistrées comme référence, ce qui sera nécessaire pour des mesures correctes ultérieurement.

3. **Cliquez** sur "**Run Keithley**" avant de toucher le matériel
4. Lorsque la jauge Z touche le matériau, **attendez une seconde** puis "**Run CNC**"  
   Cela commencera à déplacer la machine vers la position 2
5. Lorsque vous atteignez la position souhaitée, **cliquez** sur "**Stop Simulation**"

   Félicitations, vous venez de terminer une simulation entière.

## Faire les mesures

Maintenant pour voir les mesures de votre simulation :

1. **Cliquez** sur "**Run Forces Plotter**"
2. **Choisissez** le fichier dans mesures_XYZ (vous devez choisir le plus récent, lié à votre simulation)

   En saisissant cela, vous obtiendrez un graphique, c'est le graphique des forces Fx, Fy et Fz.

Le même pour "**Run Waveguide Loss Plotter**" :

3. **Cliquez** sur "**Run Waveguide Loss Plotter**"
4. **Choisissez** le fichier dans mesures_MUX (vous devez choisir le plus récent, lié à votre simulation)

   En saisissant cela, vous obtiendrez un graphique, c'est le graphique des pertes dans chaque canal des phototransistors (les pertes liées au courant enregistré par les phototransistors). C'est pourquoi nous avons dit qu'il fallait "**Exécuter Keithley**" avant de toucher le matériau, car nous avions besoin d'une valeur de référence pour calculer la perte, cette valeur de référence étant la valeur initiale enregistrée par chaque canal avant de toucher le matériau.

---

C'est un exemple simple, mais c'est ainsi que sont effectuées 90% des mesures. Vous passez simplement de la position 1 à la position 2. Maintenant, avec l'interface que nous avons créée, elle est dynamique, donc vous pouvez passer à la position 1, puis au lieu de sauvegarder la position 2 souhaitée, vous pouvez sauvegarder plusieurs positions, par exemple :

![controlPanelPres](https://github.com/alexchidiac7/projet_ecole_ard/assets/54644626/ee8a76a6-529a-4f43-8023-94e560a29151)

Quand on clique sur “Save G-codes” et quand au milieu de la simulation on clique sur “Run CNC”, il passera de la position 1 (déplacée avant de démarrer la simulation) à la position 2 (-3;-0,5), attendra 5 secondes, puis à (-5;-0,5).

La vitesse est 1000 pour notre exemple, c'est la plus utilisée. Vous pouvez l'augmenter à 2000 pour des mouvements plus rapides ou la diminuer à 500 pour des mouvements plus lents. Nous avons enregistré ces valeurs pour chaque vitesse :

- **Vitesse de 1000** : il bouge de 10 cm en 37s, soit 0.270 cm/s ou 2.70 mm/s.
- **Vitesse de 2000** : il bouge de 10 cm en 18s, soit 0.5 cm/s ou 5.5 mm/s.
- **Vitesse de 4000** : il bouge de 10 cm en 15s, soit 0.6 cm/s ou 6.6 mm/s.

## Conseils

Il y a un grand bouton rouge dans la machine, il est utilisé pour arrêter les axes X et Y.

L'axe Z peut être arrêté en utilisant le bouton "Stop Simulation" dans l'interface. Si l'axe continue à descendre, il faut redémarrer tout le Raspberry Pi.

Quand le câble réseau n'est pas connecté au Raspberry Pi, il y a un bug qui rend tout le système plus lent.




