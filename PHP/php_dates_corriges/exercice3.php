<?php
/* --------------------------------------------------------
* PHP Phase 6 Dates et heures
*
* Exercice 3  
*
* Combien reste-t-il de jours avant la fin de votre formation ? 
* ---------------------------------------------------------- */
$oDateJour = new DateTime();
$oDateFin= new DateTime('2021-01-31');

$oNbJours = $oDateJour->diff($oDateFin);

// var_dump($oNbJours);

echo "Il reste ".$oNbJours->days." jours avant votre fin de formation le 31/01/2021.";