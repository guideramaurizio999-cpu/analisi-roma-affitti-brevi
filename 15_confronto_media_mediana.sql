SELECT neighbourhood,
ROUND(AVG(price), 0) AS tot_media,
ROUND(AVG(price) FILTER (WHERE price <= 1000), 0) AS tot_media_sotto_1000,
ROUND((PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY price))::numeric, 0) AS tot_mediana
FROM listings
WHERE price > 0
GROUP BY neighbourhood
HAVING COUNT(*) >= 50
ORDER BY tot_media DESC;