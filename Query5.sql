/*
Trovare nome specie, nome foresta e le rimanenze 
(alberi inviati alle foreste sia dai fornitori che da Teamtrees ma non ancora piantati) 
di ogni specie albero in ogni foresta.
*/
USE Fundraiser_Teamtrees;

DROP VIEW IF EXISTS sommabancali;
DROP VIEW IF EXISTS sommaforesta;

CREATE VIEW sommabancali(idforesta, nomespecie, somma) AS 
(SELECT b.idforesta, b.nomespecie, SUM(quantitaxforesta) 
FROM bancale AS b
WHERE b.idforesta IS NOT NULL
GROUP BY b.idforesta, b.nomespecie);

CREATE VIEW sommaforesta(idforesta, nomespecie, somma) AS 
(SELECT a.idforesta, a.nomespecie, COUNT(*)
FROM albero AS a
GROUP BY a.idforesta, a.nomespecie);

SELECT f.nome, sb.nomespecie, sb.somma - sf.somma
FROM sommabancali AS sb JOIN sommaforesta AS sf ON (sb.nomespecie = sf.nomespecie) JOIN foresta as f ON (sb.idforesta = f.id)
WHERE sb.idforesta = sf.idforesta;