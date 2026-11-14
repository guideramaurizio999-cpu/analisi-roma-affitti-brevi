SELECT neighbourhood, room_type, price
FROM listings
WHERE price IS NOT NULL
ORDER BY price;