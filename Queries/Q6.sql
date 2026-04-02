-- 6. Calculate the monthly cohort retention percentage by tracking how many customers return in subsequent months after their first purchase.

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
),

retained_customers AS (
SELECT cohort_month,
       order_month,
	   COUNT(DISTINCT customer_id) AS active_customers
FROM customer_activity 
GROUP BY cohort_month, order_month
ORDER BY cohort_month, order_month
),

cohort_size AS (
SELECT cohort_month,
       COUNT(DISTINCT customer_id) AS c_size
FROM cohort
GROUP BY cohort_month
)

SELECT r.cohort_month, 
       r.order_month,
	   r.active_customers,
	   cs.c_size,
	   ROUND((r.active_customers * 100.0 / cs.c_size), 2) AS retention_percentage
FROM retained_customers r
JOIN cohort_size cs 
ON r.cohort_month = cs.cohort_month
ORDER BY r.cohort_month, r.order_month;