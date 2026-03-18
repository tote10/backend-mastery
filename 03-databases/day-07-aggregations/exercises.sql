-- Day 7: Aggregation & Windows (The Reporting Grind)
-- ------------------------------------------------
-- Goal: Master SUM, COUNT, GROUP BY, and HAVING.

-- Wait! We need some more order data to make the reports look good.
-- Run this setup block first!
-- ------------------------------------------------------------------
INSERT INTO order_items (order_id, product_id, quantity) VALUES 
(104, (SELECT id FROM products WHERE name = 'Laptop'), 5),
(105, (SELECT id FROM products WHERE name = 'Smartphone'), 10),
(106, (SELECT id FROM products WHERE name = 'Apple'), 50);


-- 1. BASIC AGGREGATION: The Inventory Count
-- Requirement: How many total products do we sell in the whole store?
-- (Use the `products` table).
SELECT COUNT(*) AS total_products
FROM products 


-- 2. GROUP BY: Sales by Product
-- Requirement: Show every Product Name and the TOTAL quantity sold for that product.
-- (Join 'products' to 'order_items', select name and SUM(quantity), and group them).
-- Write your SQL here:
SELECT p.name, SUM(oi.quantity) AS total_quantity_sold
FROM products p
INNER JOIN order_items oi ON p.id = oi.product_id
GROUP BY p.name;

-- 3. THE 'HAVING' FILTER: High-Volume Sales
-- Requirement: Take query #2, but only show products that have sold MORE THAN 2 items total.
-- (Copy query #2, but add a HAVING clause at the bottom).
-- Write your SQL here:



-- 4. THE MONEY QUERY (Advanced)
-- Requirement: Calculate the Total Revenue per Product.
-- (Revenue = price * quantity). Show the Product Name and the Total Revenue.
-- Hint: Inside the SUM(), you can do math! Like: SUM(p.price * oi.quantity)
-- Write your SQL here:
