-- 14. Identify customers who are likely to churn by analyzing their purchase inactivity compared to their historical buying frequency.

WITH customer_orders AS (
SELECT o.customer_id,
       MIN(o.order_date) AS first_order,
	   MAX(o.order_date) AS last_order,
	   COUNT(o.order_id) AS total_orders
FROM orders o
WHERE o.status = 'completed'
GROUP BY o.customer_id
),

customer_gap AS (
SELECT customer_id,
       first_order,
	   last_order,
	   total_orders,
	   (last_order - first_order) / NULLIF(total_orders - 1,0) AS avg_days_between_orders
FROM customer_orders
),

final AS (
SELECT customer_id,
       total_orders,
       avg_days_between_orders,
	   MAX(last_order) OVER() - last_order AS current_gap
FROM customer_gap
)
SELECT customer_id,
       total_orders,
       avg_days_between_orders,
	   current_gap AS days_since_last_order,
	   CASE
	       WHEN total_orders = 1 THEN 'New Customer'
		   WHEN current_gap > avg_days_between_orders * 2 THEN 'High Risk'
		   WHEN current_gap > avg_days_between_orders THEN 'At Risk'
		   ELSE 'Active'
		END AS churn_risk
FROM final;