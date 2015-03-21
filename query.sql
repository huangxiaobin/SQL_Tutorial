--t5
SELECT city from customers;
SELECT id from customers;

--t6
SELECT name,zip from customers;
SELECT * from customers;

--t7
SELECT state from customers;
SELECT DISTINCT state from customers;
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