/*
=============================================================
                  SALES RANKINGS REPORT
=============================================================
This SQL script generates a clean, structured analytics report highlighting product and customer performance. It includes multiple ranking methods for transparency and comparison. The report covers:

1. Top 5 products by total revenue
 - Simple TOP 5 approach
 - ROW_NUMBER() window function approach
2. Bottom 5 products by total revenue
3. Customers with the fewest orders
*/

-- ============================================================
-- TOP 5 PRODUCTS BY TOTAL REVENUE (SIMPLE VERSION)
-- ============================================================
SELECT 'TOP 5 PRODUCTS BY TOTAL REVENUE (SIMPLE)' AS Header;

SELECT TOP 5
      p.product_name
    , SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
      ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue DESC;



-- ============================================================
-- TOP 5 PRODUCTS BY TOTAL REVENUE (ROW_NUMBER VERSION)
-- ============================================================
SELECT 'TOP 5 PRODUCTS BY TOTAL REVENUE (ROW_NUMBER)' AS Header;

SELECT
      product_name
    , total_revenue
    , rank_products
FROM (
        SELECT
              p.product_name
            , SUM(f.sales_amount) AS total_revenue
            , ROW_NUMBER() OVER (ORDER BY SUM(f.sales_amount) DESC) AS rank_products
        FROM gold.fact_sales f
        LEFT JOIN gold.dim_products p
              ON p.product_key = f.product_key
        GROUP BY p.product_name
     ) t
WHERE rank_products <= 5;



-- ============================================================
-- BOTTOM 5 PRODUCTS BY TOTAL REVENUE
-- ============================================================
SELECT 'BOTTOM 5 PRODUCTS BY TOTAL REVENUE' AS Header;

SELECT TOP 5
      p.product_name
    , SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
      ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue ASC;



-- ============================================================
-- 3 CUSTOMERS WITH THE FEWEST ORDERS
-- ============================================================
SELECT 'CUSTOMERS WITH FEWEST ORDERS' AS Header;

SELECT TOP 3
      c.customer_key
    , c.first_name
    , c.last_name
    , COUNT(DISTINCT f.order_number) AS total_orders
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
      ON c.customer_key = f.customer_key
GROUP BY
      c.customer_key
    , c.first_name
    , c.last_name
ORDER BY total_orders ASC;
