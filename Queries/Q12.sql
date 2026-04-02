-- 12. Identify stockout risk and overstock situations by calculating how many days current inventory can sustain based on average daily sales.Identify stockout risk and overstock situations by calculating how many days current inventory can sustain based on average daily sales.Identify stockout risk and overstock situations by calculating how many days current inventory can sustain based on average daily sales.


WITH sales_data AS (
SELECT oi.product_id, 
       SUM(oi.quantity) AS total_units_sold,
	   MAX(o.order_date) - MIN(o.order_date) AS selling_days
FROM order_items oi
JOIN orders o 
ON oi.order_id = o.order_id
WHERE o.status = 'completed'
GROUP BY oi.product_id
),
inventory_calc AS (
SELECT product_id,
       total_units_sold,
	   selling_days,
	   ROUND(total_units_sold::numeric / NULLIF(selling_days,0),2) AS avg_daily_sales,
	   (product_id * 0.02) AS current_stock
FROM sales_data
)
SELECT product_id,
       avg_daily_sales,
	   current_stock,
	   current_stock / NULLIF(avg_daily_sales, 0) AS days_left,
	   CASE 
	       WHEN current_stock / NULLIF(avg_daily_sales, 0) < 7 THEN 'Stockout Risk'
		   WHEN current_stock / NULLIF(avg_daily_sales, 0) BETWEEN 7 AND 30 THEN 'Healthy'
		   ELSE 'Overstock'
		END AS stock_status
FROM inventory_calc;