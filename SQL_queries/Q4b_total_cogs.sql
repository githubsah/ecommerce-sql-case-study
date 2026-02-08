-- =====================================================
-- Q4b: Total Cost of Goods Sold (COGS)
-- Objective: Calculate total cost incurred to fulfill orders
-- =====================================================

SELECT
    ROUND(SUM(cogs_usd), 2) AS total_cogs
FROM order_items;
