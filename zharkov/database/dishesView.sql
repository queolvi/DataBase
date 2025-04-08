CREATE VIEW dishesView AS 
SELECT dishes.name AS dishes_name
, dishes.type_dishes AS type_dishes
, dishes.image AS dishes_image
, dishes.preparation_time AS preparation_time 
, dishes.technology AS technology  
FROM dishes;

