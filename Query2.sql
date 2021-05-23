/*
Trovare l’associazione che ha piantato più alberi utilizzando piantatori del luogo 
(quindi provenienti dallo stato in cui si trova la foresta dove hanno piantato un albero) 
e restituire anche il nome dello stato.
*/
USE Fundraiser_Teamtrees;
SELECT p.associazione, p.stato
FROM persona AS p JOIN albero AS a ON (p.email = a.emailpiantatore) JOIN foresta AS f ON (a.idforesta = f.id)
WHERE p.stato = f.nazione
GROUP BY p.associazione, p.stato, f.nazione
ORDER BY COUNT(*) DESC
LIMIT 1;
/*
MANCA HAVING! AVEVAMO FATTO: HAVING p.stato = f.nazione MA E' CONCETTUALMENTE SBAGLIATO, IN QUANTO PER QUESTA CLAUSOLA
BASTAVA UN WHERE. HAVING DEV'ESSERE UNA CONDIZIONE SUL GRUPPO!
FORSE POTEVAMO FARE: HAVING MAX(COUNT(*)) CON ANCHE QUALCOS'ALTRO..!  (AL POSTO DI ORDER BY E LIMIT 1)
*/