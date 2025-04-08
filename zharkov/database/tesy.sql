USE Catering
SELECT * FROM dishesPreparationTimeView

DELETE FROM dishesPreparationTimeView WHERE dishesPreparationTimeView.preparation_time < 30 
-- no err

SELECT * FROM DishesNameProductName
-- DELETE FROM DishesNameProductName WHERE DishesNameProductName.product_name LIKE '—осиски'
-- —ообщение 4405, уровень 16, состо€ние 1, строка 8
-- Ќевозможно обновить представление или функцию "DishesNameProductName", так как изменение вли€ет на несколько базовых таблиц.



SELECT * FROM structuresCountView 

DELETE FROM structuresCountView WHERE structuresCountView.count_dishes < 2
-- Ќевозможно обновить представление или функцию "structuresCountView", так как она содержит статистические выражени€, предложение DISTINCT или GROUP BY либо оператор PIVOT или UNPIVOTt