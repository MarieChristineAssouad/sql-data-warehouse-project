/* 
===============================================================
                CUSTOMER SEGMENTATION BY VALUE
===============================================================

This query:
  - Aggregates each customer's total spending and lifespan 
    (months between first and last order)
  - Segments customers into:
        - 'VIP'     -> lifespan >= 12 AND total_spending > 5000
        - 'Regular' -> lifespan >= 12 AND total_spending <= 5000
        - 'New'     -> all others
  - Counts how many customers fall into each segment
*/
/*
============================================================
           AGGREGATE CUSTOMER SPENDING & LIFESPAN
============================================================ */
WITH customer_spending AS (
    SELECT 
        c.customer_key,
        SUM(f.sales_amount) AS total_spending,
        MIN(f.order_date)   AS first_order,
        MAX(f.order_date)   AS last_order,
        DATEDIFF(MONTH, MIN(f.order_date), MAX(f.order_date)) AS lifespan
    FROM gold.fact_sales f
    LEFT JOIN gold.dim_customers c
        ON c.customer_key = f.customer_key
    WHERE f.order_date IS NOT NULL
    GROUP BY c.customer_key
)
/* 
============================================================
               ASSIGN CUSTOMER SEGMENTS
============================================================ */
SELECT
    customer_segment,
    COUNT(customer_key) AS total_customers
FROM (
    SELECT
        customer_key,
        CASE
            WHEN lifespan >= 12 AND total_spending > 5000  THEN 'VIP'
            WHEN lifespan >= 12 AND total_spending <= 5000 THEN 'Regular'
            ELSE 'New'
        END AS customer_segment
    FROM customer_spending
) t
GROUP BY
    customer_segment
ORDER BY
    total_customers DESC;
