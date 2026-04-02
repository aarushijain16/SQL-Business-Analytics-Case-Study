-- 9 Segment customers based on Recency, Frequency, and Monetary (RFM) analysis to identify high-value, loyal, and at-risk customers.


WITH customer_rfm AS (
SELECT o.customer_id,
       MAX(o.order_date) AS last_order,
	   COUNT(o.order_id) AS frequency,
	   SUM(oi.quantity) AS monetary
FROM orders o
JOIN order_items oi 
ON o.order_id = oi.order_id
WHERE o.status = 'completed'
GROUP BY o.customer_id
)

SELECT customer_id,
       MAX(last_order) OVER() - last_order AS recency,
	   frequency,
	   monetary,
	   CASE 
	       WHEN frequency >= 3 AND monetary >= 3000 THEN 'High Value'
		   WHEN MAX(last_order) OVER() - last_order > 30 THEN 'At Risk'
		   ELSE 'Regular'
	   END AS segment
FROM customer_rfm;