-- =====================================================
-- Q7b: Orders by Channel (UTM Source)
-- Objective: Identify which marketing channels generate the most orders
-- =====================================================

SELECT
    ws.utm_source,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM website_sessions ws
LEFT JOIN orders o
    ON ws.website_session_id = o.website_session_id
WHERE ws.utm_source IS NOT NULL
GROUP BY ws.utm_source
ORDER BY total_orders DESC;
