-- 5. Analyze customer retention by cohort:

-- For each cohort (month of first order), calculate how many customers:

-- Ordered in the same month
-- Came back in later months

WITH cohort AS (
SELECT customer_id, 
       DATE_TRUNC('month', MIN(order_date))::date AS cohort_month
FROM orders 
GROUP BY customer_id
),
customer_activity AS (
SELECT o.customer_id,
       c.cohort_month, 
	   DATE_TRUNC('month', order_date)::date AS order_month
FROM orders o 
JOIN cohort c 
ON o.customer_id = c.customer_id
)

SELECT cohort_month,
       order_month,
	   COUNT(DISTINCT customer_id) AS active_customers
FROM customer_activity 
GROUP BY cohort_month, order_month
ORDER BY cohort_month, order_month;