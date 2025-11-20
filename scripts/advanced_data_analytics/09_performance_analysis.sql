/* 
______________________________________________________________________
        YEARLY PRODUCT PERFORMANCE ANALYSIS (AVG + YoY COMPARISON)
______________________________________________________________________

This query evaluates yearly product performance using two comparisons:

1. **Against product historical average**
   - Calculates the average yearly sales for each product
   - Computes the difference between the current year and the product average
   - Flags performance as ABOVE AVG / BELOW AVG / AVG

2. **Year-over-year (YoY) comparison**
   - Uses LAG() to retrieve previous year sales
   - Measures the difference between current and previous year
   - Flags YoY movement as INCREASE / DECREASE / NO CHANGE

This helps identify long-term patterns, growth opportunities, and 
products that consistently overperform or underperform.
*/


-- YEARLY SALES PER PRODUCT
WITH yearly_product_sales AS (
    SELECT
          YEAR(f.order_date)        AS order_year,
          p.product_name,
          SUM(f.sales_amount)       AS current_sales
    FROM gold.fact_sales f
    LEFT JOIN gold.dim_products p
           ON f.product_key = p.product_key
    WHERE YEAR(f.order_date) IS NOT NULL
    GROUP BY 
          YEAR(f.order_date),
          p.product_name
)

-- FINAL ANALYSIS
SELECT 
      order_year,
      product_name,
      current_sales,

      -- Average performance comparison
      AVG(current_sales) OVER (PARTITION BY product_name) AS average_sales,
      current_sales 
          - AVG(current_sales) OVER (PARTITION BY product_name) AS diff_avg,
      CASE
          WHEN current_sales > AVG(current_sales) OVER (PARTITION BY product_name)
               THEN 'ABOVE AVG'
          WHEN current_sales < AVG(current_sales) OVER (PARTITION BY product_name)
               THEN 'BELOW AVG'
          ELSE 'AVG'
      END AS avg_change_flag,

      -- YoY performance comparison
      LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) AS previous_year_sales,
      current_sales
          - LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) AS diff_previous_years,
      CASE
          WHEN current_sales > LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year)
               THEN 'INCREASE'
          WHEN current_sales < LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year)
               THEN 'DECREASE'
          ELSE 'NO CHANGE'
      END AS yoy_change_flag

FROM yearly_product_sales
ORDER BY product_name, order_year;
