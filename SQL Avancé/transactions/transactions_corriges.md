# Transactions MySql : corrigés

> Base de données: _papyrus_.

## Exercice 1

Sous PhpMyAdmin, après avoir sélectionné votre base _Papyrus_, codez le script suivant et exécutez-le :

    /* On démarre la transcation */
    START TRANSACTION;

    /* Affiche le nom du founisseur 120 ('GROBRIGAN') */
    SELECT nomfou FROM fournis WHERE numfou=120;

    /* Modifie le nom du fournisseur 120 */
    UPDATE fournis  SET nomfou= 'GROSBRIGAND' WHERE numfou=120; 
    
    /* Affiche à nouveau le nom du founisseur 120 () */
    SELECT nomfou FROM fournis WHERE numfou=120;

Exécutez ces instructions ligne par ligne !

L'instruction `START TRANSACTION` est suivie d'une instruction `UPDATE`, mais aucune instruction `COMMIT` ou `ROLLBACK` correspondante n'est présente.

**Que concluez-vous ?** 

Cela s'est exécuté sans erreur mais la modification n'est pas sauvegardée.

**Les données sont-elles modifiables par d'autres utilisateurs (ouvrez une nouvelle fenêtre de requête pour interroger le fournisseur 120 par une instruction SELECT) ?**



**La transaction est-elle terminée ?**

Non.

**Comment rendre la modification permanente ?**

Ajouter l'instruction `COMMIT` à la fin permet de sauvegarder la modification :

	START TRANSACTION;
    SELECT nomfou FROM fournis WHERE numfou=120;
    UPDATE fournis  SET nomfou= 'GROSBRIGAND' WHERE numfou=120; 
    SELECT nomfou FROM fournis WHERE numfou=120; 
    COMMIT;

**Comment annuler la transaction ?**

Ajouter l'instruction `COMMIT` à la fin permet de sauvegarder la modification :

	START TRANSACTION;
    SELECT nomfou FROM fournis WHERE numfou=120;
    UPDATE fournis  SET nomfou= 'GROSBRIGAND' WHERE numfou=120; 
    SELECT nomfou FROM fournis WHERE numfou=120; 
    COMMIT;
    ROLLBACK;

Codez les instructions nécessaires dans chaque cas pour vérifier vos réponses.  

## Exercice 2 : les verrouillages

Dans l'exercice précédent, nous avons vu que d'autres utilisateurs ne pouvaient pas accéder aux modifications en cours de la ligne tant que la transaction n'était pas terminée.

** Pourquoi ?**
Recommencez l'exécution du script de l'exercice précédent, puis ouvrez une nouvelle fenêtre (Ctrl + N dans Heidi SQL), et définissez le niveau d'isolement à la valeur `UNCOMMITTED`.

**Interrogez le fournisseur 120. Que constatez-vous ? Expliquez.** 

## Les transactions avec PHP et PDO

L'objet PDO de PHP permet d'exécuter des transactions. 

**Exemple :**

	try 
    {  
	   // Equivaut à l'instruction START TRANSACTION 
	   $dbh->beginTransaction();
         
	   $dbh->query("SELECT nomfou FROM fournis WHERE numfou=120");
       $dbh->query(" UPDATE fournis  SET nomfou= 'GROSBRIGAND' WHERE numfou=120");	     

       // Il n'y a pas eu d'erreur donc on valide
	   $dbh->commit();	
	} 
    catch (Exception $e) 
    {
	   $dbh->rollBack();
	   echo "Echec de la transaction :<br>";
       echo" Message : ".$e->getMessage()."<br>"; 
       echo" Message : ".$e->getMessage()."<br>";
	}

    // Requête de vérification : la modification a-t-elle été effectuée ?
    $dbh->query("SELECT nomfou FROM fournis WHERE numfou=120");