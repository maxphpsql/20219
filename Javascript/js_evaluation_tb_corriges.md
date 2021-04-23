# Corrigés évaluation Javascript pour les groupes TB

Ces corrigés proposent **une** solution par exercice, mais il peut exister de nombreuses possibilités obtenant le résultat demandé. La solution présentée est généralement la plus simple, afin de bien vous faire assimiler les bases, et aussi souvent la plus propre en termes de code (c'est-à-dire le moins de code possible, choix de la meilleure structure à utiliser, dialogue avec l'utilisateur...).    

**Tester dans Chrome, certains scripts peuvent fonctionner dans Firefox mais pas dans Chrome (et éventuellment l'inverse).** 

> Bien lire les explications en commentaires dans le code. 

## Exercice 1 : total d'une commande

> Cet exercice concernait les conditions.

A partir de la saisie du prix unitaire noté P.U. d'un produit et de la quantité commandée QTECOM, afficher le prix à payer PAP, en détaillant le port PORT et la remise REM, sachant que :

* le port est gratuit si le prix des produits TOT est supérieur à 500 €. Dans le cas contraire, le port est de 2% de TOT
* la valeur minimale du port à payer est de 6 €
* la remise est de 5% si TOT est compris entre 100 et 200 € et de 10% au-delà

Testez tous les cas possibles afin de vous assurez que votre script fonctionne. 

     // La remise est initialisée, à 0
     var REM = 0;

     // En initialisant les frais de port à 6, ils vaudront, quoiqu'il arrive, 6 € minimum  
     var PORT = 6; 
 
     var PU = parseInt(prompt("Ecrivez le prix unitaire d'un produit"));
     var QTECOM = parseInt(prompt("Ecrivez la quantité commandée"));
    
     // Calcul du total initial 
     TOT = PU * QTECOM;

     console.log("Total initial :"+TOT);

     if (TOT >= 100 && TOT <= 200) 
     {
        REM = TOT - (0.95 * TOT);
        console.log("Prix entre 100 et 200, remise = "+REM);
     }

     if (TOT>200)
     {
        REM = TOT - (0.90 * TOT); 
        console.log("prix > 200, remise = "+REM);     
     }

     // La remise finale peut toujours valoir 0 si on n'est pas passé dans les deux conditions ci-dessus
     console.log("Remise finale = "+REM);

     TOT = TOT-REM; // Total avec remise déduite  
     console.log("Nouveau total, remise déduite = "+TOT);     

     if (TOT>500)    
     {
        PORT = 0;
        console.log("total > 500, port gratuit");
     } 
     else 
     { // TOT<500
        PORT = TOT*(2/100);
        console.log("total < 500, port : "+PORT);        
     }

     if (PORT < 6) 
     {
        PORT = 6;
        console.log("port < 6, port : "+PORT);        
     }

     /* On a le montant final de frais de port : on les ajoute au total, on 
     * a alors le prix final à payer par le client */
     TOT = TOT + PORT;   

     console.log("Au final\n- Le prix à payer remise déduite et port compris est de "+TOT+",\nLe montant de la remise est de : "+REM+"\nLe montant des frais de port est de : "+PORT);

**Vérification**

* Saisir 600 € et quantité = 1 : remise 10% (-60 €) soit 540,00 et frais port = 0; à payer : 540 € 
* Saisir 501 € et quantité = 1 : remise 10% (-50,1 €) soit 450,90 et frais port 2% (de 450,90 €) soit +9,01 € ; à payer : 450,90+9.01 = 459,91 €. 
* Saisir 100 € et quantité = 2 : 200 € donc remise 5% soit 190 € et frais de port 2% soit 3,8 € donc le minimum de 6 € s'applique; à payer : 190+6 = 196 €  
* Saisir 3 € et quantité = 1 : remise 0, frais de port 2% soit 0.06 € donc le minimum de 6 € s'applique; à payer : 3+6 = 9 €

Ordre à respecter pour les calculs :

* prix * quantité
* calcul de la remise
* calcul de frais de port sur le prix remisé  
* test si frais de port inférieur à 6 € alors on les force à 6 €.

## Exercice 2 : Somme des entiers inférieurs à N

> Cet exercice concernait les conditions.

Ecrivez un programme qui affiche la somme des nombres inférieurs à N.

    var n = parseInt(prompt("Saisir un nombre"));
    n = n-1; // On soustrait 1 car on veut faire la somme des nombres inférieurs à celui saisi   
    var total = 0;  // On initialise le total.    
    var i;
   
    /* On exécute une boucle décrémentale qui s'arrête quand 0 est atteint */
    for (i = n; i != 0; i--)
    {
        // A chaque tour, on ajoute la valeur actuelle de n au total  
        // La syntaxe += est équivalente à total = total + i 
        total += i;  
    }   

    // Boucle terminée, on a obtenu le total définitif 
    console.log(total);          

**Vérification** 

Si on saisit le nombre _5_, selon les bornes, le résultat peut-être _10_ : 

* c'est-à-dire la somme de 4 + 3 + 2 + 1
* Le résultat peut-être _5_, ou selon les bornes (strictement inférieur OU inférieur et égal), _10_.  

## Exercice 3 - Mini et maxi

> Cet exercice concernait les boucles.

Modifiez le programme de la moyenne pour afficher le minimum et le maximum.
   
    var total = 0;
    var avg = 0;
    var moyenne = null;
    var entier = parseInt(prompt("Saisir un nombre entier"));
    var min = null;
    var max = 0;
    var compteur++;
    
    while (entier != 0)
    {        
        if (min == null) 
        {
           min = entier;   
        }
        else if (entier < min) 
        {
           min = entier;
           console.log(min);
        }
    
        if (entier > max) 
        {
            max = entier;
        }    
     
	    total = total + entier;
	    compteur++;
	    var entier = parseInt(prompt("entier"));
    } // fin while
        
    moyenne = total / compteur;
    console.log("Moyenne : "+moyenne);

    // Affichage du minimum et du maximum
    console.log("min : " + min);
    console.log("max : " + max);

**Vérification** 

Pour la suite 1, 2, 3, 4, 5 :

* total = 15
* moyenne : 3 (15/5)
* minimum : 1
* maximum : 5

## Exercice 4 - Calcul du nombre de jeunes, de moyens et de vieux

Il s'agit de dénombrer les personnes d'âge strictement inférieur à 20 ans, les personnes d'âge strictement supérieur à 40 ans et celles dont l'âge est compris entre 20 ans et 40 ans (20 ans et 40 ans y compris).

Le programme doit demander les âges successifs.

Le comptage est arrêté dès la saisie d'un centenaire. Le centenaire est compté.

Donnez le programme Javascript correspondant qui affiche les résultats.

	var jeunes = 0;
	var moyens = 0;
	var vieux = 0;
	
	do 
	{
	    var age = parseInt(prompt("Quel est vôtre âge ?"));        
	    
	    if (age < 20) 
	    {
	       jeunes++;          
	    } 
	    else if (age >= 20 && age < 40)
	    {
	        moyens++;       
	    }
	    else if (age > 40)
	    {
	        vieux++;
	    }      
	} while (age < 100);
	
	console.log("jeunes : "+jeunes);
	console.log("moyens : "+moyens);
	console.log("vieux : "+vieux);

**Vérification**

Entrez successivement les valeurs : 10 (1 jeune), 21 (1 moyen), 41 et 100 (2 'vieux' donc).    

## Exercice 5 : Table de multiplication

Ecrivez une fonction qui affiche une table de multiplication.

Votre fonction doit prendre un paramètre qui permet d'indiquer quelle table afficher.

Par exemple, `TableMultiplication(7)` doit afficher : 

1 x 7 = 7
2 x 7 = 14
3 x 7 = 21
...
     
    // Déclaration de la fonction 
    function tableMultiplication(n) 
    {
         var i;
       
         for (i=1; i<=10; i++) 
         {              
             var produit = n*i; // Calcule le résultat 

             // Concaténations pour afficher la ligne (par exemple 2 x 5 = 10) 
             var afficher = n + " x " + i + " = " + produit;   
             console.log(afficher);
         }
    }

     var n = parseInt(prompt("Entrez un entier de 1 et 10"));  

     // Ce n'est pas fait ici, mais on devrait vérifier que n est bien un entier

     // Appel de la fonction tableMultiplication
     tableMultiplication(n);

## Exercice 6 : recherche d'un prénom

> Cet exercice concernait les tableaux.

Un prénom est saisi au clavier. On le recherche dans le tableau `tab` donné ci-après. 

Si le prénom est trouvé, on l'élimine du tableau en décalant les cases qui le suivent, et en mettant à blanc la dernière case.

    var tableau = ["Audrey", "Aurélien", "Flavien", "Jérémy", "Laurent", "Melik", "Nouara", "Salem", "Samuel", "Stéphane"];
	   	        	        
	console.log("Début :");
	console.log("- Longueur du tableau : "+tableau.length);
	console.log("- Contenu du tableau : "+tableau);
	        
	var prenom = prompt("Ecrire un prénom");
	        
    if (tableau.indexOf(prenom) == -1) 
	{		
	    console.log("Prénom "+prenom+" absent.");                  
    } 
	else 
	{
		console.log("Prénom "+prenom+" trouvé !");

        // On supprime le prénom du tableau
	    // La méthode indexOf() retourne la position de l'élément dans le tableau
        // splice() supprime l'élément du tableau /!\ ne pas confondre avec slice()				
		tableau.splice(tableau.indexOf(prenom), 1);  		
				
		console.log("Tableau après suppression du prénom "+prenom+" : "+tableau);
				
		// On ajoute une case vide à la fin du tableau comme demandé dans l'énoncé
		tableau.push('');
				
		console.log("Tableau après ajout d'un élément à la fin : "+tableau);
	}
			
	console.log("Fin :");
	console.log("- Longueur du tableau : "+tableau.length);
	console.log("- Contenu du tableau : "+tableau); 

**Vérification** 

* Afficher la console de votre navigateur pour voir les messages
* Saisir un prénom absent de la liste, par exemple _Pierre_
* Saisir un prénom présent en milieu de liste, par exemple _Aurélien_
* Pour vérifier s'il n'y a pas d'erreur dans la boucle, saisir le 1<er> prénom de la liste : _Audrey_
* Idem pour le dernier prénom : _Stéphane_

## Exercice 7 : vérification d'un formulaire

> Cet exercice concernait les évènements et la manipulation boucles.

Pas de corrigé car personne n'a exactement le même formulaire. 

Jeu de tests : 

* Prénom : doit accepter les accents, les tirets, les espaces, les apostrophes (prénoms étrangers) : tester _Hervé_,  _Jean-Paul_, _Marie Anne_, _D'hondt_, _Bo_. 
* Prénom : ne doit pas accepter les chiffres
* Prénom et nom doit accepter 2 caractères seulement 
* Nom de famille : mêmes règles que les prénoms, tester le même jeu de valeurs. 
* Ville : idem prénom et nom
* Code postal : ne doit accepter que 5 chiffres (donc ni 4 ni 6), et rien d'autres (espace, lettre...)

Les méthodes Javascript à utiliser étaient :

* `addEventListener()`,
* `document.getElementById()` et `document.getElementById().value`, 
* `document.createElement()` et `document.getElementById().innerHtml()`; 

> Cet exercice peut également être fait avec JQuery.