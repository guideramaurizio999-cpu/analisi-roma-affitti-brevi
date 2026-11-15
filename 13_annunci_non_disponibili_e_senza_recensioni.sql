SELECT COUNT(*) AS annunci,
SUM(CASE WHEN availability_365 = 0 THEN 1 ELSE 0 END) AS non_disponibili,
SUM(CASE WHEN number_of_reviews_ltm = 0 THEN 1 ELSE 0 END) AS senza_recensioni
FROM listings
WHERE price > 0;