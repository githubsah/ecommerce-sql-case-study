-- =====================================================
-- Q2b: Average Pageviews per Session
-- Objective: Measure how deeply users engage per visit
-- =====================================================

SELECT
    ROUND(
        COUNT(wp.website_pageview_id) 
        / COUNT(DISTINCT ws.website_session_id),
        2
    ) AS avg_pageviews_per_session
FROM website_sessions ws
LEFT JOIN website_pageviews wp
    ON ws.website_session_id = wp.website_session_id;
