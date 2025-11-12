# SQL-Testing-Project

## Project Description
This project focuses on testing a database of athletes and competition results. The goal is to verify **data integrity**, logic, relationships between tables, and execute various SQL queries for analysis.

## Goal
- Verify correct table data.
- Perform logical checks on results and dates.
- Identify duplicates and errors.
- Generate reports based on sports results.

## Tools Used
- **DBMS:** Microsoft SQL Server  
- **Tools:** SQL Server Management Studio (SSMS)  
- **File format:** SQL files (`.sql`)  
- **Encoding:** UTF-8 (supports Ukrainian characters)

## Project Structure
| File | Description |
|------|-------------|
| `create_database.sql` | Create the `SportsDB` database |
| `create_tables.sql` | Create `Sportsman`, `Athlete`, `Result` tables with keys and relationships |
| `insert_data.sql` | Insert test data into tables |
| `data_queries.sql` | SQL queries for data validation, logic checks, duplicates, and aggregates |


## Tasks
1. Check for empty (`NULL`) and mandatory fields.
2. Logical verification of results (Score 0–1000, dates not in the future).
3. Search for duplicates.
4. Generate aggregates: COUNT, AVG, SUM.
5. Individual tasks: best results, number of athletes per sport, etc.

