-- =====================================================
-- Q9d: Monthly Conversion Rate
-- Objective: Measure how efficiently sessions convert into orders month by month
-- =====================================================

SELECT
    s.year,
    s.month,
    s.total_sessions,
    o.total_orders,
    ROUND(o.total_orders / s.total_sessions * 100, 2) AS conversion_rate_pct
FROM (
    SELECT
        YEAR(created_at) AS year,
        MONTH(created_at) AS month,
        COUNT(*) AS total_sessions
    FROM website_sessions
    GROUP BY YEAR(created_at), MONTH(created_at)
) s
JOIN (
    SELECT
        YEAR(created_at) AS year,
        MONTH(created_at) AS month,
        COUNT(*) AS total_orders
    FROM orders
    GROUP BY YEAR(created_at), MONTH(created_at)
) o
    ON s.year = o.year
   AND s.month = o.month
ORDER BY s.year, s.month;
