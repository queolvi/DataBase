-- Представление списка блюд и их времени приготовления, у которых время приготовления ниже среднего

CREATE VIEW dishesPreparationTimeView AS
SELECT dishes.name, dishes.preparation_time FROM dishes 
WHERE (SELECT AVG(dishes.preparation_time) FROM dishes) > dishes.preparation_time 
