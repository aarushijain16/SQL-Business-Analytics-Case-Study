-- 1. Identify the top 3 products in each category based on total revenue.

WITH product_revenue AS (
    SELECT 
        p.product_id,
        p.product_name,
        p.category,
        SUM(oi.revenue) AS total_revenue
    FROM products p
    JOIN order_items oi
        ON p.product_id = oi.product_id
    GROUP BY p.product_id, p.product_name, p.category
),

ranked_products AS (
    SELECT 
        product_id,
        product_name,
        category,
        total_revenue,
        ROW_NUMBER() OVER (
            PARTITION BY category 
            ORDER BY total_revenue DESC
        ) AS rank
    FROM product_revenue
)

SELECT 
    product_id,
    product_name,
    category,
    total_revenue,
    rank
FROM ranked_products
WHERE rank <= 3;

