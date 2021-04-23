-- --------------------------------------------------------
-- BASE 'EXEMPLE' : PARTIE 2 : JOINTURES | CORRIGE EN MARIADB
-- -------------------------------------------------------- 

-- --------------------------------------------------------
-- CORRIGES
-- --------------------------------------------------------

-- 1 : Rechercher le prénom des employés et le n° de la région 
--     de leur département 
SELECT prenom, noregion 
  FROM employe, dept
 WHERE employe.nodep = dept.nodept;

-- 2 : Rechercher le numéro du département, le nom du département, le
--     nom des employés classés par numéro de département (renommer les
--     tables utilisées
SELECT d.nodept, d.nom AS 'Nom Dept', e.nom AS 'Nom Employé' 
FROM employe e, dept d
WHERE e.nodep = d.nodept 
ORDER BY d.nodept 

-- 3 : Rechercher le nom de l'employé Amartakaldire et le nom de son
--     département, ne pas utiliser de critère de jointure (volontairement).
SELECT e.nom, d.nom
FROM employe e, dept e
WHERE e.nom = 'Amartakaldire'

-- 4 : Rechercher le nom des employés du département Distribution. 
SELECT e.nom AS 'Nom employé', d.nom AS 'Nom dept'
FROM employe e, dept d
WHERE e.nodep = d.nodept
AND d.nom = 'Distribution'

-- 5 : Réécrivez les requêtes 1 et 2 en utilisant la syntaxe originale des jointures

---- Requête 1 : 
SELECT prenom, noregion 
FROM employe
JOIN dept ON dept.nodept = employe.nodep;

---- Requête 2 : 
SELECT d.nodept, d.nom, e.nom 
FROM employe e
JOIN dept d ON d.nodept = e.nodep
ORDER BY d.nodept 

-- --------------------------------------------------------
-- Autojointures 
-- --------------------------------------------------------

-- 6 : Rechercher le nom et le salaire des employés qui gagnent 
--     plus que leur patron, et le nom et le salaire de leur patron
-- 
-- Dans cette requête on utilise 2 fois une même table (employe) 
-- mais avec 2 alias différents 
SELECT e.nom, e.salaire, p.nom, p.salaire 
FROM employe e, employe p
WHERE e.nosup = p.noemp
AND e.salaire > p.salaire;
 
-- --------------------------------------------------------
-- Sous-requêtes 
-- --------------------------------------------------------

-- 7 : Rechercher le nom et le titre des employés qui ont le même 
--     titre que Amartakaldire 
SELECT nom, titre
  FROM employe
 WHERE titre = (SELECT titre
                FROM employe
                WHERE nom = 'Amartakaldire'); 

-- 8 : Rechercher le nom, le salaire et le numéro de département des
--     employés qui gagnent plus qu'un seul employé du département 31,
--     classés par numéro de département et salaire
--
-- ICI : utilisation de ANY
--       et des positions dans ORDER BY
SELECT nom, salaire, nodep
FROM employe
WHERE salaire > ANY (SELECT salaire
                     FROM employe
                     WHERE nodept = 31) 
ORDER BY 3, 2;

-- 9 : Rechercher le nom, le salaire et le numéro de département des
--     employés qui gagnent plus que tous les employés du département 31,
--     classés par numéro de département et salaire.
SELECT nom, salaire, nodep
FROM employe
WHERE salaire > ALL (SELECT salaire
                          FROM employe
						  WHERE nodep = 31) 
ORDER BY 3, 2; 

-- 10 : Rechercher le nom et le titre des employés du service 31 qui ont un
--      titre que l'on trouve dans le département 32
SELECT NOM, TITRE
  FROM EMPLOYE
 WHERE NODEP = 31
   AND TITRE IN (SELECT TITRE
                   FROM EMPLOYE
                  WHERE NODEP = 32);

-- 11 : Rechercher le nom et le titre des employés du service 31 qui ont un
--      titre l'on ne trouve pas dans le département 32
SELECT NOM, TITRE
  FROM EMPLOYE
 WHERE NODEP = 31
   AND TITRE NOT IN (SELECT TITRE
                       FROM EMPLOYE
                      WHERE NODEP = 32);

-- 12 : Rechercher le nom, titre et salaire des employés qui ont le même
--      titre et le même salaire que Fairant
--      /!\ PIEGE : Dans la table : Fairent avec un 'e'  
SELECT nom, titre, salaire
FROM employe
 WHERE (titre, salaire) = (SELECT titre, salaire 
                           FROM employe
                           WHERE nom = 'Fairent');

-- --------------------------------------------------------
-- Requêtes externes 
-- --------------------------------------------------------

-- 13 : Rechercher le numéro de département, nom du département, 
--      nom des employés, en affichant aussi les départements dans 
--      lesquels il n'y a personne, classés par numéro de département 
SELECT nodept, nom AS "Département"
  FROM dept
 WHERE nodept NOT IN (SELECT d.nodept
                        FROM employe e, dept d
                       WHERE e.nodep = d.nodept);

-- --------------------------------------------------------
-- Les groupes 
-- --------------------------------------------------------

-- 14 : Calculer le nombre d'employés de chaque titre
--      Echappement de l'alias comportant une aspostrophe
SELECT titre, count(*) AS 'Nombre d''employés' 
FROM employe 
GROUP BY titre   

-- 15 : Calculer la moyenne des salaires et leur somme par régions
SELECT d.noregion, AVG(e.salaire), SUM(e.salaire)
FROM employe e, dept d
WHERE e.nodep = d.nodept
GROUP BY d.noregion

-- --------------------------------------------------------
-- La clause HAVING 
-- --------------------------------------------------------

-- 3 : Afficher les numéros des départements ayant au moins 3 employés
SELECT nodep, COUNT(*) AS 'Nbre employes'
FROM employe
GROUP BY nodep 
HAVING COUNT(*) >= 3;

-- 4 : Afficher les lettres qui sont l'initiale d'au moins trois employés
-- utiliser l'alias 'extrait'
SELECT SUBSTR(nom,1,1) AS 'extrait', COUNT(*) AS 'Nb lettres'
FROM employe
-- GROUP BY SUBSTR(nom,1,1) 
GROUP BY extrait 
HAVING COUNT(*) >= 3;

-- 5 : Rechercher le salaire maximum et le salaire minimum parmi tous les
--     salariés et l'écart entre les deux
-- ICI : onpeut voir que l'on peut faire des calculs sur des fonctions telles que MIN, MAX... 
SELECT MAX(salaire), MIN(salaire), MAX(salaire) - MIN(salaire) AS "Différence"
FROM employe;

-- 6 : Rechercher le nombre de titres différents
SELECT COUNT(DISTINCT titre) 
FROM employe;

-- 7 :  Pour chaque titre, compter le nombre d'employés possédant ce titre
SELECT titre, count(nom)
FROM employe
GROUP BY titre

-- 8 : Pour chaque nom de département, afficher le nom du département et
--      le nombre d'employés
SELECT d.nom, e.titre, COUNT(e.*) 
FROM employe e, dept d
WHERE d.nodept = e.nodep 
GROUP BY d.nom, e.titre, e.nodep;

-- 9 : Rechercher les titres et la moyenne des salaires par titre dont la
--      moyenne est supérieure à la moyenne des salaires des Représentants
--     
--     distinct(titre) ne change rien au résultat
SELECT titre, AVG(salaire) 
FROM employe
GROUP BY titre
HAVING AVG(salaire) > (SELECT AVG(salaire)
                       FROM employe
                       WHERE titre = 'Représentant');

-- 10 : Rechercher le nombre de salaires renseignés et le 
--      nombre de taux de commission renseignés
-- 
--      Résultat : salaire = 25, tauxcom = 5
-- 
--      Ici, optionnellement on peut préciser NOT NULL sur les 2 champs
--      avec OR (mais pas AND, ce qui signifierait qu'on ne prendrait 
--      que les lignes où salaire et tauxcom tous les 2 nuls    
SELECT COUNT(salaire), COUNT(tauxcom) 
FROM employe
-- WHERE salaire IS NOT NULL
-- OR tauxcom IS NOT NULL