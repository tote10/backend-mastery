# Day 6: Joins Masterclass (Relational Algorithms)

Joining tables is the soul of a Relational Database. Today, we move beyond simple linkage and look at **how** Postgres actually merges millions of rows together.

## 1. The Join "Menu" (Syntax)

| Join Type | Description |
| :--- | :--- |
| **INNER JOIN** | Returns only rows where there is a match in both tables. |
| **LEFT JOIN** | Returns all from the Left table, and matches from the Right (NULL if no match). |
| **RIGHT JOIN** | Opposite of Left Join. |
| **FULL JOIN** | Returns all rows from both tables, filling with NULL where no match exists. |
| **CROSS JOIN** | Cartesian Product (Every row in A linked to every row in B). Danger: Very slow on large tables! |
| **SELF JOIN** | Joining a table to itself (Great for hierarchies like "Employee -> Manager"). |
| **LATERAL JOIN** | Allows a subquery to refer to columns of preceding tables in the JOIN (The "For Each" Join). |

---

## 2. The Internal Engines (The Deep Dive)

When you write `JOIN`, you are telling Postgres **WHAT** to do. The **Query Planner** decides **HOW** to do it using one of three physical algorithms. Understanding these is the difference between a Junior and a Senior Database Engineer.

### 1. Nested Loop Join (The "Brute Force")
- **The Process**: For every row in the first table (Outer), scan the entire second table (Inner) looking for a match.
- **Complexity**: $O(N \times M)$
- **When is it used?**: 
    - When one table is very small (like 10 rows).
    - When the join column has an **Index**. Postgres can jump straight to the correct row instead of scanning everything.
- **GitHub Note**: This is efficient ONLY with indexes or tiny data. Without them, it crashes performance on large datasets.

### 2. Hash Join (The "Memory Specialist")
- **The Process**: 
    1. Postgres takes the smaller table and builds a **Hash Table** in memory (`work_mem`). It turns the ID into a "shortcut" address.
    2. It then scans the larger table once. For every row, it looks up the ID in the Hash Table.
- **Complexity**: $O(N + M)$
- **When is it used?**: 
    - When joining large tables that **don't** have indexes.
    - When there is enough memory (`work_mem`) to hold the hash table.
- **GitHub Note**: This is a "one-pass" algorithm. It's very fast for bulk data but uses more RAM.

### 3. Merge Join (The "Sort & Zip")
- **The Process**: 
    1. Sort both tables by the Join key (if they aren't already).
    2. Scan them together like a **zipper**. Since both are sorted, once you pass a number (like ID 5), you never have to look back.
- **Complexity**: $O(N \log N + M \log M)$ (Due to sorting).
- **When is it used?**: 
    - When both tables are already sorted (e.g., you have a **B-Tree Index** on both).
    - When the join condition is an equality (`=`).
- **GitHub Note**: This is the most efficient join for massive, indexed datasets because it doesn't need to build extra structures in memory.

---

## Challenge: MystryShop Analytics
You aren't just joining names; you are calculating revenue, finding orphaned products, and building hierarchical categories.

### Workspace
- **Script**: [exercises.sql](./exercises.sql)
