-- =====================================================
-- Q3a: Overall Session → Order Conversion Rate
-- Objective: Measure how effectively sessions convert into orders
-- =====================================================

SELECT
    COUNT(DISTINCT ws.website_session_id) AS total_sessions,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(
        COUNT(DISTINCT o.order_id)
        / COUNT(DISTINCT ws.website_session_id) * 100,
        2
    ) AS session_to_order_conversion_rate
FROM website_sessions ws
LEFT JOIN orders o
    ON ws.website_session_id = o.website_session_id;
