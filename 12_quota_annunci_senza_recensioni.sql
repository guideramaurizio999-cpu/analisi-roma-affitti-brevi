SELECT neighbourhood, COUNT(*) AS annunci, 
ROUND(100.0 * SUM(CASE WHEN number_of_reviews_ltm = 0 THEN 1 ELSE 0 END) / COUNT(*), 1) AS pct_senza_recensioni
FROM listings
WHERE price > 0 AND price <= 1000
GROUP BY neighbourhood
HAVING COUNT(*) >= 50
ORDER BY pct_senza_recensioni DESC;