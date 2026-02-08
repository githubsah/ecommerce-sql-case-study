-- =====================================================
-- Q6c: Revenue Comparison (New vs Repeat Users)
-- Objective: Compare average revenue per user by user type
-- =====================================================

SELECT
    user_type,
    ROUND(AVG(total_revenue), 2) AS avg_revenue_per_user
FROM (
    SELECT
        o.user_id,
        SUM(oi.price_usd) AS total_revenue,
        CASE
            WHEN COUNT(o.order_id) = 1 THEN 'New User'
            ELSE 'Repeat User'
        END AS user_type
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY o.user_id
) user_revenue
GROUP BY user_type;
