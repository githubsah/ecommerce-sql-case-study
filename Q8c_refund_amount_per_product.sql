-- =====================================================
-- Q8c: Refund Amount per Product
-- Objective: Identify products causing the highest monetary loss due to refunds
-- =====================================================

SELECT
    p.product_name,
    ROUND(SUM(r.refund_amount_usd), 2) AS total_refund_amount
FROM order_item_refunds r
JOIN order_items oi
    ON r.order_item_id = oi.order_item_id
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_refund_amount DESC;
