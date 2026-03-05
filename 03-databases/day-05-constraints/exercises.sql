-- Day 5: Constraints Exercises (Grind Mode)
-- -----------------------------------------
-- Goal: Practice Named Constraints, FK Actions, and Composite Keys.

-- 1. Create 'categories' with a Named Unique constraint
-- Write your SQL here:


-- 2. Create 'products' with an FK Action
-- Hint: Use ON DELETE SET NULL on your category_id reference.
-- Also add a CHECK constraint that name cannot be an empty string.
-- Write your SQL here:


-- 3. Create 'order_items' (The Composite Key Challenge)
-- This table tracks which products are in which order.
-- Columns: order_id (INT), product_id (INT), quantity (INT).
-- Constraint: The combination of order_id and product_id must be the PRIMARY KEY.
-- Constraint: Quantity must be greater than zero.
-- Write your SQL here:


-- 4. The "Integrity Grind"
-- a) Delete a category. Verify that your products' category_id becomes NULL.
-- b) Try to add the same product to the same order twice. Observe the PK violation.
-- c) Try to add a product with quantity 0. Observe the CHECK violation.
