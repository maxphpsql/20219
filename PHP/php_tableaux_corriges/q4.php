<?php
/* --------------------------------------------------------
* PHP Tableaux
* Corrigé question 4 
* 
* 4. Combien de semaines dure le stage du groupe 19003 ? [comptage de valeurs]
*
* ---------------------------------------------------------  
*/
$a = array("19001" => array("Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "", "", "Centre", "Centre", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Validation", "Validation"), 
           "19002" => array("Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Validation", ""), 
           "19003" => array("", "", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "", "", "Validation") 
         );

/* Il ne s'agit pas ici de compter le nombre total d'éléments dans un (sous)-tableau comme le fait count(),
 * mais de compter le nombre d'occurence d'une valeur donnée.  
*/

// Attention array_count_values retourne un tableau
// pas de possibilité de gérer la casse : 'Stage' sera différent de 'stage'
$aNbSemaines = array_count_values($a["19003"]);

var_dump($aNbSemaines);

echo"Le stage du groupe 19003 dure ".$aNbSemaines["Stage"]." semaines.<br>";