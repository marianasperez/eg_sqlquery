# eg_sqlquery
# SQL Query for Betting Data

## Overview
This repository contains the testing and explanation for the SQL query used to retrieve and combine bets from multiple sources (`inactive_bets`, `active_sportsbook_bet`, and `inactive_sportsbook_bet`) for an online betting company. The query explicitly filters bets from **yesterday**, regardless of their status.

## Query, Testing and Results
### Query
It can be found under eg_sqlquery repository as **query.sql**

### Testing
To test this query, I have used **SQL Fiddle**, but it can be executed in any MySQL-compatible database environment.

The **CREATE TABLE** and **INSERT** commands for the testing can be found in the eg_sqlquery repository as **test.sql**.

### Results
It can be found under eg_sqlquery repository as **Results.png**
  - Only bets from yesterday will appear in the result set.
  - The bet_type column will indicate the origin of each bet (e.g., 'inactive_bets', 'active_sportsbook_bet', or 'inactive_sportsbook_bet').

## Assumptions

1. **Data Overlap**:
   - The query assumes that data in the `inactive_bets`, `active_sportsbook_bet`, and `inactive_sportsbook_bet` tables may overlap, meaning the same `id` might appear in more than one table.
   - To avoid showing duplicate rows (i.e., the same `id` appearing multiple times), the query uses **`UNION`**. This will eliminate any exact duplicates across all selected columns (e.g., `id`, `user_id`, `game_id`, etc.).
   - **`DISTINCT`** is applied in the outer query to ensure that no duplicate rows appear based on the selected columns (`id`, `user_id`, `game_id`, etc.), even if the `data_origin` column differs.
     
2. **Status and Active Fields**:
   - The `status` and `active` fields in the `active_sportsbook_bet` table are consistently populated and follow the provided definitions (e.g., `status = 'settled'` indicates the bet is inactive).

## Potential Improvements

1. **Data Integrity**:
   - The schema could enforce unique constraints or primary keys where applicable to reduce the risk of duplicates at the table level.
   - Implementing validation checks during data ingestion could ensure consistency in `status` and `active` values.

2. **Future Enhancements**:
   - Future enhancements could involve auditing the data pipeline to identify and eliminate duplication at the source.
   
3. **Use of CTEs**:
   - Instead of using subqueries with `UNION ALL`, a **Common Table Expression (CTE)** could be employed for improved readability and modularity. This would allow each bet source (`inactive_bets`, `active_sportsbook_bet`, `inactive_sportsbook_bet`) to be defined separately and then referenced in the main query.
   - Using CTEs can simplify debugging and maintenance as each CTE is isolated and easier to manage. Additionally, if the same logic is needed multiple times, CTEs allow for reuse without repeating the same subquery.

4. **Why CTEs Were Not Used**:
   - While CTEs offer modularity and readability, in this case, the query's logic is relatively simple, and using CTEs does not provide a significant advantage in terms of clarity or performance. 
   - The query is straightforward, and using multiple subqueries with `UNION ALL` serves the purpose effectively without the need to break it into multiple CTEs.
   - Furthermore, some databases perform better with simple `UNION ALL` queries compared to CTEs, which might add a slight overhead depending on the query optimizer of the database engine.
   - Therefore, in this particular scenario, CTEs were avoided to keep the query concise and efficient, but they could be considered if the query becomes more complex in the future.
