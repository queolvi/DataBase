-- Список ингридиентов и количество блюд, в которых они используются

CREATE VIEW structuresCountView AS
SELECT product, COUNT(dishes_id) AS count_dishes FROM structures
GROUP BY structures.product