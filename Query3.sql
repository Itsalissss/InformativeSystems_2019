/*
Top donatore/i del giorno: trovare il nome visualizzato (eliminare i NULL), 
la data della donazione e l’importo donato di chi, per ogni giorno, ha donato l’importo maggiore.
*/
USE Fundraiser_Teamtrees;
SELECT d1.data, d1.nomevisualizzato, d1.importo
FROM donazione AS d1
WHERE d1.nomevisualizzato IS NOT NULL AND d1.importo = 
(SELECT MAX(d2.importo)
FROM donazione AS d2
WHERE d2.data=d1.data);