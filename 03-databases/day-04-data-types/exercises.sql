-- Day 4: Data Types Exercises
-- ---------------------------
-- Goal: Practice choosing and using different PostgreSQL data types.

-- 1. Create a "products" table
CREATE TABLE products(
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    release_date DATE,
    is_available BOOLEAN DEFAULT TRUE
);
-- 2. Insert a product with valid data
INSERT INTO products(name, description, price, release_date, is_available)
VALUES
('Laptop', 'A high-performance laptop', 1200.00, '2022-01-01', TRUE);


