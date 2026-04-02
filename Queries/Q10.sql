-- 10. Identify pairs of products that are frequently purchased together in the same order.

WITH pairs AS (

    SELECT 
        oi1.order_id,
        oi1.product_id AS product_1,
        oi2.product_id AS product_2

    FROM order_items oi1
    JOIN order_items oi2
        ON oi1.order_id= oi2.order_id
       AND oi1.product_id < oi2.product_id

)

SELECT 
    pr.product_1,
    p1.product_name AS product_1_name,
    pr.product_2,
    p2.product_name AS product_2_name,
    COUNT(*) AS frequency

FROM pairs pr
JOIN products p1 
    ON pr.product_1 = p1.product_id
JOIN products p2 
    ON pr.product_2 = p2.product_id

GROUP BY pr.product_1, pr.product_2, p1.product_name , p2.product_name
ORDER BY frequency DESC;