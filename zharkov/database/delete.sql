DELETE FROM dishes WHERE  id IN (SELECT dishes_id FROM structures WHERE product IN (SELECT id FROM products WHERE name LIKE 'Куркума')) 
DELETE FROM products WHERE name LIKE 'Куркума'
DELETE FROM dishes WHERE preparation_time > 60
DELETE FROM dishes WHERE  id IN (SELECT dishes_id FROM structures WHERE product IN (SELECT id FROM products WHERE weight<=10)) 
DELETE FROM products WHERE weight <= 10
