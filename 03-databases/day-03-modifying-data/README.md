# Day 3: More SQL – INSERT, UPDATE, DELETE

Welcome to Day 3 of the SQL Deep Dive! Today, we transition from reading data to **modifying** it. This is a critical skill for building dynamic applications where users can create accounts, update profiles, and delete content.

## Learning Objectives
1. **Primary Keys & Auto-increment**: Understand how databases uniquely identify rows.
2. **INSERT**: How to add new records.
3. **UPDATE**: How to safely modify existing records.
4. **DELETE**: How to remove records without causing data loss.
5. **The WHERE Clause**: Why it's the most important part of modification.

## The Challenge: User Management
In this exercise, you will build a simple user management system.

### 1. Create the Table
Use the `CREATE TABLE` command to define the structure for your users.

### 2. Populate Data (INSERT)
Practice adding users individually and in batches. Learn how to use `RETURNING` to get feedback from the database.

### 3. Modify Records (UPDATE)
Change user details safely using specific identifiers.

### 4. Remove Records (DELETE)
Clean up data while ensuring you don't delete everything by mistake.

---

## Workspace
- **Script**: [exercises.sql](./exercises.sql)
- **Tool**: PostgreSQL Interactive Shell (`psql`)
