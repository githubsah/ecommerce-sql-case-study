-- =====================================================
-- Q6b: Order Rate Comparison
-- Objective: Compare average number of orders per user
--            between new and repeat users
-- =====================================================

SELECT
    user_type,
    ROUND(AVG(order_count), 2) AS avg_orders_per_user
FROM (
    SELECT
        user_id,
        COUNT(order_id) AS order_count,
        CASE
            WHEN COUNT(order_id) = 1 THEN 'New User'
            ELSE 'Repeat User'
        END AS user_type
    FROM orders
    GROUP BY user_id
) user_orders
GROUP BY user_type;
