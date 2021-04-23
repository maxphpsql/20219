USE Papyrus
GO

--1
SELECT * from LIGCOM
	JOIN ENTCOM ON entcom.numcom=ligcom.numcom
	WHERE numfou='09120'

--2
SELECT numfou from ENTCOM

--3
SELECT COUNT(*) AS 'NbCom', COUNT(DISTINCT numfou) AS 'NbFou' from ENTCOM

--4
SELECT codart, libart, stkphy, stkale, qteann from Produit
	WHERE stkphy < stkale and qteann < 1000

--5
SELECT posfou, nomfou from fournis
	WHERE LEFT(posfou,2) in (75, 78, 92, 77)
	ORDER BY posfou DESC, nomfou

--6
SET DATEFORMAT dmy
GO
SELECT numcom, datcom from entcom
	WHERE month(datcom) between 3 and 4

--7
SELECT numcom, datcom from entcom
	WHERE datcom=getdate() and obscom is NOT NULL
GO

--8 
SELECT numcom, sum(qtecde*priuni) as total from ligcom
	GROUP BY numcom

--9
SELECT numcom, sum(qtecde*priuni) as total from ligcom
	WHERE qtecde>=1000
	GROUP BY numcom HAVING (sum(qtecde*priuni) > 10000) 

--10
SELECT numcom, nomfou, datcom from fournis
	JOIN entcom ON fournis.numfou=entcom.numfou

--11
SELECT libart, entcom.numcom, nomfou, (sum(qtecde*priuni)) AS 'sstot' , obscom from ligcom
	JOIN entcom ON entcom.numcom=ligcom.numcom
	JOIN fournis ON entcom.numfou=fournis.numfou
	JOIN vente ON fournis.numfou=vente.numfou
	JOIN produit ON vente.codart=produit.codart
	WHERE obscom like ('%urgent%')
	GROUP BY libart, entcom.numcom, nomfou, obscom

--12
SELECT nomfou, SUM(qtecde-qteliv) AS 'Livrable' from ligcom
	JOIN entcom on ligcom.numcom=entcom.numcom
	JOIN fournis on entcom.numfou=fournis.numfou
	GROUP BY nomfou HAVING SUM(qtecde-qteliv) != 0


SELECT nomfou, SUM(qtecde-qteliv) AS 'Livrable' from fournis, ligcom
	JOIN entcom on ligcom.numcom=entcom.numcom
	WHERE entcom.numfou=fournis.numfou
	GROUP BY nomfou HAVING SUM(qtecde-qteliv) != 0

--13
SELECT numcom, numfou, datcom from entcom
	WHERE numfou like (SELECT numfou from entcom WHERE numcom=70210)

SELECT numcom, fournis.numfou, datcom from entcom
	JOIN fournis ON fournis.numfou=entcom.numfou
	GROUP BY numcom, fournis.numfou, datcom HAVING fournis.numfou like (SELECT numfou from entcom WHERE numcom=70210)

--14
SELECT libart, prix1 
from produit AS p
	JOIN vente AS v ON v.codart=p.codart
	GROUP BY libart, v.codart, v.prix1 
	HAVING v.prix1 < (
		SELECT MIN(v2.prix1) 
		from vente AS v1, vente AS v2 
		WHERE v2.codart=v1.codart and LEFT(v2.codart,1) like 'R')

--15
SELECT libart, nomfou from produit AS p
	JOIN vente AS v ON v.codart=p.codart
	JOIN fournis AS f ON f.numfou=v.numfou
	GROUP BY libart, nomfou, stkphy HAVING stkphy <= SUM(stkale + (stkale * 50 / 100))
	ORDER BY libart, nomfou

--16
SELECT nomfou, libart from produit AS p
	JOIN vente AS v ON v.codart=p.codart
	JOIN fournis AS f ON f.numfou=v.numfou
	GROUP BY libart, nomfou, stkphy, delliv HAVING stkphy <= SUM(stkale + (stkale * 50 / 100)) and delliv <= 30
	ORDER BY nomfou, libart

--17
SELECT nomfou, libart, stkphy from produit AS p
	JOIN vente AS v ON v.codart=p.codart
	JOIN fournis AS f ON f.numfou=v.numfou
	GROUP BY libart, nomfou, stkphy, delliv HAVING stkphy <= SUM(stkale + (stkale * 50 / 100)) and delliv <= 30
	ORDER BY stkphy desc, nomfou, libart

--18
SELECT libart from produit AS p
	JOIN ligcom AS l ON l.codart=p.codart
	JOIN entcom AS e1 ON e1.numcom=l.numcom
	JOIN entcom AS e2 ON e2.numcom=l.numcom
	GROUP BY libart, qtecde, qteann, e1.datcom, e2.datcom HAVING qtecde > (qteann * 90 / 100) and year(e1.datcom) = year(e2.datcom)

--19
SELECT DISTINCT(nomfou), SUM(qtecde*priuni*1.2) AS CA 
from fournis AS f
JOIN entcom AS e ON e.numfou=f.numfou
JOIN ligcom AS l ON l.numcom=e.numcom
GROUP BY nomfou, datcom 
HAVING year(datcom) = 1993

--20 ??
SELECT numlig 
from ligcom AS l
JOIN vente as v ON v.codart=l.codart
WHERE qtecde <= qte1 or qtecde <= qte2 or qtecde <= qte3
GROUP BY numlig, l.codart 
HAVING NOT EXISTS (SELECT v.codart from vente AS v WHERE v.codart=l.codart)

