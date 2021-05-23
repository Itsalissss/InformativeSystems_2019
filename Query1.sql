/*
Trovare nome, città, nazione, numero di telefono e quantità presente in magazzino dei 
fornitori che hanno in stock la specie di albero “araucaria angustifolia”.
*/
USE Fundraiser_Teamtrees;
SELECT f.nome, f.citta, f.nazione, f.numerotelefono, s.quantitainstock
FROM fornitore AS f JOIN stockfornitore AS s ON (f.partitaiva = s.partitaivafornitore) 
WHERE s.nomespecie = 'araucaria angustifolia' AND s.quantitainstock > 0;
