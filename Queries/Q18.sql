-- 18. Calculate the percentage of customers who have made more than one purchase to evaluate customer retention and loyalty.

WITH customer_orders AS (
SELECT customer_id,
       COUNT(order_id) AS total_orders
FROM orders 
WHERE status = 'completed'
GROUP BY customer_id
),

summary AS(
SELECT COUNT(*) AS total_customers,
       COUNT(*) FILTER (WHERE total_orders >= 2) AS repeat_customers,
       COUNT(*) FILTER (WHERE total_orders = 1) AS one_time_customers
FROM customer_orders
)

SELECT total_customers,
       repeat_customers,
	   one_time_customers,
	   ROUND((repeat_customers * 100.0 / total_customers),2) AS repeat_customers_rate_percent
FROM summary;