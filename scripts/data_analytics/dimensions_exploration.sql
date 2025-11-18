/* 
===============================================================
               DIMENSIONS EXPLORATION SCRIPT
===============================================================

This script provides a quick overview of key dimension tables 
to understand customer distribution and the structure of the 
product catalog. I typically run these checks early in a project 
to confirm available attributes and validate the quality of 
dimension data before building analytics or modeling pipelines.

---------------------------------------------------------------
          1. CUSTOMER GEOGRAPHY EXPLORATION
---------------------------------------------------------------

Returns all distinct customer countries.  
This helps reveal geographic reach, regional patterns, and 
potential segmentation opportunities.
*/

/* 
============================================================
               DISTINCT CUSTOMER COUNTRIES
============================================================ */
SELECT DISTINCT 
    country
FROM gold.dim_customers;

/* 
============================================================
         PRODUCT CATEGORY & SUBCATEGORY STRUCTURE
============================================================ */
/*
This section extracts the unique combinations of:
  - Category
  - Subcategory
  - Product name

It gives a clear view of the major groupings in the product 
catalog and is useful for verifying hierarchy consistency.
*/

SELECT DISTINCT 
      category,
      subcategory,
      product_name
FROM gold.dim_products
ORDER BY category, subcategory, product_name;
