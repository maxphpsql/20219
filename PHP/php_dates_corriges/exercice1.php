<?php
/* --------------------------------------------------------
* PHP Phase 6 Dates et heures
*
* Exercice 1
*
* Affichez la date du jour au format _mardi 2 juillet 2019_. 
* ---------------------------------------------------------- */

$oDate = new DateTime();

// Numéro du jour, sans 0 initial
$j = $oDate->format("w");

// Numéro du mois, sans 0 initial
$m = $oDate->format("n");

// Attention, la semaine commence le dimanche
$aJours = ["dimanche", "lundi", "mardi", "mercredi", "jeudi", "vendredi", "samedi"];

// Attention, 1 à 12, donc un vide au début pour la position 0
$aMois = ["", "janvier", "février", "mars", "avril", "mai", "juin", "juillet", "août", "septembre", "octobre", "novembre", "décembre"];

echo $aJours[$j]." ".$oDate->format("j")." ".$aMois[$m]." ".$oDate->format("Y");