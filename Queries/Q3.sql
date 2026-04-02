-- 3. Identify the top 3 customers based on total revenue generated.


WITH revenue_per_customer_cte AS(
SELECT c.customer_id,
       c.customer_name,
	   SUM(oi.revenue) AS total_revenue
FROM customers c
JOIN orders o 
ON c.customer_id = o.customer_id
JOIN order_items oi 
ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name
),

rank_of_customers_cte AS (
SELECT customer_id,
       customer_name,
	   total_revenue,
	   ROW_NUMBER() OVER (ORDER BY total_revenue DESC, customer_id) as rank 
FROM revenue_per_customer_cte
)

SELECT customer_id,
       customer_name,
	   total_revenue,
	   rank
FROM rank_of_customers_cte
WHERE rank <= 3;
