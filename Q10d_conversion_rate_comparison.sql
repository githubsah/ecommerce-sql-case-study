-- =====================================================
-- Q10d: Conversion Rate by Device
-- Objective: Compare conversion efficiency by device type
-- =====================================================

SELECT
    ws.device_type,
    COUNT(DISTINCT ws.website_session_id) AS total_sessions,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(
        COUNT(DISTINCT o.order_id)
        / COUNT(DISTINCT ws.website_session_id) * 100,
        2
    ) AS conversion_rate_pct
FROM website_sessions ws
LEFT JOIN orders o
    ON ws.website_session_id = o.website_session_id
GROUP BY ws.device_type;
