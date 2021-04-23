-- --------------------------------------------------------
-- BASE 'EXEMPLE' : PARTIE 1 : REQUETES | CORRIGE EN MARIADB
-- -------------------------------------------------------- 

-- 1 : Afficher toutes les informations des employés
select * from employe

-- 2 : Afficher toutes les informations concernant les départements
select nodept, nom, noregion 
from dept

-- 3 : Afficher le nom, la date d'embauche, le numéro du supérieur, le
--     numéro de département et le salaire de tous les employés. 
select nom, dateemb, nosup, nodep, salaire 
from employe

-- 4 : Afficher le titre de tous les employés
select titre  
from employe 

-- 5 : Afficher les différentes valeurs des titres des employés
--     nb résultats : 8 
select distinct(titre)  
from employe 

-- 6 : Afficher le nom, le numéro d'employé et le numéro du
--     département des employés dont le titre est « Secrétaire ».
--     (8 résultats) 
select nom, noemp, nodep, titre   
from employe 
where titre = "Secrétaire"

-- 7 : Afficher le nom et le numéro de département dont le numéro de
--     département est supérieur à 40 (6 résultats) 
select nom, noemp   
from departement
where nodep > 40

-- 8 : Afficher le nom et le prénom des employés dont le nom est
--     alphabétiquement antérieur au prénom  
select nom, prenom
from employe 
where nom < prenom

-- 9 : Afficher le nom, le salaire et le n° du département des employés
-- dont le titre est 'Représentant', le n° de département est 35 et
-- le salaire est supérieur à 20000. 
select nom, salaire, nodep
from employe
where titre = 'Représentant' 
and nodep = 35
and salaire > 20000

-- 10 : Afficher le nom, le titre et le salaire des employés dont le titre est 
--      'Représentant' ou 'Président'
select nom, titre, salaire 
from employe
where titre = 'Représentant' 
or titre = 'Président' 

-- 11 : Afficher le nom, le titre, le numéro de département, le salaire des
--      employés du département 34, dont le titre est 'Représentant' ou
--      'Secrétaire'
select nom, titre, nodep, salaire
from employe
where (titre = 'Représentant' or titre = 'Secrétaire')
and nodep = 34 

-- 12 : Afficher le nom, le titre, le numéro de département, le salaire des
-- employés dont le titre est Représentant, ou dont le titre est secrétaire
-- dans le département numéro 34 
select nom, titre, nodep, salaire 
from employe
where titre = 'Représentant'
or (titre = 'Secrétaire' and nodep = 34) 

-- 13 : Afficher le nom et le salaire des employés dont le salaire est compris
--      entre 20000 et 30000
select nom, salaire
from employe
where salaire >= 20000 
and salaire <= 30000

-- Ou utilisation de BETWEEN :
select nom, salaire
from employe
where salaire between 20000 AND 30000

-- 14 : Afficher le nom, le titre, le numéro de département des employés dont
--      le titre appartient à la liste : 'Représentant', 'Secrétaire' 
select nom, titre, nodep
from employe
where titre = 'Représentant' 
or titre = 'Secrétaire'

-- ou :
select nom, titre, nodep
from employe
where titre in ('Représentant', 'Secrétaire')

-- 15 : Afficher le nom des employés commençant par la lettre 'H'
SELECT nom
  FROM employe
 WHERE nom LIKE 'H%'
 -- Recherche de la lettre quelque soit sa position :
 -- WHERE nom LIKE '%h%'
 -- Recherche d'un extrait de chaîne : 
 -- WHERE nom LIKE '%hot%'

-- 16 : Afficher le nom des employés se terminant par la lettre 'n'
SELECT nom
FROM employe
WHERE nom LIKE '%n'

-- 17 : Afficher le nom des employés contenant la lettre 'u' en 3ème
--      position
SELECT nom 
FROM employe
WHERE nom LIKE '__u%'  

-- 18 : Afficher le salaire et le nom des employés du service 41 classés 
--      par salaire croissant
SELECT salaire, nom
FROM employe
WHERE nodep = 41 
ORDER BY salaire ASC

-- ou (ASC étant facultatif) : 
SELECT salaire, nom
FROM employe
WHERE nodep = 41 
ORDER BY salaire 

-- 19 : Afficher le salaire et le nom des employés du service 41 classés 
--      par salaire décroissant
SELECT salaire, nom
FROM employe
WHERE nodep = 41 
ORDER BY salaire DESC

-- 20 : Afficher le titre, le salaire et le nom des employés classés 
--      par titre croissant et par salaire décroissant
SELECT titre, salaire, nom
FROM emp
ORDER BY titre, salaire DESC

-- 21 : Afficher le taux de commission, le salaire et le nom des employés
--      classés par taux de commission croissante
SELECT tauxcom, salaire, nom
FROM employe
ORDER BY tauxcom

-- 22 : Afficher le nom, le salaire, le taux de commission et le titre des
--      employés dont le taux de commission n'est pas renseigné
SELECT nom, salaire, tauxcom, titre 
FROM employe
WHERE tauxcom IS NULL

-- 23 : Afficher le nom, le salaire, le taux de commission et le titre des
--      employés dont le taux de commission est renseigné
SELECT nom, salaire, tauxcom, titre
FROM employe
WHERE tauxcom IS NOT NULL

-- 24 : Afficher le nom, le salaire, le taux de commission, le titre des
--      employés dont le taux de commission est inférieur à 15
SELECT nom, salaire, tauxcom, titre 
FROM employe
WHERE tauxcom < 15 

-- 25 : Afficher le nom, le salaire, le taux de commission, le titre des
--      employés dont le taux de commission est supérieur à 15
SELECT nom, salaire, tauxcom, titre 
FROM employe 
WHERE tauxcom > 15

-- 26 : Afficher le nom, le salaire, le taux de commission et la commission 
--      des employés dont le taux de commission n'est pas nul. (la commission
--      est calculée en multipliant le salaire par le taux de commission)
SELECT nom, salaire, tauxcom, salaire * tauxcom/100 
FROM employe 
WHERE tauxcom IS NOT NULL

-- 27 : Afficher le nom, le salaire, le taux de commission, la commission des
--      employés dont le taux de commission n'est pas nul, classé par taux de
--      commission croissant
SELECT nom, salaire, tauxcom, salaire * tauxcom/100 
FROM employe 
WHERE tauxcom IS NOT NULL 
ORDER BY 3 

-- 28 : Afficher le nom et le prénom (concaténés) des employés. 
--      Renommer les colonnes
SELECT Concat(nom, ' ', prenom) AS "Nom, Prenom" 
FROM employe;

-- Syntaxe MySql, ne fonctionne pas en MariaDB : 
/*
SELECT nom ||' '|| prenom AS "Nom, Prenom"
FROM employe
*/

-- 29 : Afficher les 5 premières lettres du nom des employés
SELECT SUBSTR(nom, 1,5)
FROM employe;

-- 30 : Afficher le nom et le rang de la lettre 'r' à partir de la 3ème lettre
--      dans le nom des employés
--      Fonction LOCATE spécifique à MariaDb (en MySql : STRPOS)
SELECT nom, LOCATE('r', nom, 3) AS 'position'
FROM employe
WHERE LOCATE('r', nom, 3) = 3

-- 31 : Afficher le nom, le nom en majuscule et le nom en minuscule de
--      l'employé dont le nom est Vrante
SELECT nom, UPPER(nom) , LOWER(nom)
FROM employe 
WHERE UPPER(nom) = UPPER('Vrante');

-- 32 : Afficher le nom et le nombre de caractères du nom des employés
SELECT nom, LENGTH(nom)
FROM employe;