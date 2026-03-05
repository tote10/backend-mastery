-- Day 5: Constraints Exercises
-- ----------------------------
-- Goal: Practice enforcing data integrity with PK, FK, UNIQUE, and CHECK.

-- Setup: Make sure you are connected to the right DB
-- \c backend_mystry

-- 1. Create a "categories" table
-- Needs: category_id (PK), category_name (Unique, Not Null).


-- 2. Modify or Re-create "products" to include constraints
-- Add a 'category_id' column that is a FOREIGN KEY pointing to categories.
-- Add a CHECK constraint to ensure 'price' is greater than 0.


-- 3. The "Constraint Test"
-- Try to insert a product with a category_id that doesn't exist.
-- Try to insert a product with a price of -10.00.
-- Observe the errors.
