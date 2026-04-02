-- 11. Calculate the Customer Lifetime Value (CLTV) by estimating the total revenue generated per customer along with their average order value and purchase frequency.

WITH customer_metrics AS (

    SELECT 
        o.customer_id,
        COUNT(DISTINCT o.order_id) AS total_orders,
        SUM(oi.revenue) AS total_revenue

    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id

    WHERE status = 'completed'

    GROUP BY o.customer_id
)

SELECT 
    customer_id,
    total_orders,
    total_revenue,
    ROUND((total_revenue::numeric / total_orders),2) AS avg_order_value,
    total_revenue AS cltv,
	ROW_NUMBER() OVER (ORDER BY total_revenue DESC) AS rank,
	CASE
	     WHEN total_revenue >= 5000 THEN 'High Value'
		 WHEN total_revenue >= 2000 THEN 'Medium Value'
		 ELSE 'Low Value'
	END AS segment

FROM customer_metrics;