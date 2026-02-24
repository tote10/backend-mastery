# Databases with SQLite & SQLAlchemy

Welcome to Phase 03! In this directory, we transition from **in-memory storage** (where data vanishes when the server stops) to **persistent storage** (where data is saved to a file).

## 🗝️ Core Concepts

### 1. Persistence
In `02-rest-api`, we used a Python `list` to store items. In this phase, we use **SQLite**, a serverless database engine that stores everything in a single `.db` file on your disk.

### 2. SQLAlchemy (The ORM)
Instead of writing raw SQL commands (like `INSERT INTO items...`), we use **SQLAlchemy**, an Object-Relational Mapper (ORM). This allows us to interact with the database using Python classes and methods.

### 3. The Pydantic vs SQLAlchemy Distinction
- **Pydantic Models**: Used for data validation (what the user sends/receives via JSON).
- **SQLAlchemy Models**: Used for database structure (how data is stored in the table).

## 🚀 Getting Started

1. **Install Dependencies**:
   ```bash
   pip install sqlalchemy
   ```

2. **Explore the Files**:
   - `database_example.py`: A simple script to understand how SQL commands translate to Python.
   - `main.py`: The FastAPI implementation using the database.

3. **Running the API**:
   ```bash
   uvicorn main:app --reload
   ```
