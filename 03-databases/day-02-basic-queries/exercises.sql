-- Day 2: Basic SQL – SELECT & WHERE Exercises
-- -------------------------------------------
-- Goal: Practice fetching and filtering data.

-- 1. Setup sample data
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name TEXT,
    department TEXT,
    salary INT
);

INSERT INTO employees (id, name, department, salary) VALUES
(1, 'Alice', 'Engineering', 90000),
(2, 'Bob', 'Sales', 70000),
(3, 'Charlie', 'Engineering', 85000),
(4, 'David', 'HR', 60000),
(5, 'Eve', 'Sales', 75000);

-- 2. Fetch all columns for all employees
-- Write your query here:


-- 3. Fetch only names and departments
-- Write your query here:


-- 4. Filter: Find employees in 'Engineering'
-- Write your query here:


-- 5. Filter: Find employees with salary > 70000
-- Write your query here:


-- 6. Pattern Matching: Find names starting with 'A'
-- Hint: Use LIKE 'A%'
-- Write your query here:
