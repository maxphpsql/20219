<?php
/* --------------------------------------------------------
* PHP Phase 6 Dates et heures
*
* Exercice 5  
*
* Quelle sera la prochaine année bissextile ?
* ---------------------------------------------------------- */
$oJour = new DateTime();

for ($i=0; $i<3; $i++) 
{    
    $oJour->modify('+1 years'); 
        
    if ($oJour->format('L') == 1) 
    {
        echo"L'année ".$oJour->format('Y')." sera bissextile";
        exit;
    }
}