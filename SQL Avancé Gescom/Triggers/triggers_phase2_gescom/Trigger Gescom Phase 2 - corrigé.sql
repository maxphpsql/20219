--
-- Déclencheurs `after_produit_update`
--
DROP TRIGGER IF EXISTS `after_produit_update`;

-- On change le délimiteur natif SQL (;) pour, par exemple ici, '$$'
DELIMITER $$

-- Création du trigger nommé `after_produit_update` 
-- qui se déclenche après (AFTER) toute modification (requête UPDATE)
-- sur (ON) la table 'products' 
CREATE TRIGGER `after_produit_update` AFTER UPDATE ON `products` 
-- 'FOR EACH ROW' : pour chaque ligne, instruction obligatoire dans les triggers
FOR EACH ROW 
BEGIN
    -- DECLARE est une instruction qui initialise une variable dont on a besoin dans le trigger
	-- le type doit être indiqué
	
	-- variable _deja_commande 
    DECLARE _deja_commande INT;
	
	-- variable quantité à commander
    DECLARE _qte INT;
   		       
	-- Condition (introduite par IF)   
	-- si le nouveau stock physique (après une commande) est inférieur au stock d'alerte  
    -- NEW.pro_stock_alert aussi fonctionne ici (car sa valeur ne change pas)	
    IF NEW.pro_stock < OLD.pro_stock_alert 
	
	-- Si condition est vraie alors (= THEN) on rentre dedans  
	THEN   	
		-- SET permet d'affecter une valeur à une variable (préalablement déclarée avec DECLARE)
        -- La valeur affectée peut-être le résultat d'un expression (calcul comme ici)
		
		-- on calcule la différence entre le stock d'alerte et le nouveau stock physique
		SET _qte = OLD.pro_stock_alert - NEW.pro_stock;   
        
		-- La valeur affectée peut aussi être le résultat d'une requête SELECT,
        -- mais attention le résultat doit être unique (1 seule colonne d'un seule ligne) 		
		-- Ici, on regarde s'il existe déjà une ligne dans commander_articles pour le produit 
        SET _deja_commande = (SELECT qte FROM commander_articles WHERE pro_id = OLD.pro_id);
               
		-- si _deja_com vaut null (fonction ISNULL), c'est qu'il n'y a pas encore de lignes dans 
        -- commander_articles pour ce produit	
        -- cas 2 du jeu de tests  		
		IF ISNULL(_deja_commande) THEN  
		    -- on insère une ligne dans commander_articles
    		INSERT INTO commander_articles (pro_id, date, qte) VALUES (OLD.pro_id, NOW(), _qte); 	       
		-- Si _dejacom ne vaut pas NULL, c'est qu'il y a déjà une ligne dans commander_articles
		-- pour le produit 
		-- cas 3 du jeu de test 
		ELSE 
          	-- on met à jour la quantité dans commander_articles pour ce produit
            UPDATE commander_articles SET qte = _qte, date = NOW() WHERE pro_id = OLD.pro_id; 		   		   
        END IF;

    -- Fermeture de la condition 'IF NEW.pro_stock < NEW.pro_stock_alert' 		
    END IF;  
	
-- Fin du bloc 'BEGIN'	
END $$

-- Restauration du délimiteur standard
DELIMITER ;