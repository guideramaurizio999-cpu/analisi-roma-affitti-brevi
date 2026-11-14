SELECT neighbourhood, COUNT(*) AS annunci_oltre_1000
FROM listings
WHERE price > 1000
GROUP BY neighbourhood
ORDER BY annunci_oltre_1000 DESC;