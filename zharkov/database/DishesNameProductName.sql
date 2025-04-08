-- Вывести список блюд и соответствующий блюду ингридиент, которого больше всего в нем
	
CREATE VIEW DishesNameProductName AS 
SELECT dishes.name AS dishes_name, t.name AS product_name FROM dishes, 
(SELECT t.dishes_id, products.name FROM 
(SELECT t.dishes_id, structures.product AS product_id, t.weight FROM
(SELECT dishes_id, MAX(structures.weight) AS weight FROM structures 
GROUP BY dishes_id) AS t, structures
WHERE structures.dishes_id = t.dishes_id AND structures.weight = t.weight) AS t, products
WHERE products.id = t.product_id) AS t WHERE t.dishes_id = dishes.id