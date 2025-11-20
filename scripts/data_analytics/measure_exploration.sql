/* 
_______________________________________________________________
                     MEASURE EXPLORATION SCRIPT
_______________________________________________________________

This script builds a small KPI table that consolidates several 
high level performance metrics for a retail or e-commerce dataset. 
Each KPI is returned as a separate row, which makes it easy to 
use in dashboards or reports.

Metrics included:
  - Total Sales (sum of sales_amount)
  - Total Quantity Sold
  - Average Price
  - Total Number of Orders
  - Total Number of Products
  - Total Number of Customers

All KPIs are combined using UNION ALL into one tidy result set 
with the following columns:

  - measure_name
  - measure_value
*/
/* 
_______________________________________________________________
               CONSOLIDATED KPI OUTPUT
_______________________________________________________________
*/
SELECT 
      'Total Sales'          AS measure_name,
      SUM(sales_amount)      AS measure_value
FROM gold.fact_sales

UNION ALL

SELECT 
      'Total Quantity'       AS measure_name,
      SUM(quantity)          AS measure_value
FROM gold.fact_sales

UNION ALL

SELECT 
      'Average Price'        AS measure_name,
      AVG(price)             AS measure_value
FROM gold.fact_sales

UNION ALL

SELECT 
      'Total Nr. Orders'     AS measure_name,
      COUNT(DISTINCT order_number) AS measure_value
FROM gold.fact_sales

UNION ALL

SELECT 
      'Total Nr. Products'   AS measure_name,
      COUNT(product_name)    AS measure_value
FROM gold.dim_products

UNION ALL

SELECT 
      'Total Nr. Customers'  AS measure_name,
      COUNT(customer_key)    AS measure_value
FROM gold.dim_customers;
