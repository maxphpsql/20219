<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <title>PHP Boucles : Exercice 3 corrigés</title>
    <style>
        table, tr, td, th
        { 
            border: 1px solid #000000; 
        } 
        </style>
</head>
<body>
<h1>PHP Boucles : Exercice 3 corrigés</h1>
<p>Il fallait bien se rendre compte qu'il faut en fait 13 colonnes sur 13 lignes et non pas 12 sur 12 !</p>
<p>Ensuite, réfléchir comment construire ligne par ligne : j'ouvre une ligne, je fais les 13 colonnes, puis je ferme la ligne et je répète l'opération autant de fois qu'il y a de lignes et de colonnes, avaec pour commencer une partie entête requérant les balises <code>thead</code> et <code>th></code>.</p>
<p>Cela nécessitait 2 boucles <code>for</code>, une pour les lignes puis une pour les colonnes, imbriquées l'une dans l'autre .</p>
<?php
echo "<table>\n";
  
// La 1ère ligne est une ligne d'entête, donc avec <thead>
echo"<thead>\n";
echo"<tr>\n";
// La 1ère cellule est vide
echo"<th> </th>\n";

// Puis on peut créer 12 autres cellules
for ($th=0; $th<=12; $th++)
{
    echo"<th>".$th."</th>\n";
}       

// On ferme la ligne
echo"</tr>\n";

// On ferme le <thead
echo"</thead>\n";

// Puis on a besoin de 13 lignes de 13 cellules chacune
for ($ligne=0; $ligne<13; $ligne++)
{    
    echo"<tr>\n";
    
    // Pour toutes les autres lignes, la 1ère cellule est un <th>  
    // echo"<thead>\n";
    echo"<th>".$ligne."</th>\n";
    //  echo"</thead>\n";        
        
    // Puis les 12 autres cellules sont des <td>  
    for ($td=0; $td<=12; $td++)
    {
        $resultat = $ligne*$td;  
        echo "<td>".$resultat."</td>\n";
    }        
       
    // Dans tous les cas, on ferme la ligne
    echo"</tr>\n";           
}

echo"</table>\n";
?>
</body>
</html>
