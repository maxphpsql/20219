<?php
/* --------------------------------------------------------
* PHP Phase 6 Dates et heures
*
* Exercice 6  
*
* En utilisant l'objet DateTime, montrez que la date du 17/17/2019 est erronée. 
* ---------------------------------------------------------- */
$sDate = "17/17/2019";

// Méthode 2 : avec l'objet DateTime
$oDatetime = DateTime::createFromFormat("d/m/Y", $sDate);

// getLastErrors retourne les erreurs de l'objet DateTime dans un tableau
$aErrors = $oDatetime->getLastErrors();

var_dump($aErrors);

if ($aErrors['warning_count'] > 1) 
{
      echo"Date ".$sDate." non valide";
}