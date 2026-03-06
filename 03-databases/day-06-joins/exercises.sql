-- Day 6: Joins Masterclass (The Relational Grind)
-- ------------------------------------------------
-- Goal: Master all Join types and understand EXPLAIN outputs.

-- 1. INNER JOIN: Total Sales Report
-- Requirement: List all product names and their total quantities sold.
-- (Join 'products' with 'order_items')
-- Write your SQL here:


-- 2. LEFT JOIN: Finding "Ghost" Products
-- Requirement: Find all products that have NEVER been ordered.
-- (Join 'products' with 'order_items' and look for NULLs)
-- Write your SQL here:


-- 3. FULL JOIN: The "System Sync"
-- Requirement: List all Categories and all Products, even those without a match.
-- (Join 'categories' and 'products')
-- Write your SQL here:


-- 4. SELF JOIN: Category Hierarchy
-- Requirement: If we add a 'parent_id' to categories, how do we show a category and its parent?
-- (Note: You might need to ALTER categories to add parent_id first!)
-- Write your SQL here:


-- 5. THE INTERNAL CHALLENGE (EXPLAIN)
-- Requirement: Run 'EXPLAIN ANALYZE' on your first join.
-- Observe if Postgres uses a "Hash Join", "Nested Loop", or "Merge Join".
-- Copy the plan output here as a comment.
