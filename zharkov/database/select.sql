SELECT id AS 'Номер блюда'
, name AS 'Название блюда'
, type_dishes AS 'Тип блюда'
, image AS 'Картинка'
, preparation_time AS 'Время приготовления'
, technology AS 'Рецепт'
FROM dishes

SELECT id AS 'Номер приготовления'
, dishes_id AS 'Номер блюда'
, portions AS 'Количество порций'
, date AS 'Время заказа'
FROM cooking

SELECT id AS 'Номер продукта'
, name AS 'Название продукта'
, calories AS 'Количество каллорий'
, weight AS 'Вес закупки'
, price AS 'Цена закупки'
FROM products

SELECT id AS 'Порядковый номер'
, dishes_id AS 'Номер блюда'
, product AS 'Номер продукта'
, weight AS 'Вес добавленных продуктов'
FROM structures


-- 2 задание 


SELECT name AS 'Название блюда'
, type_dishes AS 'Тип блюда'
, preparation_time AS 'Время приготовления'
, technology AS 'Рецепт'
FROM dishes

SELECT (SELECT name FROM dishes WHERE dishes.id = dishes_id) AS 'Название блюда'
, portions AS 'Количество порций'
, date AS 'Время заказа'
FROM cooking

SELECT name AS 'Название продукта'
, calories AS 'Количество каллорий'
, weight AS 'Вес закупки'
, price AS 'Цена закупки'
FROM products

SELECT (SELECT name FROM dishes WHERE dishes.id = dishes_id) AS 'Название блюда'
, (SELECT name FROM products WHERE products.id = product) AS 'Название блюда'
, weight AS 'Вес добавленных продуктов'
FROM structures


-- 3 


SELECT dishes.name AS 'Название блюда'
, dishes.preparation_time AS 'Время приготовления'
, dishes.technology AS 'Рецепт'
, cooking.portions AS 'Количество порций'
, cooking.date AS 'Время заказа'
, products.name AS 'Название продукта'
, products.calories AS 'Количество каллорий'
, products.weight AS 'Вес закупки'
, products.price AS 'Цена закупки'
, structures.weight AS 'Вес добавленных продуктов'
FROM dishes 
INNER JOIN structures 
ON dishes.id = structures.dishes_id
INNER JOIN cooking 
ON dishes.id = cooking.dishes_id
INNER JOIN products 
ON structures.product = products.id


-- 4 

SELECT name AS 'Название блюда' 
FROM dishes 
WHERE id IN (SELECT dishes_id FROM structures 
WHERE product IN (SELECT id FROM products 
WHERE name LIKE 'Картофель'))

SELECT name AS 'Название блюда' FROM dishes WHERE preparation_time < (SELECT  AVG(preparation_time) FROM dishes)

SELECT dishes.name AS 'Название блюда', STRING_AGG(products.name, ', ') AS 'Состав' FROM dishes 
INNER JOIN structures 
ON dishes.id = structures.dishes_id 
INNER JOIN products 
ON structures.product = products.id
GROUP BY dishes.name

