-- =====================================================
-- Q1: Total Website Sessions & Daily Traffic Trend
-- Objective: Analyze daily website sessions over time
-- =====================================================

SELECT
    DATE(created_at) AS session_date,
    COUNT(*) AS total_sessions
FROM website_sessions
GROUP BY DATE(created_at)
ORDER BY session_date;
