-- =====================================================
-- Q9b: Monthly Orders
-- Objective: Analyze how customer orders change month by month
-- =====================================================

SELECT
    YEAR(created_at) AS year,
    MONTH(created_at) AS month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY YEAR(created_at), MONTH(created_at)
ORDER BY year, month;
