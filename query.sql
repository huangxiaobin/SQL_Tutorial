--t5
SELECT city FROM customers;
SELECT id FROM customers;

--t6
SELECT name,zip FROM customers;
SELECT * FROM customers;

--t7
SELECT state FROM customers;
SELECT DISTINCT state FROM customers;
SELECT id,name FROM customers LIMIT 5;
SELECT id,name FROM customers LIMIT 5,10;

--t8
SELECT name FROM customers ORDER BY name;
SELECT name,address FROM customers ORDER BY id;
SELECT state,city,name FROM customers ORDER BY state,name;

--t9
SELECT name,zip FROM customers ORDER BY zip;
SELECT name,zip FROM customers ORDER BY zip DESC;
SELECT name,id FROM customers ORDER BY id DESC LIMIT 1;
SELECT name FROM customers ORDER BY name LIMIT 1;

--t10
SELECT id,name FROM customers WHERE id=54;
SELECT id,name FROM customers WHERE id!=54;
SELECT id,name FROM customers WHERE id<7;
SELECT id,name FROM customers WHERE id BETWEEN 25 AND 30;
SELECT name,state FROM customers WHERE state='CA';

--t11
SELECT name,state,city FROM customers WHERE state='CA' AND city='Hollywood';
SELECT name,state,city FROM customers WHERE state='CA' OR city='Boston';
SELECT id, name,city FROM customers WHERE (id=1 OR id=2) AND city='Raleigh';

--t12
SELECT name,state FROM customers WHERE state='CA' OR state='NC' OR state='NY';
SELECT name,state FROM customers WHERE state NOT IN ('CA', 'NC','NY') ORDER BY state;

--t13
SELECT name FROM items WHERE name LIKE 'new%';
SELECT name FROM items WHERE name LIKE '%computer%';
SELECT city FROM customers WHERE city LIKE 'h%d';

--t14
SELECT name FROM items WHERE name LIKE '_ boxes of frogs';
SELECT name FROM items WHERE name LIKE '% boxes of frogs';

--t15
SELECT name FROM items WHERE name REGEXP 'new';
SELECT name FROM items WHERE name REGEXP '.boxes';
SELECT name FROM items WHERE name REGEXP 'car|gold';
SELECT name FROM items WHERE name REGEXP '[12345] boxes of frogs';
SELECT name FROM items WHERE name REGEXP '[^12345] boxes of frogs';
SELECT name FROM items WHERE name REGEXP '[1-5] boxes of frogs';

--t16
SELECT CONCAT(city, ', ', state) FROM customers;
SELECT CONCAT(city, ', ', state) AS new_address FROM customers;
SELECT name, cost, cost-1 AS sale_price FROM items;

--t17
SELECT name, UPPER(name) FROM customers;
SELECT cost, SQRT(cost) FROM items;
SELECT AVG(cost) FROM items;
SELECT SUM(bids) FROM items;

--t18
SELECT COUNT(name) FROM items WHERE seller_id=6;
SELECT AVG(name) FROM items WHERE seller_id=6;
SELECT COUNT(*) AS item_count, MAX(cost) AS max_cost, AVG(cost) AS avg_cost FROM items WHERE seller_id=12;

--t19
SELECT seller_id, COUNT(*) AS item_count FROM items WHERE seller_id=1;
SELECT seller_id, COUNT(*) AS item_count FROM items GROUP BY seller_id;
SELECT seller_id, COUNT(*) AS item_count FROM items GROUP BY seller_id HAVING COUNT(*)>3 ORDER BY item_count DESC;

--20
SELECT name,cost FROM items WHERE cost>(SELECT AVG(cost) FROM items) GROUP BY cost DESC;

--t21
SELECT name, MIN(cost) FROM items WHERE name LIKE '% boxes of frogs' AND seller_id IN 
(SELECT seller_id FROM items WHERE name LIKE '% boxes of frogs');

--t22
SELECT customers.id, customers.name, items.name, items.cost FROM customers, items
WHERE customers.id=items.seller_id
ORDER BY customers.id

--t23
SELECT i.seller_id, i.name, c.id
FROM items AS i, customers AS c 
WHERE i.id = c.id

SELECT customers.name, items.name FROM customers RIGHT OUTER JOIN items ON customers.id=items.seller_id

--t24
SELECT name, cost, bids FROM items WHERE bids>190
UNION ALL
SELECT name, cost, bids FROM items WHERE cost>1000

--t25
SELECT name, cost FROM items WHERE MATCH(name) AGAINST('baby' IN BOOLEAN MODE);
SELECT name, cost FROM items WHERE MATCH(name) AGAINST('+baby -coat' IN BOOLEAN MODE);

--t26
INSERT INTO items VALUES('101', 'bacon strips', '9.95', '1', '0');
INSERT INTO items(id,name,cost,seller_id,bids)  VALUES('102', 'fish n chips', '7.99', '1', '0');
INSERT INTO items(id,cost,name)  VALUES('103', '7.77', 'beef on a stick')

--t27
INSERT INTO items(id,name,cost,seller_id,bids)  VALUES
('104', 'beef chops', '7.99', '1', '0'),
('105', 'jelly pockets', '4.56', '1', '0'),
('106', 'sack of ham', '9.95', '1', '0');
--INSERT INTO items(id,name,cost,seller_id,bids) SELECT id,name,cost,seller_id,bids FROM faketable 

