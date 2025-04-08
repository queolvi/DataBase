-- SELECT dishes.name FROM dishes WHERE

CREATE VIEW priceDishesView AS
SELECT * FROM 
(SELECT dishes.name AS dishes_name, priceDishes.price FROM dishes, 
(SELECT structures.dishes_id, SUM(priceProduct.price_1g*structures.weight) AS price
FROM 
(SELECT id, price/weight AS price_1g FROM products) AS priceProduct, structures
WHERE structures.product = priceProduct.id 
GROUP BY  structures.dishes_id) as priceDishes
WHERE dishes.id = priceDishes.dishes_id ) AS priceDishes 

