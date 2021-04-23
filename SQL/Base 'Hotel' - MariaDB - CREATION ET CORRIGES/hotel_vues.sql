-- LES VUES SUR BASE HOTEL


-- 1) Afficher la liste des hôtels avec leur station
create view HotelParStation as
select hot_nom, sta_nom
from hotel
join station on sta_id = hot_sta_id

select * from HotelParStation

-- 2) Afficher la liste des chambres et leur hôtel
create view ChambreParHotel as
select hot_nom, cha_numero
from chambre
join hotel on cha_hot_id = hot_id

select * from ChambreParHotel

-- 3) Afficher la liste des réservations avec le nom des clients
create view ReservationsClients as
select cli_nom, hot_nom, res_date
from client, hotel, reservation, chambre
where res_cli_id = cli_id
and res_cha_id = cha_id
and cha_hot_id = hot_id

select * from ReservationsClients

-- 4) Afficher la liste des chambres avec le nom de l’hôtel et le nom de la station
create view ChambreParHotelEtStation as
select sta_nom, hot_nom, cha_numero
from station, hotel, chambre
where cha_hot_id = hot_id and hot_sta_id = sta_id

select * from ChambreParHotelEtStation

-- 5) Afficher les réservations avec le nom du client et le nom de l’hôtel
create view ReservationsClientParHotel as
select cli_nom, hot_nom, res_date_debut, datediff(res_date_fin, res_date_debut) as DuréeSéjour
from client, hotel, reservation, chambre
where res_cli_id = cli_id 
and res_cha_id = cha_id
and cha_hot_id = hot_id

select * from ReservationsClientParHotel 