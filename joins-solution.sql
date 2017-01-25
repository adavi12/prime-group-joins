--1.Get all customers and their addresses.
SELECT * FROM customers
JOIN addresses ON customers.id = addresses.customer_id;
--2. Get all orders and their line items.
SELECT * FROM orders
JOIN line_items ON orders.id = line_items.order_id;
--3. Which warehouses have cheetos?
SELECT * FROM warehouse
JOIN warehouse_product AS wp ON warehouse.id = wp.warehouse_id
JOIN products ON wp.product_id = products.id
WHERE description = 'cheetos';
--4.Which warehouses have diet pepsi?
SELECT * FROM warehouse
JOIN warehouse_product AS wp ON warehouse.id = wp.warehouse_id
JOIN products ON wp.product_id = products.id
WHERE description = 'diet pepsi';
--5. Get the number of orders for each customer. Note: It is OK if those without orders are not included in results.
SELECT first_name, last_name, COUNT(address_id) FROM customers
JOIN addresses ON customers.id = addresses.customer_id
JOIN orders ON addresses.id = orders.address_id
JOIN line_items ON orders.id = line_items.order_id
GROUP BY customers.id;

--6.How many customers do we have?
SELECT COUNT(*) FROM customers;
--7. How many products do we carry?
SELECT COUNT(*) FROM products;
--8.What is the total available on-hand quantity of diet pepsi?
SELECT SUM(on_hand) FROM warehouse_product
JOIN products ON warehouse_product.product_id = products.id
WHERE description = 'diet pepsi';
