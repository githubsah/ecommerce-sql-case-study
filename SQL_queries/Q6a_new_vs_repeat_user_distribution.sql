-- =====================================================
-- Q6a: New vs Repeat User Distribution
-- Objective: Classify users as new or repeat based on order history
-- =====================================================

SELECT
    user_type,
    COUNT(*) AS total_users
FROM (
    SELECT
        user_id,
        CASE
            WHEN COUNT(order_id) = 1 THEN 'New User'
            ELSE 'Repeat User'
        END AS user_type
    FROM orders
    GROUP BY user_id
) user_classification
GROUP BY user_type;
