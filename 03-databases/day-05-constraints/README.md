# Day 5: Constraints (Grind Mode)

If you want to be a top-tier backend engineer, you need to understand exactly how the database protects your logic. Today, we move from "basic rules" to "bulletproof schema design."

## Advanced Concepts

### 1. Named Constraints
Don't write `username TEXT UNIQUE`. Write:
`CONSTRAINT unique_username UNIQUE(username)`
**Why?** When an error happens, Postgres will say *"Error: unique_username violated"* instead of a random string. This is crucial for debugging production apps.

### 2. Referential Integrity Actions
When you delete a record that other tables point to, what happens?
- `CASCADE`: Delete the "children" too.
- `RESTRICT`: Don't allow the deletion.
- `SET NULL`: Set the "children" reference to NULL.
- `SET DEFAULT`: Use the default value.

### 3. Composite Keys
Sometimes, uniqueness depends on two things. For example, in a `room_bookings` table, you can't have the same `room_id` and `booking_time` twice.
`PRIMARY KEY (room_id, booking_time)`

### 4. Logic in CHECK Constraints
You can use `AND`, `OR`, and `NOT`.
`CONSTRAINT price_is_logical CHECK (price >= 0 AND price < 1000000)`

---

## Challenge: The "Order Management" System
You aren't just making a list anymore. You are making a system that prevents human error.

### Task:
1. Create `categories`.
2. Create `products` with an **FK Action** (if a category is deleted, set the product category to NULL).
3. Create `order_items` which uses a **Composite Key** (order_id + product_id) to ensure a product isn't added to the same order twice.

---

## Workspace
- **Script**: [exercises.sql](./exercises.sql)
