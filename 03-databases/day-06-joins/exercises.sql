-- Day 6: Joins Masterclass (The Relational Grind)
-- ------------------------------------------------
-- Goal: Master all Join types and understand EXPLAIN outputs.
-- 0. DATA SETUP (Run this first to have interesting data to play with!)
-- ------------------------------------------------------------------
-- Step A: Insert Categories
INSERT INTO categories (name) VALUES 
('Electronics'), 
('Furniture'), 
('Groceries'), 
('Books'); -- This category will have NO products (Good for LEFT/FULL joins)

-- Step B: Insert Products (Using subqueries to get the real IDs)
INSERT INTO products (name, price, category_id) VALUES 
('Laptop', 999.99, (SELECT id FROM categories WHERE name = 'Electronics')), 
('Smartphone', 499.99, (SELECT id FROM categories WHERE name = 'Electronics')),
('Sofa', 299.99, (SELECT id FROM categories WHERE name = 'Furniture')),
('Table', 150.00, (SELECT id FROM categories WHERE name = 'Furniture')),
('Apple', 0.99, (SELECT id FROM categories WHERE name = 'Groceries')),
('Mystry Item', 10.00, NULL); -- No category (Good for RIGHT/FULL joins)

-- Step C: Insert Order Items (Using subqueries)
INSERT INTO order_items (order_id, product_id, quantity) VALUES 
(101, (SELECT id FROM products WHERE name = 'Laptop'), 1),
(101, (SELECT id FROM products WHERE name = 'Smartphone'), 2),
(102, (SELECT id FROM products WHERE name = 'Sofa'), 1),
(103, (SELECT id FROM products WHERE name = 'Laptop'), 1);


-- 1. INNER JOIN: Total Sales Report
-- Requirement: List all product names and their total quantities sold.
-- (Join 'products' with 'order_items')
SELECT p.name , oi.quantity 
FROM products p
INNER JOIN order_items oi ON p.id = oi.product_id ;

-- 2. LEFT JOIN: Finding "Ghost" Products
-- Requirement: Find all products that have NEVER been ordered.
-- (Join 'products' with 'order_items' and look for NULLs)
SELECT p.name , oi.quantity
FROM products p
LEFT JOIN order_items oi ON p.id = oi.product_id
WHERE oi.product_id IS NULL;
-- 3. FULL JOIN: The "System Sync"
-- Requirement: List all Categories and all Products, even those without a match.
-- (Join 'categories' and 'products')
SELECT c.name AS category_name , p.name AS product_name
FROM categories c
FULL JOIN products p ON c.id = p.category_id;
-- 4. SELF JOIN: Category Hierarchy
-- Requirement: If we add a 'parent_id' to categories, how do we show a category and its parent?
-- (Note: You might need to ALTER categories to add parent_id first!)
ALTER TABLE categories ADD COLUMN parent_id INT;
ALTER TABLE categories ADD CONSTRAINT fk_parent_id FOREIGN KEY (parent_id) REFERENCES categories(id);
UPDATE categories SET parent_id =(SELECT id FROM categories WHERE name = 'Furniture') WHERE name = 'Electronics';

SELECT c.name AS category_name , p.name AS parent_name
FROM categories c
LEFT JOIN categories p ON c.parent_id = p.id;



-- 5. THE INTERNAL CHALLENGE (EXPLAIN)
-- Requirement: Run 'EXPLAIN ANALYZE' on your first join.
-- Observe if Postgres uses a "Hash Join", "Nested Loop", or "Merge Join".
-- Copy the plan output here as a comment.
EXPLAIN ANALYZE SELECT p.name , oi.quantity
FROM products p
INNER JOIN order_items oi ON p.id = oi.product_id;

-- 6. FINAL BOSS CHALLENGE: The Unguided INNER JOIN
-- Requirement: We want to see the Names of Products AND the Names of their Categories.
-- Action: Write an INNER JOIN between 'products' and 'categories'.
-- Rule: You must write this completely from scratch! No hints!
-- Write your SQL below:

SELECT p.product_name , c.category_name 
FROM products p 
INNER  JOIN categories c ON p.category_id = c.id;