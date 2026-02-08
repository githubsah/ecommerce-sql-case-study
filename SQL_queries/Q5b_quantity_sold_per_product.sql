-- =====================================================
-- Q5b: Quantity Sold per Product
-- Objective: Determine which products sell the highest number of units
-- =====================================================

SELECT
    p.product_name,
    COUNT(*) AS quantity_sold
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY quantity_sold DESC;
