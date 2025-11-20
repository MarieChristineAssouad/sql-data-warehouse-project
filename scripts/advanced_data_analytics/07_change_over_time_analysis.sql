/* 
_______________________________________________________________
                    MONTHLY SALES SUMMARY
_______________________________________________________________

This query aggregates sales performance by month. For each month,
it returns:
  - Total sales amount
  - Number of distinct customers
  - Total quantity sold

The date is grouped at the yyyy-MM level using order_date.
*/

SELECT
      FORMAT(order_date, 'yyyy-MM') AS order_month,
      SUM(sales_amount)             AS total_sales,
      COUNT(DISTINCT customer_key)  AS total_customers,
      SUM(quantity)                 AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY FORMAT(order_date, 'yyyy-MM')
ORDER BY FORMAT(order_date, 'yyyy-MM');
