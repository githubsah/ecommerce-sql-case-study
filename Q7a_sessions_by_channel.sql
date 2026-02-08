-- =====================================================
-- Q7a: Sessions by Channel (UTM Source)
-- Objective: Identify which marketing channels drive the most traffic
-- =====================================================

SELECT
    utm_source,
    COUNT(DISTINCT website_session_id) AS total_sessions
FROM website_sessions
WHERE utm_source IS NOT NULL
GROUP BY utm_source
ORDER BY total_sessions DESC;
