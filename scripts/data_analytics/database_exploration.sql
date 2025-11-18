/* 
===============================================================
                     DATABASE EXPLORATION SCRIPT
===============================================================

This script provides a quick, simple way to explore the structure 
of a database by querying metadata from the INFORMATION_SCHEMA 
views. I use this as a first step whenever I start working with 
a new database, validating a data model, or preparing analytics 
queries. It helps me understand what objects exist and how they 
are structured.

What this script does:

1. Lists all tables and views in the database
   - Uses INFORMATION_SCHEMA.TABLES
   - Helps identify available datasets and the overall layout

2. Inspects the column structure of a specific table
   - Uses INFORMATION_SCHEMA.COLUMNS
   - Returns column names, data types, and other metadata

This is useful for initial data discovery before writing 
transformations, models, or analytical queries.
*/


/*
============================================================
       LIST ALL TABLES AND VIEWS IN THE DATABASE
============================================================ 
*/
SELECT 
    *
FROM INFORMATION_SCHEMA.TABLES;



/* 
============================================================
       INSPECT COLUMN METADATA FOR A SPECIFIC TABLE
============================================================
*/
SELECT 
    *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'dim_customers';
