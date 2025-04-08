CREATE VIEW AllDataView AS 
SELECT dishes.name AS dishes_name
, dishes.preparation_time AS preparation_time
, dishes.technology AS technology
, cooking.portions AS portions
, cooking.date AS cooking_date
, products.name AS product_name
, products.calories AS product_calories
, products.weight AS product_weight
, products.price AS product_price
, structures.weight AS structure_weight
FROM dishes 
INNER JOIN structures 
ON dishes.id = structures.dishes_id
INNER JOIN cooking 
ON dishes.id = cooking.dishes_id
INNER JOIN products 
ON structures.product = products.id
