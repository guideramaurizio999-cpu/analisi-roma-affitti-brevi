SELECT neighbourhood, COUNT(*) AS annunci, AVG(price) AS prezzo_medio, AVG(number_of_reviews_ltm) AS recensioni_medie
FROM listings
WHERE price > 0
GROUP BY neighbourhood
HAVING COUNT(*) >= 50
ORDER BY prezzo_medio DESC;