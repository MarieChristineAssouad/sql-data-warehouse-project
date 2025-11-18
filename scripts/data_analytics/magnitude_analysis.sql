/* 
===============================================================
                    MAGNITUDE ANALYSIS REPORT
===============================================================

This script runs a series of exploratory queries to analyze 
customer demographics, product distribution, and revenue 
performance across several important dimensions.

Key metrics included:
  - Customer counts by country and by gender
  - Total products by category
  - Average cost per category
  - Total revenue by category
  - Total revenue by customer

Tables used:
  - gold.dim_customers
  - gold.dim_products
  - gold.fact_sales
*/

/*
============================================================
               TOTAL CUSTOMERS BY COUNTRY
============================================================ */
SELECT '=======  TOTAL CUSTOMERS BY COUNTRY  =======' AS Header;

SELECT
      country,
      COUNT(customer_id) AS total_customers
FROM gold.dim_customers
GROUP BY country
ORDER BY total_customers DESC;

/* 
============================================================
                   TOTAL CUSTOMERS BY GENDER
============================================================ */
SELECT '=======  TOTAL CUSTOMERS BY GENDER  =======' AS Header;

SELECT
      gender,
      COUNT(customer_id) AS total_customers
FROM gold.dim_customers
GROUP BY gender
ORDER BY total_customers DESC;


/* 
============================================================
                   TOTAL PRODUCTS BY CATEGORY
============================================================ */
SELECT '=======  TOTAL PRODUCTS BY CATEGORY  =======' AS Header;

SELECT
      category,
      COUNT(product_key) AS total_products
FROM gold.dim_products
GROUP BY category
ORDER BY total_products DESC;


/* 
============================================================
                   AVERAGE COST BY CATEGORY
============================================================ */
SELECT '=======  AVERAGE COST BY CATEGORY  =======' AS Header;

SELECT
      category,
      AVG(cost) AS average_cost
FROM gold.dim_products
GROUP BY category
ORDER BY average_cost DESC;


/* 
============================================================
                   TOTAL REVENUE BY CATEGORY
============================================================ */
SELECT '=======  TOTAL REVENUE BY CATEGORY  =======' AS Header;

SELECT
      p.category,
      SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
      ON p.product_key = f.product_key
GROUP BY p.category
ORDER BY total_revenue DESC;


/* 
============================================================
                   TOTAL REVENUE BY CUSTOMER
============================================================ */
SELECT '=======  TOTAL REVENUE BY CUSTOMER  =======' AS Header;

SELECT
      c.customer_key,
      c.first_name,
      c.last_name,
      SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
      ON c.customer_key = f.customer_key
GROUP BY
      c.customer_key,
      c.first_name,
      c.last_name
ORDER BY total_revenue DESC;
