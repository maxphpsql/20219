<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="utf-8">
  <title>PHP Boucles : Exercice 1 corrigés</title>
    <style>
        table, tr, td, th
        { 
            border: 1px solid #000000; 
        } 
        </style>
</head>
<body>
<h1>PHP Boucles : Exercice 1 corrigés</h1>
<?php
/* Boucle 'for' (par exemple, peut fonctionner avec 'while' aussi) 
* jusqu'à 150 */
for ($i=0; $i<150; $i++)
{    
    /* L'opérateur modulo - signe % - indique le reste d'une division; 
	* ici on divise par 2 (chiffre après le %) 
	* et si on a un reste égal à 0 alors le nombre $i est pair 
	* et on l'affiche avec echo */ 
    if ($i%2 == 0) 
	{
		echo $i."<br>";
    } 		
}
?>
</body>
</html>
