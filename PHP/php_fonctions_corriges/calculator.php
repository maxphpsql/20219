<?php 
function calculator($nbr1, $nbr2, $operateur) 
{
  // Création d'un tableau qui contient les opérateurs autorisés	
  $aOperators = ["+","-","*","/"]; 
  
  if (in_array($operateur, $aOperators) && is_numeric($nbr1) && is_numeric($nbr2)) // Condition qui permet de vérifier ci les opérateurs et ci les nombres sont des décimaux ou des entiers.
  {
    switch ($operateur)
      {
        case "+" : 
          $somme = $nbr1+$nbr2;          
        break;
        case "-" : 
          $somme = $nbr1-$nbr2;
          
        break;
        case "*" : 
          $somme = $nbr1*$nbr2;      
        break;
        case "/" :
          if ($nbr2 == 0)
          {
            $somme = "Opération invalide.";       
          } 
          else
          {
            $somme = $nbr1/$nbr2;            
          }
        break;
        default:
        // Peu probable car on est censé avoir les bons opérateurs, mais on ne sait jamais !  		
        echo "Veuillez sélectionner un opérateur valide.<br>";
      }
	  
	// On retourne la somme 
    return $somme;   
  }
  else 
  {	   
     echo "Opérateur ou nombres invalides<br>";
  }
}

// Affichage et appel de la fonction calculator()

// Cas addition
$somme = calculator(5, 5, "+");
echo $somme."<br>";

// Cas division
$somme = calculator(5, 5, "/");
echo $somme."<br>";

// Cas division impossible (0 en 2ème argument)
$somme = calculator(5, 0, "/"); 
echo $somme."<br>";

// Cas multiplication
$somme = calculator(5, 5, "*");
echo $somme."<br>";

// Cas soustraction
$somme = calculator(5, 5, "-");
echo $somme."<br>";

// Cas opérateur invalide.
$somme = calculator(5, 5, "b"); 
echo $somme."<br>";