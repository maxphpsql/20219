-- EVALUATION NORTHWIND

-- 1 - Liste des contacts français :
select companyname Société, contactname contact, contacttitle Fonction, phone Téléphone
from customers
where country = 'France'

-- 2 - Produits vendus par le fournisseur « Exotic Liquids » :
select productname Produit, unitprice Prix
from products
join suppliers on products.supplierid = suppliers.supplierid
where companyname = 'Exotic Liquids'

-- 3 - Nombre de produits vendus par les fournisseurs Français dans l’ordre décroissant :
select companyname Fournisseur, count(productname) Nbreproduits
from products
join suppliers on products.supplierid = suppliers.supplierid
where country = 'France'
group by companyname
order by count(productname) desc

-- 4 - Liste des clients Français ayant plus de 10 commandes :
select companyname Client, count(o.orderid) NbrCommandes
from orders o 
join customers ct on ct.customerid = o.customerid
where country = 'France' 
group by companyname 
having count(o.orderid) > 10

-- 5 - Liste des clients ayant un chiffre d’affaires > 30.000 :
select companyname Client, sum(unitprice*quantity) CA, country Pays
from `order details` od
join orders o on od.OrderID = o.orderid
join customers ct on ct.customerid = o.customerid
group by companyname
having ca > 30000
order by ca desc

-- 6 – Liste des pays dont les clients ont passé commande de produits fournis par « Exotic Liquids » :
select c.country Pays
from customers c
join orders o on c.CustomerID = o.CustomerID
join `order details` od on o.OrderID = od.orderid
join products p on od.productid = p.ProductID
join suppliers s on p.SupplierID = s.SupplierID
where s.CompanyName = 'Exotic Liquids'
group by Pays

-- 7 – Montant des ventes de 1997 :
select sum(unitprice*quantity) MontantVentes97
from orders o
join `order details` od on o.OrderID = od.orderid
where year(orderdate) = 1997

-- 8 – Montant des ventes de 1997 mois par mois :
select month(orderdate) Mois97, sum(unitprice*quantity) MontantVentes97
from orders o
join `order details` od on o.OrderID = od.orderid
where year(orderdate) = 1997
group by mois97

-- 9 – Depuis quelle date le client « Du monde entier » n’a plus commandé ?
select o.orderdate DateDeDernièreCommande
from orders o
join `order details` od on o.OrderID = od.orderid
join customers c on o.CustomerID = c.CustomerID
where companyname = 'Du monde entier'
order by DateDeDernièreCommande desc limit 1

-- 10 – Quel est le délai moyen de livraison en jours ?
select format(avg(datediff(shippeddate, orderdate)), 0) DélaiMoyenDeLivraisonEnJours
from orders