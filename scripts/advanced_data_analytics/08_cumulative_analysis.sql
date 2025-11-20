/* 
_______________________________________________________________
              YEARLY SALES + RUNNING TOTAL ANALYSIS
_______________________________________________________________

This query summarizes yearly sales and calculates two metrics:

  - Running total of yearly sales over time
  - Moving average of yearly average prices

The inner query aggregates sales and average price by year.
The outer query applies window functions to compute running totals
and moving averages.
*/

SELECT
      order_date,
      total_sales,
      SUM(total_sales) OVER (ORDER BY order_date) AS running_total_sales,
      AVG(avg_price) OVER (ORDER BY order_date)   AS moving_average_price
FROM (
        SELECT
              DATETRUNC(YEAR, order_date) AS order_date,
              SUM(sales_amount)           AS total_sales,
              AVG(price)                  AS avg_price
        FROM gold.fact_sales
        WHERE order_date IS NOT NULL
        GROUP BY DATETRUNC(YEAR, order_date)
     ) t
