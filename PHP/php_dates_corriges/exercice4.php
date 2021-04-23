<?php
/* --------------------------------------------------------
* PHP Phase 6 Dates et heures
*
* Exercice 4  
*
* Reprenez l'exercice 3, mais traitez le problème avec les 
* fonctions de gestion du timestamp, `time()` et `mktime()`
* ---------------------------------------------------------- */
$sDateFin = "2021-01-31";

// La fonction time() retourne le timestamp de l'instant
$timestamp = time(); 

echo"Le timestamp pour la date actuelle est : ".$timestamp."<br>\n"; 

/* La fonction mktime() retourne le timestamp
* de la date passée en argument 
* 
* Sources :
* 
* - https://www.php.net/manual/fr/function.time.php
* - https://www.php.net/manual/fr/function.mktime.php
*/
// $mk_timestamp = mktime(heure, minutes, secondes, mois, jour, annee);


// la fonction list() - rien à voir les dates - permet d'assigner directement des valeurs à des variables inexistantes
// respecter l'heure
list($y, $m, $d) = explode("-", $sDateFin); 

var_dump($y);
var_dump($m);
var_dump($d);

echo date("d/m/Y", mktime(0, 0, 0, $d, $m, $y) );