-- =====================================================
-- Q8a: Total Revenue Lost Due to Refunds
-- Objective: Calculate total revenue lost because of refunded items
-- =====================================================

SELECT
    ROUND(SUM(r.refund_amount_usd), 2) AS total_refund_amount
FROM order_item_refunds r
JOIN order_items oi
    ON r.order_item_id = oi.order_item_id;
