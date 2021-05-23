/*
Trovare nome e nazione delle foreste a rischio almeno 4 che non hanno mai ricevuto alberi in consegna
*/
USE Fundraiser_Teamtrees;
SELECT f1.nome, f1.nazione
FROM foresta AS f1
WHERE f1.rischio > 3 AND f1.nome NOT IN 
(SELECT DISTINCT f2.nome
FROM foresta AS f2 JOIN bancale AS b ON (f2.id = b.idforesta)
WHERE b.quantitaxforesta > 0);
