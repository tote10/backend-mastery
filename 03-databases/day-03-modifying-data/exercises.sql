-- Day 3: Data Modification Exercises
-- ---------------------------------
-- Author: [Your Name]
-- Goal: Practice Table Creation, Insert, Update, and Delete operations.

-- 1. Create the users table
CREATE TABLE users(
    user_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Insert at least 3 users
INSERT INTO users(username, email)
VALUES
('john', 'john@gmail.com'),
('jane', 'jane@gmail.com'),
('bob', 'bob@gmail.com');
-- 3. Update a user's email
UPDATE users SET email = 'john.doe@gmail.com' WHERE username = 'john';


-- 4. Delete a user
DELETE FROM users WHERE username = 'bob';
