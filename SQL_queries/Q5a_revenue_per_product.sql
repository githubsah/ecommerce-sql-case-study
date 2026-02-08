-- =====================================================
-- Q5a: Revenue per Product
-- Objective: Identify products generating the highest revenue
-- =====================================================

SELECT
    p.product_name,
    ROUND(SUM(oi.price_usd), 2) AS total_revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC;
