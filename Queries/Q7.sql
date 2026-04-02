-- 7. Identify customers who made repeat purchases and calculate the average time between their orders.

WITH aggregate_customer AS (
SELECT customer_id,
       COUNT(order_id) AS total_orders,
       MIN(order_date) AS first_order,
	   MAX(order_date) AS last_order
FROM orders 
WHERE status = 'completed'
GROUP BY customer_id
)

SELECT customer_id,
       last_order,
       first_order,
	   total_orders,
	   ROUND((last_order- first_order)::numeric / NULLIF(total_orders - 1,0), 2) AS avg_days_between_orders
FROM aggregate_customer
WHERE total_orders > 1
ORDER BY avg_days_between_orders;