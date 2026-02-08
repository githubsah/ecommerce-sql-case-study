-- =====================================================
-- Q5c: Profitability per Product
-- Objective: Identify products contributing the most profit
-- =====================================================

SELECT
    p.product_name,
    ROUND(SUM(oi.price_usd) - SUM(oi.cogs_usd), 2) AS total_profit
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_profit DESC;
