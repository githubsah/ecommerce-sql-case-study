-- =====================================================
-- Q7d: Conversion Rate by Channel (UTM Source)
-- Objective: Compare conversion efficiency across marketing channels
-- =====================================================

SELECT
    ws.utm_source,
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(DISTINCT ws.website_session_id) AS total_sessions,
    ROUND(
        COUNT(DISTINCT o.order_id) * 1.0
        / COUNT(DISTINCT ws.website_session_id),
        4
    ) AS conversion_rate
FROM website_sessions ws
LEFT JOIN orders o
    ON ws.website_session_id = o.website_session_id
WHERE ws.utm_source IS NOT NULL
GROUP BY ws.utm_source
ORDER BY conversion_rate DESC;
