/* 
===============================================================
                 DATE EXPLORATION ANALYSIS
===============================================================

This script performs an initial exploration of the order and 
customer datasets to understand two key things:

1. The time span covered by the sales data  
2. The age distribution of the customer base  

I typically run this type of analysis early in a project 
to validate data readiness, confirm historical coverage, and 
understand what time periods are available before building 
dashboards, forecasting models, or analytical reports.


---------------------------------------------------------------
            1. SALES DATE RANGE ANALYSIS
---------------------------------------------------------------

This section identifies:
  - The earliest order date in the dataset
  - The most recent order date
  - How many years of data are available
  - How many months of data are available

This helps determine the historical depth of the dataset and 
whether the time coverage is sufficient for reporting or modeling.
  

---------------------------------------------------------------
              2. CUSTOMER AGE ANALYSIS
---------------------------------------------------------------

This section identifies:
  - The oldest customer's birthdate and their age
  - The youngest customer's birthdate and their age

This gives a quick overview of the age range represented in the 
customer base, which is useful when building audience profiles 
or customer segmentation models.
*/


/*
============================================================
               SALES DATE RANGE ANALYSIS
============================================================
*/
SELECT
      MIN(order_date) AS first_order_date,
      MAX(order_date) AS last_order_date,
      DATEDIFF(YEAR,  MIN(order_date), MAX(order_date))  AS order_range_years,
      DATEDIFF(MONTH, MIN(order_date), MAX(order_date))  AS order_range_months
FROM gold.fact_sales;



/* 
============================================================
                 CUSTOMER AGE ANALYSIS
============================================================
*/
SELECT
      MIN(birthdate) AS oldest_birthdate,
      DATEDIFF(YEAR, MIN(birthdate), GETDATE()) AS oldest_age_years,
      MAX(birthdate) AS youngest_birthdate,
      DATEDIFF(YEAR, MAX(birthdate), GETDATE()) AS youngest_age_years
FROM gold.dim_customers;
