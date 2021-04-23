<?php
/* --------------------------------------------------------
* PHP Tableaux
* Corrigé question 1 
* 
* 1. Quelle semaine a lieu la validation du groupe 19002 ? 
* ---------------------------------------------------------  
*/
$a = array("19001" => array("Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "", "", "Centre", "Centre", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Validation", "Validation"), 
           "19002" => array("Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Validation", ""), 
           "19003" => array("", "", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "", "", "Validation") 
         );

/* Tout d'abord, il fallait identifier 2 difficultés pour l'ensemble des questions :
* => tableau à 2 dimensions : accès à un sous tableau via, par exemple pour le 1er groupe : $a["19001"]
* => pour les numéros de semaines, la 1ère position dans un tableau étant 0, il faut donc ajouter systématiquement +1 
*/

/* Solution :
* utilisation de la fonction array_search() qui retourne la position de la 1ère occurence 
* dans le cas présent, groupe 19002, il n'y en a qu'une pour 'validation'
*/ 

// le tableau $a["19002"] contient 26 élements
// echo count($a["19002"]); 
$iPosition = array_search("Validation", $a["19002"]);

// iPosition = 24
echo"\$iPosition : ".$iPosition."<br>";

// iSemaine = 25
$iSemaine = $iPosition + 1;

echo"La validation du groupe 19002 aura lieu la semaine : ".$iSemaine."<br>";