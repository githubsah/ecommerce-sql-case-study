-- =====================================================
-- Q9c: Monthly Revenue
-- Objective: Analyze how total revenue changes month by month
-- =====================================================

SELECT
    YEAR(o.created_at) AS year,
    MONTH(o.created_at) AS month,
    ROUND(SUM(oi.price_usd), 2) AS total_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY YEAR(o.created_at), MONTH(o.created_at)
ORDER BY year, month;
