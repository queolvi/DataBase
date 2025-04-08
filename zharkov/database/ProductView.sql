
CREATE VIEW productsView AS 
SELECT 
products.name AS product_name
, products.calories AS product_calories
, products.weight AS product_weight
, products.price AS product_price
FROM products
