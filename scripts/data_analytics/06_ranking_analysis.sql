/* 
_______________________________________________________________
                        SALES RANKINGS REPORT
_______________________________________________________________

This script generates a clean set of analytical rankings focused 
on product performance and customer ordering behavior. It includes 
two different approaches for finding the top-performing products 
so that both simple and window-function methods can be compared 
side-by-side.

Included rankings:
  - Top 5 products by total revenue (simple TOP approach)
  - Top 5 products by total revenue (ROW_NUMBER window function)
  - Bottom 5 products by total revenue
  - Customers with the fewest orders

Tables referenced:
  - gold.fact_sales
  - gold.dim_products
  - gold.dim_customers
*/

/* 
_______________________________________________________________
       TOP 5 PRODUCTS BY TOTAL REVENUE (SIMPLE VERSION)
_______________________________________________________________ 
*/
SELECT 'TOP 5 PRODUCTS BY TOTAL REVENUE (SIMPLE)' AS Header;

SELECT TOP 5
      p.product_name,
      SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
      ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue DESC;



/*
_______________________________________________________________
     TOP 5 PRODUCTS BY TOTAL REVENUE (ROW_NUMBER VERSION)
_______________________________________________________________
*/
SELECT 'TOP 5 PRODUCTS BY TOTAL REVENUE (ROW_NUMBER)' AS Header;

SELECT
      product_name,
      total_revenue,
      rank_products
FROM (
        SELECT
              p.product_name,
              SUM(f.sales_amount) AS total_revenue,
              ROW_NUMBER() OVER (ORDER BY SUM(f.sales_amount) DESC) AS rank_products
        FROM gold.fact_sales f
        LEFT JOIN gold.dim_products p
              ON p.product_key = f.product_key
        GROUP BY p.product_name
     ) ranked
WHERE rank_products <= 5;



/* 
============================================================
         BOTTOM 5 PRODUCTS BY TOTAL REVENUE
============================================================ */
SELECT '=======  BOTTOM 5 PRODUCTS BY TOTAL REVENUE  =======' AS Header;

SELECT TOP 5
      p.product_name,
      SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
      ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue ASC;



/* 
============================================================
           CUSTOMERS WITH THE FEWEST ORDERS
============================================================ */
SELECT '=======  CUSTOMERS WITH FEWEST ORDERS  =======' AS Header;

SELECT TOP 3
      c.customer_key,
      c.first_name,
      c.last_name,
      COUNT(DISTINCT f.order_number) AS total_orders
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
      ON c.customer_key = f.customer_key
GROUP BY 
      c.customer_key,
      c.first_name,
      c.last_name
ORDER BY total_orders ASC;
