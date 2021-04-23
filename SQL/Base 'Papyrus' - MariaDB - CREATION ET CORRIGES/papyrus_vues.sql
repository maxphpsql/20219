-- LES VUES SUR BASE PAPYRUS


-- Créez les vues :

-- GlobalCde correspondant à la requête : « A partir de la table Ligcom, afficher par code produit, 
-- la somme des quantités commandées et le prix total correspondant : on nommera la colonne correspondant 
-- à la somme des quantités commandées, QteTot et le prix total, PrixTot. 
create view GlobalCde as
select codart, sum(qtecde) as QteTot, sum( qtecde*priuni) as PrixTot
from ligcom
group by codart

-- VentesI100 correspondant à la requête : « Afficher les ventes dont le code produit est le I100 »
-- (Affichage de toutes les colonnes de la table Vente) 
create view VentesI100 as
select *
from vente
where codart = 'I100'

-- Interrogez les vues, pour vérifier qu’elles correspondent bien à vos attentes. 
select * from GlobalCde

select * from VentesI100
 
-- On peut également créer une vue à partir d’une vue : à partir de VentesI100, créer la vue 
-- VentesI100Grobrigan (toutes les ventes concernant le produit I100 et le fournisseur 00120). 
create view VentesI100Grobrigan as
select * from VentesI100
where numfou = 00120

select * from VentesI100Grobrigan