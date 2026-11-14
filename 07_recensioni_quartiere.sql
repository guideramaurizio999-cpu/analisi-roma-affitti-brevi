SELECT neighbourhood, COUNT(*) AS annunci, AVG(number_of_reviews_ltm) AS recensioni_medie
FROM listings
WHERE price > 0
GROUP BY neighbourhood
HAVING COUNT(*) >= 50
ORDER BY recensioni_medie DESC;