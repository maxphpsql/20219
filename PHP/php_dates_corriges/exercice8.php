<?php
/* --------------------------------------------------------
* PHP Phase 6 Dates et heures
*
* Exercice 8  
*
* Ajoutez 1 mois à la date courante 
* --------------------------------------------------------- */
$oDate = new DateTime();

var_dump($oDate);

echo"Nous sommes le ".$oDate->format("d/m/Y")."<br>";

/* Ajout d'un mois 
* 
* On va avoir recours à :
* - la fonction add() de l'objetDateTime
* - l'objet DateInterval
* 
* Sources :
* - https://www.php.net/manual/fr/datetime.add.php
* - https://www.php.net/manual/fr/class.dateinterval.php
*/
$oDate->add(new DateInterval("P1M"));

var_dump($oDate);

/* Valeurs passées en argument de dateInterval : 
* - P : délimiteur de période : 'P' pour la section jour/mois/année, 'T' pour la section des heures/minutes/secondes
* - 1 : indique la valeur à ajouter 
* - M : indique la période à ajouter , ici 'M' pour 'months' donc mois.
*
* Autre exemple :
* Pour ajouter 10 jours et 2 heures 
* $oDate->add(new DateInterval("P30DT2H")); 
*/
$oDate->add(new DateInterval("P30DT2H")); 
var_dump($oDate);