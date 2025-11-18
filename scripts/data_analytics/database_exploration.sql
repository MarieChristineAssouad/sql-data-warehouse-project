/*
This SQL script provides a quick overview of the database structure by querying metadata from the INFORMATION_SCHEMA views.
It is useful during the early stages of data discovery, modeling, or when onboarding to a new database.

**What This Script Does**

1. List All Objects in the Database
- Queries INFORMATION_SCHEMA.TABLES to return all tables and views.
- Helps identify available datasets and understand the overall schema layout.

2. Inspect Columns for a Specific Table
- Queries INFORMATION_SCHEMA.COLUMNS to return all columns for a specified table (in this case, dim_customers).
- Provides column names, data types, and other structural metadata.

Useful for understanding table structure before writing transformations, models, or analytics queries.
*/

--	Explore all objects in the database
SELECT 
*
FROM INFORMATION_SCHEMA.TABLES

-- Explore all columns in the database
SELECT
* 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'dim_customers'
