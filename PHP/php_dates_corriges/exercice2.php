<?php
/* --------------------------------------------------------
* PHP Phase 6 Dates et heures
*
* Exercice 2
*
* Affichez le numéro de semaine de la date suivante : 14/07/2019 (un dimanche).
* ---------------------------------------------------------- */
$oDate = new DateTime("2019-07-14");

// Affiche semaine 28 et non semaine 29 car semaine définie du lundi au dimanche 
echo "La date 14/07/2019 se situe dans la semaine n°: ".$oDate->format('W');