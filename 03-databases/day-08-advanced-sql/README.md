# Day 8: Advanced Subqueries and CTEs

This day focuses on query architecture: organizing SQL logic so complex reports stay correct, readable, and maintainable.

## Core Outcome
By the end of this module, advanced query patterns should be understandable in terms of purpose, trade-offs, and execution flow.

## 1. Subqueries
A subquery is a query embedded inside another query.

Common placements:
- In WHERE for filtering based on another result set
- In SELECT for scalar values
- In FROM as a derived table

When it helps:
- Isolates small pieces of logic
- Avoids temporary physical tables for intermediate work

Common pitfalls:
- Using an operator that expects one value when the subquery returns many rows
- Nesting too deeply and hurting readability

## 2. Correlated Subqueries
A correlated subquery references columns from the outer query.

Mental model:
- Evaluate an inner condition in the context of each outer row

Typical use cases:
- Existence checks
- Row-level comparisons against related data

Common pitfalls:
- Missing the correlation condition between outer and inner queries
- Creating expensive row-by-row patterns where a join or CTE would be clearer

## 3. CTEs (WITH)
A CTE (Common Table Expression) names an intermediate result.

Why this matters:
- Breaks one large query into logical stages
- Makes debugging and refactoring easier
- Improves readability for collaboration and review

Good structure:
1. Build a small, reliable intermediate set
2. Build the next stage from it
3. Produce final report output

Common pitfalls:
- Packing unrelated logic into one giant CTE
- Using unclear names for intermediate stages

## 4. Recursive CTEs
Recursive CTEs solve hierarchical traversal problems.

Typical hierarchy examples:
- Category trees
- Employee-manager chains
- Folder-like parent-child structures

Standard shape:
1. Anchor part (starting rows)
2. Recursive part (next-level expansion)
3. UNION ALL to combine levels

Common pitfalls:
- Missing a stopping condition
- Producing duplicates without clear traversal logic

## 5. Choosing the Right Pattern
- Subquery: best for compact filters or single helper results
- Correlated subquery: best when logic depends on each outer row
- CTE: best for multi-step readable reports
- Recursive CTE: best for parent-child traversal

## 6. Practice Method
1. Write a first draft query quickly
2. Validate result shape against requirement
3. Rename outputs clearly
4. Refactor for clarity
5. Explain the final query flow in one sentence

If query flow can be explained simply, architecture quality is usually high.

## Next File
Use the exercise prompts in `exercises.sql` and implement each query without copy-paste solutions.
