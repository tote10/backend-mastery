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

## 2. The Internal Engines (The "Deep Grind")

Postgres doesn't just "guess" how to join. The **Query Planner** chooses one of three algorithms based on your data size:

### 1. Nested Loop Join
The "Brute Force" method. 
- **Logic**: For every row in Table A, scan every row in Table B.
- **When?**: Used for very small tables or when using an Index.

### 2. Hash Join
The "Memory King".
- **Logic**: Postgres builds a temporary "Hash Table" of the smaller table in memory (`work_mem`), then scans the larger table once.
- **When?**: Used for large tables with no indexes.

### 3. Merge Join
The "Sort & Zip" method.
- **Logic**: Sort both tables by the join key, then scan them together like a zipper.
- **When?**: Used when tables are already sorted or have B-Tree indexes.

---

## Challenge: MystryShop Analytics
You aren't just joining names; you are calculating revenue, finding orphaned products, and building hierarchical categories.

### Workspace
- **Script**: [exercises.sql](./exercises.sql)
