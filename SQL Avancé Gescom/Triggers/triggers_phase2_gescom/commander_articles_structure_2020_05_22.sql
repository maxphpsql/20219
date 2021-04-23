-- 
-- Corrigés exercice Trigger Phase 2 > Base de données : `afpa_gescom`
--
-- Création de la table `commander_articles`
--

DROP TABLE IF EXISTS `commander_articles`;
CREATE TABLE IF NOT EXISTS `commander_articles` (
  `pro_id` int(10) UNSIGNED,
  `qte` int(5) UNSIGNED NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Clé étrangère sur le champ codart vers table produit
ALTER TABLE `commander_articles` ADD FOREIGN KEY (`pro_id`) REFERENCES `products`(`pro_id`);