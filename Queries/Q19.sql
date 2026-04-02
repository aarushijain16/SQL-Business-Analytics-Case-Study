-- 19. Analyze average order size in terms of quantity and revenue to understand purchasing behavior and identify opportunities for upselling and cross-selling.

WITH order_summary AS (
SELECT order_id,
       SUM(quantity) AS total_items,
	   SUM(revenue) AS total_order_value
FROM order_items
GROUP BY order_id
)

SELECT COUNT(*) AS total_orders,
       ROUND(AVG(total_items)::numeric,2) AS avg_items_per_order,
       ROUND(AVG(total_order_value)::numeric,2) AS avg_order_value
FROM order_summary;

-- Behaviour Segmentation

WITH order_summary AS (
SELECT order_id,
       SUM(quantity) AS total_items,
	   SUM(revenue) AS total_order_value
FROM order_items
GROUP BY order_id
)

SELECT CASE 
           WHEN total_items = 1 THEN 'Single Item'
		   WHEN total_items BETWEEN 2 AND 3 THEN ' Small Basket'
		   ELSE 'Big Basket'
		END AS basket_type,
		COUNT(*) AS order_count
FROM order_summary
GROUP BY basket_type
ORDER BY order_count DESC;