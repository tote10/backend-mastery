# Day 5: Constraints

Constraints are the rules that keep your data clean and trustworthy. Without them, a database is just a bucket of random text and numbers. Today, we learn how to "lock down" the tables so only valid data gets in.

## Top 5 Constraints

1. **NOT NULL**: Ensures a column cannot have an empty (NULL) value.
2. **UNIQUE**: Prevents two rows from having the same value in a column (e.g., usernames).
3. **PRIMARY KEY**: A combination of `NOT NULL` and `UNIQUE`. It identifies each row uniquely.
4. **FOREIGN KEY**: Ensures that a value in one table matches a value in another (establishing a relationship).
5. **CHECK**: Enforces a custom business rule (e.g., `price > 0`).

## Why use them?
- **Data Integrity**: You can't have a product without a name or a negative price.
- **Consistency**: Relationships between tables (like Products and Categories) stay valid.
- **Performance**: Some constraints (like Primary Keys) automatically create indexes to speed up lookups.

---

## Challenge: The "Rules of the Store"
You will expand your database by adding a `categories` table and linking it to your `products`.

### Goal:
1. Create a `categories` table.
2. Link `products` to `categories` using a **Foreign Key**.
3. Add a **Check Constraint** to ensure prices are always positive.

---

## Workspace
- **Script**: [exercises.sql](./exercises.sql)
