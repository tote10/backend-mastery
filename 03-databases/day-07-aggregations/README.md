# Day 7: Aggregation & Windows (Data Summarization)

Now that you can join data together, you need to know how to summarize it. When a boss asks for a "Sales Report," they don't want to see a million rows of individual orders. They want one row: **"Total Sales: $50,000"**.

## 1. The Core Aggregators
Aggregation functions take many rows and crush them down into a single value.

| Function | What it does | Example |
| :--- | :--- | :--- |
| **`COUNT()`** | Counts the number of rows. | `COUNT(id)` (Counts IDs), `COUNT(*)` (Counts everything) |
| **`SUM()`** | Adds up all the numbers in a column. | `SUM(quantity)` |
| **`AVG()`** | Calculates the average value. | `AVG(price)` |
| **`MAX()` / `MIN()`** | Finds the highest/lowest value. | `MAX(price)` |

---

## 2. Using `GROUP BY`
If you just use `SUM()`, you get one total number for the whole table. 
If you want subtotals (like "Total Sales **Per Category**"), you must use `GROUP BY`.

**Rule of Thumb**: Any column in your `SELECT` that is *not* inside an aggregator (like `SUM`) **MUST** be in the `GROUP BY` clause.

### Example:
```sql
SELECT c.name, SUM(oi.quantity)
FROM categories c
INNER JOIN products p ON c.id = p.category_id
INNER JOIN order_items oi ON p.id = oi.product_id
GROUP BY c.name; -- Grouping the sum by each category name
```

---

## 3. `WHERE` vs. `HAVING` (The Filter Trick)
Both of these filter data, but they happen at different times:

- **`WHERE`**: Filters rows **BEFORE** the aggregation happens. 
  *(e.g., "Only sum up orders made this year.")*
- **`HAVING`**: Filters the results **AFTER** the aggregation happens. 
  *(e.g., "Only show me categories where the Total Sum is greater than 100.")*

---

## 4. Window Functions (The "Architect's Tool")
Sometimes you want to show an aggregated number (like a total) but you **don't** want to crush the rows together. 

Window functions use the `OVER()` keyword. They let you peek through a "window" at other rows without changing the current row.

### Example: Running Total
```sql
SELECT 
    name, 
    price, 
    SUM(price) OVER(ORDER BY price DESC) AS running_total
FROM products;
```

---

## Your Mission
Open [exercises.sql](./exercises.sql) to build the MystryShop financial reports!
