

                                    // Exercice 1 - Total d'une commande
/*
console.log("Début de saisie des tarifs");
console.log("==========================");
var PU = prompt("Veuillez saisir le Prix Unitaire TTC de l'article :");
var QTECOM = prompt("Veuillez saisir le nombre d'articles commandés :");
var TOT = PU * QTECOM;

    if (TOT < 500)
    {
        PORT = TOT * 0.02;
        if ((PORT < 6) === true)
        {
            PORT = 6;
            console.log("le prix des frais de port s'éleve à : " + PORT);
        }
    } else{
            PORT = 0;
    }
    if (TOT >= 100 && TOT < 200)
    {
        REM = TOT * 0.05;
    } else if (TOT >= 200)
    {
        REM = TOT * 0.10;
    } else
    {
        REM = 0;
    }
    var PAP = TOT + PORT - REM;      // correction du 30.09 Parce que les remises je préferais les faire payer au client !
    alert("Le montant total de votre commande s'élève à : " + PAP + "€" + "\n" + "\n" + "prix de la commande TTC : " + TOT + "€" + "\n" + "Montant des frais de port : " + PORT + "€" + "\n" + "Montant de votre remise : " + REM + "€");
*/
                                    // FIN Exercice 1 - Total d'une commande 










                                    // Exercice 2 - Somme des entiers inférieurs à N

/*var n = prompt("Veuillez saisir un nombre entier : ");
var j = 0;
for (i = 1; i < n; i++)
    {
        j = i + j;
        console.log(j);
    }
alert("la somme des entier jusqu'à " + n + " est : " + j)*/

                                    // FIN Exercice 2 - Somme des entiers inférieurs à N 










                                    // Exercice 3 - Mini et maxi
/*                                   
var note = undefined;
var saisie = 1;
var min = {};
var max = {};
console.log("Début de saisie des notes");
console.log("====================================");
do
{
    var note = prompt("Veuillez  saisir une note :");
    if (note == 0)
    {
        saisie--;
        break;
    }
    console.log(note)
    if (min === undefined)
    {
       


                                   










                                   // Exercice 4 - Calcul du nombre de jeunes / adultes / vieux
/*                                   
var jeune = 0;  // < 20
var adulte = 0;  //  >= 20 et >= 40
var vieux = 0;   // > 40
var age = {};
i = 1;

do{
var age = prompt("Veuillez saisir les âges :");
if ((age < 20) === true){
    jeune = jeune + 1;
}
if  ((age >= 20 && age <= 40) === true){
    adulte = adulte + 1;
}
if ((age > 40) === true){
    vieux = vieux + 1;
}
} while (age <= 100)
alert("Voici la répartition des âges saisis : "+ "\n" + "- Jeunes : " + jeune + "\n" + "- Adultes : " + adulte + "\n" + "- Vieux : " + vieux)
*/
                                   // FIN Exercice 4 - Calcul du nombre de jeunes / adultes / vieux 








                                   // Exercice 5 - table de multiplication
/*
var n = {};
function TableMultiplication(n)
{
    for (i = 1; i <= 10; i++)
    {
        result = n * i;
        console.log(n + " * " + i + " = " + result);
    }
}
*/
                                   // FIN Exercice 5 - table de multiplication 








                                   // Exercice 6 - Recherche d'un prénom 
/*
var tab = ["Audrey", "Aurélien", "Flavien", "Jérémy", "Laurent", "Melik", "Nouara", "Salem", "Samuel", "Stéphane"];
console.log(tab);
var prenom = prompt("Veuillez saisir un prénom :");
if (tab.indexOf(prenom) != -1)
{
    tab.splice(tab.indexOf(prenom), 1);
    console.log(prenom);
    console.log(tab);
}
else
{
    alert("Le prénom n'existe pas dans la base de donnée :(");
}
*/
                                    // FIN Exercice 6 - Recherche d'un Prénom








                                   // Exercice 7 - Verification de Formulaire /!\ Ouvrir la page HTML "Contact" de Projet HTML + CSS
                            
/*
 document.getElementById("form1").addEventListener("submit", function(e)
 {
    
     var erreur;
     var nom = document.getElementById("nom");
     var prenom = document.getElementById("prenom");
     var sexeF = document.getElementById("sexeF");
     var sexeM = document.getElementById("sexeM");
     var email = document.getElementById("email");
     var date = document.getElementById("date");
     var sujet = document.getElementById("sujet");
     var commentaire = document.getElementById("commentaire");
    

     function checkForm(form1)
     {
       
       if(!form1.traitement.checked == true) {
         erreur = "Veuillez cocher l'envoi du formulaire"
         return false;
       }
       return true;
     }
     if (!commentaire.value)
     {
         erreur = "Veuillez saisir un commentaire";
     }
     if (!sujet.value)
     {
         erreur = "Veuillez sélectionner un sujet";
     }
     if (!date.value)
     {
         erreur = "Veuillez renseigner votre date de naissance";
     }
     if (!(sexeM.checked == true || sexeF.checked == true))
     {
         erreur = "Veuillez indiquer votre sexe";
     }
     if (!email.value)
     {
         erreur = "Veuillez renseigner une adresse email";
     }
     if (!prenom.value)
     {
         erreur = "Veuillez renseigner votre prénom";
     }
     if (!nom.value)
     {
         erreur = "Veuillez renseigner votre nom";
     }
     if (erreur)
     {
         e.preventDefault();
         document.getElementById("erreur").innerHTML = erreur;
         return false;
     }
 })*/


 var nom = prompt("Veuillez saisir votre nom :");

 for (i = 1; i<=5; i++)
  {
     console.log(nom);
 }

