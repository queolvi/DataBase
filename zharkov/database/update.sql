UPDATE products SET price=price - price*0.1 WHERE weight >= 500;
UPDATE dishes SET preparation_time=preparation_time + 20 WHERE technology LIKE '%духов%';
UPDATE dishes SET preparation_time=preparation_time-5 WHERE id IN (SELECT dishes_id FROM structures WHERE product IN (SELECT id FROM products WHERE name LIKE 'Перец болгарский'));

