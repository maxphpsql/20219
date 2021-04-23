-- --------------------------------------------------------
-- BASE 'EXEMPLE' : PARTIE 1 : REQUETES | CORRIGE EN MARIADB
-- -------------------------------------------------------- 

-- 1 : Afficher toutes les informations des employ�s
select * from employe

-- 2 : Afficher toutes les informations concernant les d�partements
select nodept, nom, noregion 
from dept

-- 3 : Afficher le nom, la date d'embauche, le num�ro du sup�rieur, le
--     num�ro de d�partement et le salaire de tous les employ�s. 
select nom, dateemb, nosup, nodep, salaire 
from employe

-- 4 : Afficher le titre de tous les employ�s
select titre  
from employe 

-- 5 : Afficher les diff�rentes valeurs des titres des employ�s
--     nb r�sultats : 8 
select distinct(titre)  
from employe 

-- 6 : Afficher le nom, le num�ro d'employ� et le num�ro du
--     d�partement des employ�s dont le titre est � Secr�taire �.
--     (8 r�sultats) 
select nom, noemp, nodep, titre   
from employe 
where titre = "Secr�taire"

-- 7 : Afficher le nom et le num�ro de d�partement dont le num�ro de
--     d�partement est sup�rieur � 40 (6 r�sultats) 
select nom, noemp   
from departement
where nodep > 40

-- 8 : Afficher le nom et le pr�nom des employ�s dont le nom est
--     alphab�tiquement ant�rieur au pr�nom  
select nom, prenom
from employe 
where nom < prenom

-- 9 : Afficher le nom, le salaire et le n� du d�partement des employ�s
-- dont le titre est 'Repr�sentant', le n� de d�partement est 35 et
-- le salaire est sup�rieur � 20000. 
select nom, salaire, nodep
from employe
where titre = 'Repr�sentant' 
and nodep = 35
and salaire > 20000

-- 10 : Afficher le nom, le titre et le salaire des employ�s dont le titre est 
--      'Repr�sentant' ou 'Pr�sident'
select nom, titre, salaire 
from employe
where titre = 'Repr�sentant' 
or titre = 'Pr�sident' 

-- 11 : Afficher le nom, le titre, le num�ro de d�partement, le salaire des
--      employ�s du d�partement 34, dont le titre est 'Repr�sentant' ou
--      'Secr�taire'
select nom, titre, nodep, salaire
from employe
where (titre = 'Repr�sentant' or titre = 'Secr�taire')
and nodep = 34 

-- 12 : Afficher le nom, le titre, le num�ro de d�partement, le salaire des
-- employ�s dont le titre est Repr�sentant, ou dont le titre est secr�taire
-- dans le d�partement num�ro 34 
select nom, titre, nodep, salaire 
from employe
where titre = 'Repr�sentant'
or (titre = 'Secr�taire' and nodep = 34) 

-- 13 : Afficher le nom et le salaire des employ�s dont le salaire est compris
--      entre 20000 et 30000
select nom, salaire
from employe
where salaire >= 20000 
and salaire <= 30000

-- Ou utilisation de BETWEEN :
select nom, salaire
from employe
where salaire between 20000 AND 30000

-- 14 : Afficher le nom, le titre, le num�ro de d�partement des employ�s dont
--      le titre appartient � la liste : 'Repr�sentant', 'Secr�taire' 
select nom, titre, nodep
from employe
where titre = 'Repr�sentant' 
or titre = 'Secr�taire'

-- ou :
select nom, titre, nodep
from employe
where titre in ('Repr�sentant', 'Secr�taire')

-- 15 : Afficher le nom des employ�s commen�ant par la lettre 'H'
SELECT nom
  FROM employe
 WHERE nom LIKE 'H%'
 -- Recherche de la lettre quelque soit sa position :
 -- WHERE nom LIKE '%h%'
 -- Recherche d'un extrait de cha�ne : 
 -- WHERE nom LIKE '%hot%'

-- 16 : Afficher le nom des employ�s se terminant par la lettre 'n'
SELECT nom
FROM employe
WHERE nom LIKE '%n'

-- 17 : Afficher le nom des employ�s contenant la lettre 'u' en 3�me
--      position
SELECT nom 
FROM employe
WHERE nom LIKE '__u%'  

-- 18 : Afficher le salaire et le nom des employ�s du service 41 class�s 
--      par salaire croissant
SELECT salaire, nom
FROM employe
WHERE nodep = 41 
ORDER BY salaire ASC

-- ou (ASC �tant facultatif) : 
SELECT salaire, nom
FROM employe
WHERE nodep = 41 
ORDER BY salaire 

-- 19 : Afficher le salaire et le nom des employ�s du service 41 class�s 
--      par salaire d�croissant
SELECT salaire, nom
FROM employe
WHERE nodep = 41 
ORDER BY salaire DESC

-- 20 : Afficher le titre, le salaire et le nom des employ�s class�s 
--      par titre croissant et par salaire d�croissant
SELECT titre, salaire, nom
FROM emp
ORDER BY titre, salaire DESC

-- 21 : Afficher le taux de commission, le salaire et le nom des employ�s
--      class�s par taux de commission croissante
SELECT tauxcom, salaire, nom
FROM employe
ORDER BY tauxcom

-- 22 : Afficher le nom, le salaire, le taux de commission et le titre des
--      employ�s dont le taux de commission n'est pas renseign�
SELECT nom, salaire, tauxcom, titre 
FROM employe
WHERE tauxcom IS NULL

-- 23 : Afficher le nom, le salaire, le taux de commission et le titre des
--      employ�s dont le taux de commission est renseign�
SELECT nom, salaire, tauxcom, titre
FROM employe
WHERE tauxcom IS NOT NULL

-- 24 : Afficher le nom, le salaire, le taux de commission, le titre des
--      employ�s dont le taux de commission est inf�rieur � 15
SELECT nom, salaire, tauxcom, titre 
FROM employe
WHERE tauxcom < 15 

-- 25 : Afficher le nom, le salaire, le taux de commission, le titre des
--      employ�s dont le taux de commission est sup�rieur � 15
SELECT nom, salaire, tauxcom, titre 
FROM employe 
WHERE tauxcom > 15

-- 26 : Afficher le nom, le salaire, le taux de commission et la commission 
--      des employ�s dont le taux de commission n'est pas nul. (la commission
--      est calcul�e en multipliant le salaire par le taux de commission)
SELECT nom, salaire, tauxcom, salaire * tauxcom/100 
FROM employe 
WHERE tauxcom IS NOT NULL

-- 27 : Afficher le nom, le salaire, le taux de commission, la commission des
--      employ�s dont le taux de commission n'est pas nul, class� par taux de
--      commission croissant
SELECT nom, salaire, tauxcom, salaire * tauxcom/100 
FROM employe 
WHERE tauxcom IS NOT NULL 
ORDER BY 3 

-- 28 : Afficher le nom et le pr�nom (concat�n�s) des employ�s. 
--      Renommer les colonnes
SELECT Concat(nom, ' ', prenom) AS "Nom, Prenom" 
FROM employe;

-- Syntaxe MySql, ne fonctionne pas en MariaDB : 
/*
SELECT nom ||' '|| prenom AS "Nom, Prenom"
FROM employe
*/

-- 29 : Afficher les 5 premi�res lettres du nom des employ�s
SELECT SUBSTR(nom, 1,5)
FROM employe;

-- 30 : Afficher le nom et le rang de la lettre 'r' � partir de la 3�me lettre
--      dans le nom des employ�s
--      Fonction LOCATE sp�cifique � MariaDb (en MySql : STRPOS)
SELECT nom, LOCATE('r', nom, 3) AS 'position'
FROM employe
WHERE LOCATE('r', nom, 3) = 3

-- 31 : Afficher le nom, le nom en majuscule et le nom en minuscule de
--      l'employ� dont le nom est Vrante
SELECT nom, UPPER(nom) , LOWER(nom)
FROM employe 
WHERE UPPER(nom) = UPPER('Vrante');

-- 32 : Afficher le nom et le nombre de caract�res du nom des employ�s
SELECT nom, LENGTH(nom)
FROM employe;