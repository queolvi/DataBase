CREATE VIEW cookingView AS 
SELECT
cooking.dishes_id AS dishes_id
, cooking.portions AS portions
, cooking.date AS cooking_date
FROM cooking
