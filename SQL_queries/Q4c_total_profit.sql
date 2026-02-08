-- =====================================================
-- Q4c: Total Profit
-- Objective: Calculate total revenue, total COGS, and total profit
-- =====================================================

SELECT
    ROUND(SUM(price_usd), 2) AS total_revenue,
    ROUND(SUM(cogs_usd), 2) AS total_cogs,
    ROUND(SUM(price_usd) - SUM(cogs_usd), 2) AS total_profit
FROM order_items;
