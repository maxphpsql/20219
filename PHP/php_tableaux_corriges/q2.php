<?php
/* --------------------------------------------------------
* PHP Tableaux
* Corrigé question 2 
*  
* 2. Trouver la position de la dernière occurrence de _Stage_ pour le groupe 19001
* ---------------------------------------------------------  
*/
$a = array("19001" => array("Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "", "", "Centre", "Centre", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Validation", "Validation"),
    "19002" => array("Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Validation", ""),
    "19003" => array("", "", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "", "", "Validation")
);

/* Solution :
* utilisation de la fonction array_reverse() qui inverse l'ordre des valeurs dans un tableau
pour 'validation')
*/ 

// le tableau $a["19001"] contient 24 éléments
echo count($a["19001"]); 

// [array_reverse, preserve_keys

$aInverse = array_reverse($a["19001"]);

var_dump($aInverse);

// 1er problème : les positions ont elles aussi été inversées, la dernière occurence qu'on recherchait se trouve désormais dans les premières, 
// le numéro de semaine n'est donc pas le bon 
// Solution : ajouter l'argument preserve_key = TRUE à la fonction qui va inverser les valeurs tout en conservant les index d'origine 
$aInverse = array_reverse($a["19001"], TRUE);

var_dump($aInverse);

// résultat attendu : 22
$iPosition = array_search("Stage", $a["19001"]);
echo"\$iPosition : ".$iPosition."<br>"; 

// résultat attendu : 23
$iSemaine = $iPosition + 1;
echo"La fin de stage du groupe 19001 est la semaine : ".$iSemaine."<br>";