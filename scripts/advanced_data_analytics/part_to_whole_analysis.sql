/* 
===============================================================
          CATEGORY SALES CONTRIBUTION ANALYSIS
===============================================================

This query identifies which product categories generate the most
sales and calculates each category's percentage contribution to 
overall revenue.

The steps:
  1. Aggregate total sales per category
  2. Compute total revenue across all categories
  3. Calculate each category's % share of total sales
  4. Rank categories by contribution (descending)

This is useful for understanding product mix and identifying
high-impact categories.
*/

WITH category_sales AS (
    SELECT
          p.category,
          SUM(f.sales_amount) AS total_sales
    FROM gold.fact_sales f
    LEFT JOIN gold.dim_products p
           ON p.product_key = f.product_key
    GROUP BY p.category
)

SELECT
      category,
      total_sales,
      SUM(total_sales) OVER () AS overall_sales,
      CONCAT( ROUND( (CAST(total_sales AS FLOAT) / SUM(total_sales) OVER()) * 100, 2 ), '%') AS percentage_of_total
FROM category_sales
ORDER BY total_sales DESC;
