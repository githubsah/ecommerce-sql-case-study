-- =====================================================
-- Q9a: Monthly Website Sessions
-- Objective: Analyze monthly website traffic trends over time
-- =====================================================

SELECT
    YEAR(created_at) AS year,
    MONTH(created_at) AS month,
    COUNT(*) AS total_sessions
FROM website_sessions
GROUP BY YEAR(created_at), MONTH(created_at)
ORDER BY year, month;
