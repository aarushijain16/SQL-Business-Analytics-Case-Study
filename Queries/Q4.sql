-- 4. Identify repeat customers — customers who placed more than one order.

SELECT * FROM customers;
SELECT * FROM orders;

WITH no_of_orders_cte AS(
SELECT c.customer_id,
       c.customer_name,
       COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) > 1
)

SELECT customer_id,
       customer_name,
       total_orders
FROM no_of_orders_cte;


-- 4.1 % of Repeated Customers 

WITH customer_orders AS (
    SELECT 
        customer_id,
        COUNT(order_id) AS total_orders
    FROM orders
    GROUP BY customer_id
)

SELECT 
    ROUND(
        SUM(CASE WHEN total_orders > 1 THEN 1 ELSE 0 END) * 100.0 
        / COUNT(*),
        2
    ) AS repeat_customer_percentage
FROM customer_orders;