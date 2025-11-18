/*
This SQL script generates a consolidated report of key performance metrics for a retail or e-commerce dataset. 
It pulls data from both fact and dimension tables and returns each KPI as a separate row for easy dashboard integration.

**What This Script Does**

- Calculates Total Sales using SUM(sales_amount)
- Calculates Total Quantity Sold using SUM(quantity)
- Calculates Average Price using AVG(price)
- Counts Total Number of Orders using COUNT(DISTINCT order_number)
- Counts Total Number of Products using COUNT(product_name)
- Counts Total Number of Customers using COUNT(customer_key)

**All KPIs are combined using UNION ALL to form a single, tidy output table with two columns:**

- measure_name
- measure_value 
*/

SELECT 'Total Sales' as measure_name, SUM (sales_amount) AS measure_value FROM gold.fact_sales0
UNION ALL
SELECT 'Total Quantity' as measured_value,SUM(quantity) AS total_quantity FROM gold.fact_sales
Union ALL
SELECT 'Average Price' as measured_value,AVG(price) AS average_price FROM gold.fact_sales
Union ALL
SELECT 'Total Nr. Orders' as measured_value, COUNT(DISTINCT order_number) AS total_orders FROM gold.fact_sales
UNION ALL
SELECT 'Total Nr. Products' as measured_value, COUNT(product_name) AS total_prodcut FROM gold.dim_products
UNION ALL
SELECT 'Total Nr. Cusotmers' as measured_value, COUNT( customer_key) AS total_customers FROM gold.dim_customers
