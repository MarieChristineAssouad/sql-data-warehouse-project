/*
This SQL script performs basic exploratory analysis on customer and product dimension tables. 
It helps identify the geographic diversity of customers and understand the structure of the product catalog before deeper analytics or modeling work.

What This Script Does

**1. Customer Geography Exploration**

Retrieves all distinct countries where customers originate.

Useful for understanding market reach, regional segmentation, and potential localization needs.


**2. Product Category Exploration**

Extracts all unique combinations of:

- Category
- Subcategory
- Product name

Shows the major divisions and structure of the product catalog.
Results are ordered for easier inspection.
- Tables Used
- gold_dim_customers
- gold_dim_products
*/

--	Explore all countries our customers come from
SELECT DISTINCT country 
FROM gold.dim_customers

--Explore all categories "the major divisions'
SELECT DISTINCT category, subcategory, product_name
FROM gold.dim_products
ORDER BY 1,2,3
