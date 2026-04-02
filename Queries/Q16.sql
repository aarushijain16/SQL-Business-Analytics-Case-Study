-- 16. Identify each customer’s most frequently purchased product category to enable personalized recommendations.

WITH customer_category AS (
SELECT o.customer_id,
       p.category,
	   SUM(oi.quantity) AS purchase_count
FROM orders o
JOIN order_items oi 
ON o.order_id = oi.order_id
JOIN products p 
ON oi.product_id = p.product_id
WHERE o.status = 'completed'
GROUP BY o.customer_id, p.category
),
ranked AS (
SELECT customer_id,
       category,
	   purchase_count,
	   ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY purchase_count DESC) AS rank
FROM customer_category
)

SELECT customer_id,
       category AS favourite_category,
	   purchase_count
FROM ranked
WHERE rank = 1;