/* 
_______________________________________________________________
                    CUSTOMER REPORTING VIEW
_______________________________________________________________

This script creates a reporting view that consolidates customer
profile data, order behavior, spending patterns, and segmentation.

The logic includes:

1. Base Query  
   - Joins fact_sales with customer details  
   - Computes customer age  

2. Customer Aggregation  
   - Calculates total orders, total sales, total quantity  
   - Computes product diversity, last order date, and lifespan  

3. Final Output  
   - Adds age groups  
   - Assigns customer segments (VIP, Regular, New)  
   - Calculates recency, AOV, and monthly spending  

The final result is exposed as `gold.report_customers`.
*/

CREATE VIEW gold.report_customers AS
WITH base_query AS (
-- Base query: retrieves core columns from tables
    SELECT
          f.order_number,
          f.product_key,
          f.order_date,
          f.sales_amount,
          f.quantity,
          c.customer_key,
          c.customer_number,
          CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
          DATEDIFF(YEAR, c.birthdate, GETDATE()) AS customer_age
    FROM gold.fact_sales f
    LEFT JOIN gold.dim_customers c
           ON c.customer_key = f.customer_key
    WHERE f.order_date IS NOT NULL
),

customer_aggregation AS (
-- Customer-level aggregations
    SELECT 
          customer_key,
          customer_number,
          customer_name,
          customer_age,
          COUNT(DISTINCT order_number) AS total_orders,
          SUM(sales_amount)            AS total_sales,
          SUM(quantity)                AS total_quantity,
          COUNT(DISTINCT product_key)  AS total_products,
          MAX(order_date)              AS last_order,
          DATEDIFF(MONTH, MIN(order_date), MAX(order_date)) AS lifespan
    FROM base_query
    GROUP BY
          customer_key,
          customer_number,
          customer_name,
          customer_age
)

SELECT
      customer_key,
      customer_number,
      customer_name,
      customer_age,
-- Age grouping
      CASE 
          WHEN customer_age < 20 THEN 'UNDER 20'
          WHEN customer_age BETWEEN 20 AND 29 THEN '20-29'
          WHEN customer_age BETWEEN 30 AND 39 THEN '30-39'
          WHEN customer_age BETWEEN 40 AND 49 THEN '40-49'
          ELSE '50 AND ABOVE'
      END AS age_group,
-- Customer segmentation
      CASE
          WHEN lifespan >= 12 AND total_sales > 5000 THEN 'VIP'
          WHEN lifespan >= 12 AND total_sales <= 5000 THEN 'Regular'
          ELSE 'New'
      END AS customer_segment,

      last_order,
      DATEDIFF(MONTH, last_order, GETDATE()) AS recency,
 -- Average order value
      CASE 
          WHEN total_orders = 0 THEN 0
          ELSE total_sales / total_orders
      END AS average_order_value,

      total_quantity,
      total_products,
-- Average monthly spending
      CASE 
          WHEN lifespan = 0 THEN total_sales
          ELSE total_sales / lifespan
      END AS average_monthly_spent

FROM customer_aggregation;
