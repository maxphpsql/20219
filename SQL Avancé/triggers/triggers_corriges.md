# Déclencheurs : corrigés

## Rappel

* Pour vérifier l'existence d'un déclencheur, utiliser la commande `SHOW TRIGGERS;`

## Phase 1 - Bien débuter avec les déclencheurs

> Base de données : _hotel_.

## Phase 2  - Exercice sur la base Papyrus

### Exercices

A partir de l'exemple suivant, créez les déclencheurs suivants :

1. **modif_reservation** : interdire la modification des réservations (on autorise l'ajout et la suppression).


	DROP TRIGGER IF EXISTS `modif_reservation`;
	DELIMITER $$
	CREATE TRIGGER `modif_reservation` BEFORE UPDATE ON `reservation` 
    FOR EACH ROW 
    BEGIN
		 SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'La modification de réservations est interdite';
	END $$
	DELIMITER ;

2. **insert_reservation** : interdire l'ajout de réservation pour les hôtels possédant déjà 10 réservations.

> Il existe déjà 8 réservations pour les chambres n°1 à 4 toutes dans l'hôtel n°1 (). Pour tester notre déclencheur, il faut arriver à 10 minimum donc ajouter 2 réservations : 

	INSERT INTO `reservation` (`res_id`, `res_cha_id`, `res_cli_id`, `res_date`, `res_date_debut`, `res_date_fin`, `res_prix`, `res_arrhes`) VALUES
	(100, 1, 1, '2019-02-18 00:00:00', '2019-08-01 00:00:00', '2019-08-10 00:00:00', '100.00', '50.00'),
	(101, 1, 2, '2019-02-18 00:00:00', '2019-08-01 00:00:00', '2019-08-10 00:00:00', '100.00', '50.00');
	
Le code du déclencheur est le suivant :

    DROP TRIGGER IF EXISTS `insert_reservation`;
	DELIMITER $$
	CREATE TRIGGER `modif_reservation` BEFORE INSERT ON `reservation` 
    FOR EACH ROW 
    BEGIN
         DECLARE _nbreserv INT;
         
         SET _nbreserv = (SELECT COUNT(*) FROM reservation WHERE  = OLD.res_cha_id);

		 SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'La modification de réservations est interdite';
	END $$
	DELIMITER ;
    
3. **insert_reservation2** : interdire les réservations si le client possède déjà 3 réservations.



4. **insert_chambre** : lors d'une insertion, on calcule le total des capacités des chambres pour l'hôtel, si ce total est supérieur à 50, on interdit l'insertion de la chambre.




Requête de test pour la Q2 :
	SELECT hot_id, count(res_id) AS nbreserv
	FROM reservation
	JOIN chambre ON res_cha_id = cha_id
	JOIN hotel ON cha_hot_id = hot_id
    
    
    
    





