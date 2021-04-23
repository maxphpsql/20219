# Cas Gescom : les requêtes

## REQUETES D'AIDE A LA MISE AU POINT DU CORRIGE +++

+++ Calcul du chiffre d'affaires avec remise +++

Mise au point de la formule, pour une ligne seule dans orders_details :
 
ode_id = 95 => qté = 1, prix = 100,00, remise = 20%

    +++ NE FONCTIONNE PAS (11/06/2020) +++
	SELECT ode_ord_id, SUM((ode_unit_price - (ode_unit_price*ode_discount)/100) * ode_quantity) AS total
	FROM orders_details 
	GROUP BY ode_ord_id
    ORDER BY total DESC

   
+++ [11/02/20020] TODO : orders sans correspondance dans orders_details (dû à generatedata.com ) : 
SELECT * FROM `orders` WHERE `ord_id` NOT IN (SELECT ode_ord_id FROM orders_details) 
+++


