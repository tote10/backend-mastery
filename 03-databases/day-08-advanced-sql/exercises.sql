-- Day 8 Exercises: Advanced Subqueries and CTEs
-- ------------------------------------------------
-- Rule: Write all SQL yourself. No ready-made solutions are included here.

-- 0) Prep Check
-- Confirm the following tables exist with usable data:
-- categories, products, order_items

-- 1) Subquery in WHERE
-- Task:
-- List product names that appear at least once in order_items.
-- Constraint:
-- Use a subquery in WHERE.
SELECT p.name FROM products p
WHERE p.id IN (SELECT product_id FROM order_items);

-- 2) Correlated Subquery with NOT EXISTS
-- Task:
-- List product names that have never been ordered.
-- Constraint:
-- Use a correlated subquery.
SELECT p.name FROM products p
WHERE NOT EXISTS (
    SELECT 1 FROM order_items oi
    WHERE oi.product_id = p.id
);

-- 3) CTE Basics
-- Task:
-- Create a CTE named sales_summary with:
-- - product_id
-- - total_qty (SUM of quantity)
-- Then return product name + total_qty.
-- Sort by total_qty descending.
WITH sales_summary AS 
(
    SELECT product_id, SUM(quantity) AS total_qty
    FROM order_items
    GROUP BY product_id
    ORDER BY total_qty desc
)
SELECT * FROM sales_summary ;
-- 4) Multi-CTE Report
-- Task:
-- Build two CTEs:
-- - qty_cte: total quantity per product
-- - revenue_cte: total revenue per product
-- Final output:
-- - product name
-- - total_qty
-- - total_revenue
-- Filter:
-- only rows where total_qty >= 2

WITH qty_cte AS
(
    SELECT product_id, SUM(quantity) AS total_qty
    FROM order_items
    GROUP BY product_id
),
revenue_cte AS
(
    SELECT oi.product_id, SUM(p.price * oi.quantity) AS total_revenue
    FROM products p
    INNER JOIN order_items oi ON p.id = oi.product_id
    GROUP BY oi.product_id 
)
SELECT p.name, p.price,q.total_qty, r.total_revenue
FROM products p
INNER JOIN qty_cte q ON p.id = q.product_id
INNER JOIN revenue_cte r ON p.id = r.product_id
WHERE q.total_qty >= 2
ORDER BY q.total_qty DESC;
-- 5) Recursive CTE
-- Task:
-- Assume categories has a parent-child relationship via parent_id.
-- Return category hierarchy with depth level.
-- Start from rows where parent_id IS NULL.


-- 6) Scalar Subquery
-- Task:
-- List products priced above the average price of all products.
-- Constraint:
-- Use a scalar subquery.


-- 7) Reflection
-- After writing each query, add a one-line comment:
-- "Why this approach was chosen over alternatives."
