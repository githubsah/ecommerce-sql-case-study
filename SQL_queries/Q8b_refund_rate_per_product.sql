-- =====================================================
-- Q8b: Refund Rate per Product
-- Objective: Identify products with the highest refund rates
-- =====================================================

SELECT
    p.product_name,
    COUNT(DISTINCT r.order_item_id) AS refunded_items,
    COUNT(DISTINCT oi.order_item_id) AS total_items_sold,
    ROUND(
        COUNT(DISTINCT r.order_item_id)
        / COUNT(DISTINCT oi.order_item_id) * 100,
        2
    ) AS refund_rate_pct
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
LEFT JOIN order_item_refunds r
    ON oi.order_item_id = r.order_item_id
GROUP BY p.product_name
ORDER BY refund_rate_pct DESC;
