-- EXERCICES REQUETES BASE HOTEL
-- LOT 1

-- 1 - Afficher la liste des hôtels. Le résultat doit faire apparaître le nom de l’hôtel et la ville
select hot_nom, hot_ville
from hotel;

-- 2 - Afficher la ville de résidence de Mr White Le résultat doit faire apparaître 
-- le nom, le prénom, et l'adresse du client
select cli_ville, cli_nom, cli_prenom, cli_adresse
from client
where cli_nom = 'White';

-- 3 - Afficher la liste des stations dont l’altitude < 1000 
-- Le résultat doit faire apparaître le nom de la station et l'altitude
select sta_nom, sta_altitude
from station
where sta_altitude < 1000;

-- 4 - Afficher la liste des chambres ayant une capacité > 1 
-- Le résultat doit faire apparaître le numéro de la chambre ainsi que la capacité
select cha_numero, cha_capacite
from chambre
where cha_capacite > 1;

-- 5 - Afficher les clients n’habitant pas à Londre 
-- Le résultat doit faire apparaître le nom du client et la ville
select cli_nom, cli_ville
from client
where cli_ville <> 'Londre';
-- ou signe '!=' :
-- where cli_ville != 'Londre';

-- 6 - Afficher la liste des hôtels située sur la ville de Bretou et possédant une catégorie>3 
-- Le résultat doit faire apparaître le nom de l'hôtel, ville et la catégorie
select hot_nom, hot_ville, hot_categorie
from hotel
where hot_ville = 'Bretou' 
and hot_categorie > 3;

-- LOT 2

-- 7 - Afficher la liste des hôtels avec leur station 
-- Le résultat doit faire apparaître le nom de la station, le nom de l’hôtel, la catégorie, la ville)
select sta_nom, hot_nom, hot_categorie, hot_ville
from hotel
join station on sta_id = hot_sta_id;

-- 8 - Afficher la liste des chambres et leur hôtel 
-- Le résultat doit faire apparaître le nom de l’hôtel, la catégorie, la ville, le numéro de la chambre)
select hot_nom, hot_categorie, hot_ville, cha_numero
from chambre
join hotel on hot_id = cha_hot_id;

-- 9 - Afficher la liste des chambres de plus d'une place dans des hôtels situés sur la ville de Bretou 
-- Le résultat doit faire apparaître le nom de l’hôtel, la catégorie, la ville, 
-- le numéro de la chambre et sa capacité)
select cha_numero, cha_capacite, hot_nom, hot_categorie, hot_ville
from chambre
join hotel on hot_id = cha_hot_id 
where hot_ville = 'Bretou' 
and cha_capacite > 1;

-- 10 - Afficher la liste des réservations avec le nom des clients 
-- Le résultat doit faire apparaître le nom du client, le nom de l’hôtel, la date de réservation
select cli_nom, hot_nom, res_date
from client
join reservation on res_cli_id = cli_id
join chambre on cha_id = res_cha_id
join hotel on hot_id = cha_hot_id 

-- 11 - Afficher la liste des chambres avec le nom de l’hôtel et le nom de la station 
-- Le résultat doit faire apparaître le nom de la station, 
-- le nom de l’hôtel, le numéro de la chambre et sa capacité)
select sta_nom, hot_nom, cha_numero, cha_capacite
from station
join hotel on hot_sta_id = sta_id 
join chambre on cha_hot_id = hot_id  

-- 12 - Afficher les réservations avec le nom du client et le nom de l’hôtel 
-- Le résultat doit faire apparaître le nom du client, le nom de l’hôtel, 
-- la date de début du séjour et la durée du séjour
-- +++ REVOIR +++
select cli_nom, hot_nom, r1.res_date_debut, 
       datediff(r1.res_date_fin, r1.res_date_debut) as 'Durée séjour'
from client
-- from client, hotel, reservation, chambre
-- where res_cli_id = cli_id 
-- and res_cha_id = cha_id
-- and hot_id = cha_hot_id  ;
join hotel h on h.hot_id = cha_hot_id
join reservation r1 on r1.res_cha_id = cha_id
join reservation r2 on r2.res_cli_id = cli_id

-- LOT 3

-- 13 - Compter le nombre d’hôtel par station
select sta_nom, count(hot_nom) as NbrHotel
from hotel
join station on sta_id = hot_sta_id 
group by sta_nom;

-- 14 - Compter le nombre de chambres par station
select count(c.cha_id) as 'Nb chambres', s.sta_nom as 'Station' 
from station s
join hotel h on h.hot_sta_id = s.sta_id 
join chambre c on c.cha_hot_id = h.hot_id
group by s.sta_nom
-- ATTENTION : en MariaDB group by 'alias' ne fonctionne pas :
-- ne sort pas le même résultat  
-- group by 'Station' 

-- 15 - Compter le nombre de chambres par station ayant une capacité > 1
select count(cha_id) as 'Nb chambres', s.sta_nom as 'Station'
from station s
join hotel h on h.hot_sta_id = s.sta_id 
join chambre c on c.cha_hot_id = h.hot_id
group by s.sta_nom

-- 16 - Afficher la liste des hôtels pour lesquels Mr Squire a effectué une réservation
select h.hot_nom
from hotel h
join chambre cha on cha.cha_hot_id = h.hot_id 
join reservation r on r.res_cha_id = cha.cha_id 
join client cli on cli.cli_id = r.res_cli_id 
where cli.cli_nom = (
	select cli_nom from client where cli_nom='Squire'
)
group by h.hot_nom

-- 17 - Afficher la durée moyenne des réservations par station
-- AVG sort un résultat décimal : 30,0000
-- pour le formater : 
select s.sta_nom as 'Station', datediff(r.res_date_fin, r.res_date_debut) as 'Durée moyenne (jours)' 
from reservation r
join chambre cha on cha.cha_id = r.res_cha_id
join hotel h on h.hot_id = cha.cha_hot_id
join station s on s.sta_id = h.hot_sta_id
group by s.sta_nom

-- Pour enlever les décimales dues à AVG : utiliser format() avec le paramètre '0' 
-- ne pas utiliser round() qui arrondit à l'entier supérieur et donc pourrait fausser le résultat    
select s.sta_nom as 'Station', format(avg(datediff(r.res_date_fin, r.res_date_debut)), 0) as 'Durée moyenne (jours)' 
from reservation r
join chambre cha on cha.cha_id = r.res_cha_id
join hotel h on h.hot_id = cha.cha_hot_id
join station s on s.sta_id = h.hot_sta_id
group by s.sta_nom;