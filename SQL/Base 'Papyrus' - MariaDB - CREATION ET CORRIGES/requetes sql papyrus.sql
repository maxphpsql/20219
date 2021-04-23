-- LES BESOINS D'AFFICHAGE PAPYRUS

-- 1. Quelles sont les commandes du fournisseur 09120 ?
select numcom
from entcom
join fournis on entcom.numfou = fournis.numfou
where fournis.numfou = 09120

-- 2. Afficher le code des fournisseurs pour lesquels des commandes ont été passées.
select fournis.numfou
from fournis
join entcom on entcom.numfou = fournis.numfou
group by fournis.numfou

-- 3. Afficher le nombre de commandes fournisseurs passées, et le nombre de
-- fournisseur concernés.
select count(numcom), count(distinct nomfou)
from fournis
join entcom on entcom.numfou = fournis.numfou

-- 4. Editer les produits ayant un stock inférieur ou égal au stock d'alerte et dont la
-- quantité annuelle est inférieur est inférieure à 1000(informations à fournir : n° produit, 
-- libellé produit, stock, stock actuel d'alerte, quantité annuelle)
select codart, libart, stkphy, stkale, qteann
from produit
where stkphy <= stkale and qteann < 1000

-- 5. Quels sont les fournisseurs situés dans les départements 75 78 92 77 ?
-- L’affichage (département, nom fournisseur) sera effectué par département
-- décroissant, puis par ordre alphabétique
select nomfou, substring(posfou, 1 ,2) as departement
from fournis
where substring(posfou, 1 ,2)  = 72 or 78 or 92 or 77
order by departement desc

-- 6. Quelles sont les commandes passées au mois de mars et avril ?
select numcom, substring(derliv,6, 2) as mois
from ligcom
where substring(derliv, 6, 2) = 04 or substring(derliv, 6, 2) = 03

-- 7. Quelles sont les commandes du jour qui ont des observations particulières ?
-- (Affichage numéro de commande, date de commande)
select numcom, datcom
from entcom
where obscom <> ''

-- 8. Lister le total de chaque commande par total décroissant
-- (Affichage numéro de commande et total)
select entcom.numcom, sum( qtecde*priuni) as total
from entcom
join ligcom on entcom.numcom = ligcom.numcom
group by entcom.numcom desc

-- 9. Lister les commandes dont le total est supérieur à 10 000€ ; on exclura dans le
-- calcul du total les articles commandés en quantité supérieure ou égale à 1000.
-- (Affichage numéro de commande et total)
select entcom.numcom, sum(qtecde*priuni) as total
from entcom
join ligcom on entcom.numcom = ligcom.numcom
where qtecde < 1000 
group by entcom.numcom
having sum(qtecde*priuni) > 10000

-- 10.Lister les commandes par nom fournisseur
-- (Afficher le nom du fournisseur, le numéro de commande et la date)
select nomfou, entcom.numcom, derliv
from entcom
left join fournis on entcom.numfou = fournis.numfou 
join ligcom on ligcom.numcom = entcom.numcom
group by numcom

-- 11.Sortir les produits des commandes ayant le mot "urgent' en observation?
-- (Afficher le numéro de commande, le nom du fournisseur, le libellé du produit et
-- le sous total = quantité commandée * Prix unitaire)
select entcom.numcom, nomfou, libart, (qtecde*priuni) as SousTotal
from entcom
join fournis on entcom.numfou = fournis.numfou
join ligcom on ligcom.numcom = entcom.numcom
join produit on produit.codart = ligcom.codart
where obscom = 'Commande urgente'

-- 12.Coder de 2 manières différentes la requête suivante :
-- Lister le nom des fournisseurs susceptibles de livrer au moins un article

-- a-
select distinct fournis.nomfou
from entcom
join fournis on entcom.numfou = fournis.numfou
join ligcom on ligcom.numcom = entcom.numcom
where qteliv < qtecde
-- b-
select nomfou
from fournis
where numfou in (
			select numfou
			from entcom
			where numcom in (
					select numcom
					from ligcom
					where qteliv < qtecde))

-- 13.Coder de 2 manières différentes la requête suivante
-- Lister les commandes (Numéro et date) dont le fournisseur est celui de la commande 70210
select entcom.numcom, derliv
from entcom 
join ligcom on entcom.numcom = ligcom.numcom
join fournis on entcom.numfou = fournis.numfou
where entcom.numfou in (
		select numfou
		from entcom
		where entcom.numcom = 70210)
group by entcom.numcom

-- 14.Dans les articles susceptibles d’être vendus, lister les articles moins chers (basés
-- sur Prix1) que le moins cher des rubans (article dont le premier caractère
-- commence par R). On affichera le libellé de l’article et prix1
select libart, prix1
from produit p
join vente v on v.codart = p.codart
group by libart, v.codart, v.prix1
having v.prix1 < (
		select min(v2.prix1)
		from vente v1, vente v2
		where v2.codart = v1.codart and left(v2.codart,1) like 'r')
		
-- 15.Editer la liste des fournisseurs susceptibles de livrer les produits dont le stock est
-- inférieur ou égal à 150 % du stock d'alerte. La liste est triée par produit puis fournisseur
select libart, nomfou
from produit
join vente on produit.codart = vente.codart
join fournis on fournis.numfou = vente.numfou
group by libart, nomfou, stkphy having stkphy <= sum( stkale + (stkale* 50/100))
order by libart, nomfou

-- 16.Éditer la liste des fournisseurs susceptibles de livrer les produit dont le stock est
-- inférieur ou égal à 150 % du stock d'alerte et un délai de livraison d'au plus 30
-- jours. La liste est triée par fournisseur puis produit
select libart, nomfou
from produit
join vente on produit.codart = vente.codart
join fournis on fournis.numfou = vente.numfou
where delliv <= 30
group by libart, nomfou, stkphy having stkphy <= sum( stkale + (stkale* 50/100))
order by nomfou, libart

-- 17.Avec le même type de sélection que ci-dessus, sortir un total des stocks par
-- fournisseur trié par total décroissant
select libart, nomfou, stkphy
from produit
join vente on produit.codart = vente.codart
join fournis on fournis.numfou = vente.numfou
where delliv <= 30
group by libart, nomfou, stkphy having stkphy <= sum( stkale + (stkale* 50/100))
order by stkphy desc, nomfou, libart

-- 18.En fin d'année, sortir la liste des produits dont la quantité réellement commandée
-- dépasse 90% de la quantité annuelle prévue.
select libart
from ligcom
join produit on ligcom.codart = produit.codart
where qtecde > (90/100 * qteann)

-- 19.Calculer le chiffre d'affaire par fournisseur pour l'année 93 sachant que les prix
-- indiqués sont hors taxes et que le taux de TVA est 20%.
SELECT DISTINCT(nomfou), SUM(qtecde*priuni*1.2) AS CA 
from fournis f
JOIN entcom e ON e.numfou=f.numfou
JOIN ligcom l ON l.numcom=e.numcom
GROUP BY nomfou, datcom 
HAVING year(datcom) = 1993

-- 20.Existe-t-il des lignes de commande non cohérentes avec les produits vendus par
-- les fournisseurs. ?
SELECT numlig 
from ligcom l
JOIN vente v ON v.codart=l.codart
WHERE qtecde <= qte1 or qtecde <= qte2 or qtecde <= qte3
GROUP BY numlig, l.codart 
HAVING NOT EXISTS (SELECT v.codart from vente AS v WHERE v.codart=l.codart)


-- LES BESOINS DE MISE A JOUR

-- 1. Application d'une augmentation de tarif de 4% pour le prix 1, 2% pour le prix2
-- pour le fournisseur 9180
update vente
set prix1 = prix1 * 1.04, prix2 = prix2 * 1.02
where numfou = 9120

-- 2. Dans la table vente, mettre à jour le prix2 des articles dont le prix2 est null, en
-- affectant a valeur de prix.
update vente
set prix2 = prix1
where prix2 = 0

-- 3. Mettre à jour le champ obscom en positionnant '*****' pour toutes les commandes
-- dont le fournisseur a un indice de satisfaction <5
update entcom
join fournis on entcom.numfou = fournis.numfou
set obscom = '*****'
where satisf < 5

-- 4. Suppression du produit I110
delete from vente
where codart = 'I110'
delete from produit
where codart = 'I110'

-- 5. Suppression des entête de commande qui n'ont aucune ligne



