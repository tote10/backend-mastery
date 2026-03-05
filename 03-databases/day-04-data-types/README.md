# Day 4: Data Types

Today is about the "building blocks" of your data. In PostgreSQL, choosing the right data type is crucial for performance, storage efficiency, and data integrity.

## Core Concepts
PostgreSQL has a rich set of data types. Here are the "High 4" we are focusing on today:

1. **Numeric Types**: 
   - `INT` (Standard 4-byte integer).
   - `DECIMAL` / `NUMERIC` (For exact values like money).
   - `REAL` / `DOUBLE PRECISION` (For scientific calculation).

2. **String Types**:
   - `VARCHAR(n)` (Variable-length with a limit).
   - `TEXT` (Unlimited length, very common in Postgres).
   - `CHAR(n)` (Fixed-length, rarely used except for specific codes).

3. **Temporal (Date/Time) Types**:
   - `DATE` (Just the date).
   - `TIMESTAMP` (Date and time).
   - `INTERVAL` (A span of time).

4. **Boolean**:
   - `BOOLEAN` (True or False).

## Why does it matter?
- **Storage**: A `BIGINT` takes more space than a `SMALLINT`.
- **Validation**: You can't accidentally put "hello" in a `DATE` column.
- **Performance**: Sorting numbers is faster than sorting text.

---

## Challenge: The "Product Catalog"
You will design a `products` table that uses a variety of types.

### Goal:
Create a table that stores:
- A unique ID
- A name (short text)
- A long description (unlimited text)
- A price (exact decimal)
- A release date
- Whether it is currently in stock (true/false)

---

## Workspace
- **Script**: [exercises.sql](./exercises.sql)
