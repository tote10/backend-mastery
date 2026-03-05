# 10-Week SQL & PostgreSQL Mastery Plan (Grind Mode)

This is not a basic tutorial. This is a path to becoming a PostgreSQL expert. We will cover standard usage AND the internals, performance trade-offs, and architectural patterns.

## Weeks 1–2: Professional SQL & Schema Design
- **Day 1**: Introduction to Databases & Postgres Architecture (Background processes, Memory) ✅
- **Day 2**: Basic SQL – SELECT & WHERE (Boolean logic, NULL handling, Pattern matching) ✅
- **Day 3**: Data Modification & Feedback (INSERT with RETURNING, Multi-row updates) ✅
- **Day 4**: Data Types Mastery (Storage sizes, Precision, Arrays, JSONB introduction) ✅
- **Day 5**: **(Current)** Constraints Deep Dive (FK Actions, Named Constraints, Composite Keys, CHECK Logic)
- **Day 6**: Joins Masterclass (Inner, Left, Right, Full, Cross, Self, Lateral Joins)
- **Day 7**: Aggregation & Windows (GROUP BY vs. WINDOW Functions, Complex HAVING)
- **Day 8**: Advanced Subqueries & CTEs (WITH, Recursive CTEs, Correlated Subqueries)
- **Day 9**: Set Operations & Advanced Filtering (EXISTS, INTERSECT, EXCEPT, ARRAY operators)
- **Day 10**: Indexing Fundamentals & EXPLAIN (How Postgres finds data, Reading execution plans)
- **Days 11–14**: Mini-project: High-Integrity E-commerce Schema with full Business logic in SQL.

## Weeks 3–4: SQL Internals & Relational Theory
- **Day 15**: Views, Materialized Views, and Refresh Strategies
- **Day 16**: Transactions & ACID Mastery (Atomic commits, WAL role in atomicity)
- **Day 17**: Isolation Levels (Dirty reads, Phantoms, Serialization anomalies)
- **Day 18**: EXPLAIN ANALYZE Deep Dive (Cost vs. Actual time, Memory usage in plans)
- **Day 19**: Normalization Mastery (BNCF, 4NF, 5NF - when they matter)
- **Day 20**: Intelligent Denormalization (Materialized paths, Trigger-based syncing)
- **Days 21–22**: Analytical Queries on Large Datasets (Trillion-row simulation concepts)
- **Days 23–24**: Higher-level Internals (Query Parser, Rewriter, Optimizer, Executor)
- **Days 25–28**: Mini-project Extension: Performance Benchmarking & Refactoring.

## Weeks 5–6: Indexing Internals & Query Optimization
- **Day 29**: B-Tree Internals (Balanced trees, Page structure, Leaf nodes)
- **Day 30**: Advanced Index Types (GIN, GiST, BRIN, Hash - when to use what)
- **Day 31**: Composite, Partial, and Expression Indexes
- **Day 32**: Query Planner Cost Estimation (seq_page_cost, random_page_cost tuning)
- **Day 33**: Join Algorithms Internals (Nested Loop, Hash Join, Merge Join - why Postgres picks them)
- **Day 34**: Memory Management (work_mem, maintenance_work_mem, temp files)
- **Days 35–36**: Shared Buffers & OS Cache (The journey of a data page)
- **Day 37**: TOAST Architecture (How Postgres handles massive rows)
- **Days 38–42**: Deep reading & implementation of "SQL Performance Explained" examples.

## Weeks 7–8: Concurrency, MVCC & Reliability
- **Day 43**: MVCC Deep Dive (Multi-Version Concurrency Control, Heap Only Tuples)
- **Day 44**: Row Visibility Internals (xmin, xmax, Transaction Isolation)
- **Day 45**: Locking Strategies (Implicit vs Explicit, Advisory Locks, Deadlock detection)
- **Day 46**: The Vacuum Lifecycle (Autovacuum tuning, Bloat management, Freeze Map)
- **Day 47**: Write-Ahead Logging (WAL) & Crash Recovery (Checkpoints, Redo logs)
- **Day 48**: Replication Deep Dive (Streaming vs. Logical, Synchronous vs. Asynchronous)
- **Days 49–50**: Disaster Recovery: Point-in-Time Recovery (PITR) & pg_basebackup.
- **Days 51–56**: Capstone 1: Multi-user Concurrent Booking System with Strict Conflict Resolution.

## Weeks 9–10: High Availability & Scaling
- **Day 57**: Declarative Table Partitioning (Range, List, Hash partitioning strategies)
- **Day 58**: Designing for Sharding (Citus, Foreign Data Wrappers, Sharding keys)
- **Day 59**: Connection Management (Client side vs. Server side pooling, PgBouncer vs. PgCat)
- **Day 60**: Distributed Consistency (CAP Theorem in practice, 2-Phase Commit)
- **Day 61**: High Availability Architectures (Patroni, Keepalived, VIPs)
- **Day 62**: Polyglot Persistence (When to stay in SQL vs. moving to NoSQL)
- **Days 63–70**: Final Capstone: Architecting a High-Load E-Commerce Platform with Partitioning and HA.

✅ Outcome: You are now a Database Architect, not just a SQL user.
