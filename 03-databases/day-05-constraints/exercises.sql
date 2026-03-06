-- Day 5: Constraints Exercises (Grind Mode)
-- -----------------------------------------
-- Goal: Practice Named Constraints, FK Actions, and Composite Keys.

-- 1. Create 'categories' with a Named Unique constraint
CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    CONSTRAINT unique_category_name UNIQUE (name)
);
-- 2. Create 'products' with an FK Action
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    CONSTRAINT name_not_empty CHECK (name <> ''),
    price NUMERIC(10,2) NOT NULL,
    CONSTRAINT price_not_negative CHECK (price >= 0),
    category_id INT,
    -- Hint: Use ON DELETE SET NULL on your category_id reference.
    CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES categories(id) 
    ON DELETE SET NULL
);
-- 3. Create 'order_items' (The Composite Key Challenge)
CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    -- Constraint: The combination of order_id and product_id must be the PRIMARY KEY.
    CONSTRAINT pk_order_items PRIMARY KEY (order_id, product_id),
    CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE,    
    CONSTRAINT quantity_greater_than_zero CHECK (quantity > 0)
);



-- 4. The "Integrity Grind"
INSERT INTO categories(name) VALUES('Games');
INSERT INTO products(name, price, category_id) VALUES('PS5', 499.99, 1);
-- Delete a category. Verify that your products' category_id becomes NULL.
DELETE FROM categories WHERE name = 'Games';
-- verfication
SELECT name, category_id FROM products WHERE name = 'PS5';
-- Try to add the same product to the same order twice. Observe the PK violation.
INSERT INTO order_items(order_id, product_id, quantity) VALUES(1, 1, 1);
INSERT INTO order_items(order_id, product_id, quantity) VALUES(1, 1, 5);
-- Try to add a product with quantity 0. Observe the CHECK violation.
INSERT INTO order_items(order_id, product_id, quantity) VALUES(1, 1, 0);