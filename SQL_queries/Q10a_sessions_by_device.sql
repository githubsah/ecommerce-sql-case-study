-- =====================================================
-- Q10a: Sessions by Device
-- Objective: Compare traffic volume by device type
-- =====================================================

SELECT
    device_type,
    COUNT(DISTINCT website_session_id) AS total_sessions
FROM website_sessions
GROUP BY device_type;
