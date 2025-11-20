/* 
_______________________________________________________________
               DIMENSIONS EXPLORATION SCRIPT
_______________________________________________________________

This script provides a quick overview of key dimension tables 
to understand customer distribution and the structure of the 
product catalog. */

--DISTINCT CUSTOMER COUNTRIES 
SELECT DISTINCT 
    country
FROM gold.dim_customers;

-- PRODUCT CATEGORY & SUBCATEGORY STRUCTURE
SELECT DISTINCT 
      category,
      subcategory,
      product_name
FROM gold.dim_products
ORDER BY category, subcategory, product_name;
