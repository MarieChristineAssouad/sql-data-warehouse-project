/*
This SQL script performs an initial exploratory analysis on the sales and customer datasets to understand the time span of available data and the age distribution of customers. 
It is useful for data validation, reporting readiness checks, and understanding dataset coverage before building dashboards or models.

What This Script Does

**1. Sales Date Range Analysis**

*The script identifies:*

- The first recorded order date
- The last recorded order date
- The total number of years covered by the sales data
- The total number of months covered by the sales data

This helps determine how much historical data is available for analysis and forecasting.

**2. Customer Age Analysis**

*The script extracts:*

- The oldest customer birthdate and their calculated age
- The youngest customer birthdate and their calculated age

*This provides immediate insight into the age distribution of the customer base.*
- Tables Used
- gold_fact_sales
- gold_dim_customers
*/

-- Find the date of the first and last order
-- how many years of sales are available
-- how many months of sales are available

SELECT
MIN(order_date) AS first_order_date,
MAX(order_date) AS last_order_date,
DATEDIFF(year, MIN (order_date),MAX(order_date)) AS order_range_year,
DATEDIFF(month, MIN (order_date),MAX(order_date)) AS order_range_month
FROM gold.fact_sales

--Find the youngest and oldest customers
SELECT
MIN(birthdate) AS oldest_birthdate,
DATEDIFF( year, MIN(birthdate), GETDATE()) AS oldest_age,
MAX(birthdate) AS youngest_birthdate,
DATEDIFF( year, MAX(birthdate), GETDATE()) AS youngest_age
FROM gold.dim_customers
