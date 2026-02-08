-- =====================================================
-- Q3c: Step-by-Step Funnel Conversion Rates
-- Objective: Measure conversion efficiency between funnel stages
-- =====================================================

SELECT
    sessions,
    product_views,
    cart_views,
    checkout_views,
    orders,

    ROUND(product_views / sessions * 100, 2) AS session_to_product_view_rate,
    ROUND(cart_views / product_views * 100, 2) AS product_view_to_cart_rate,
    ROUND(checkout_views / cart_views * 100, 2) AS cart_to_checkout_rate,
    ROUND(orders / checkout_views * 100, 2) AS checkout_to_order_rate

FROM (
    SELECT
        COUNT(DISTINCT ws.website_session_id) AS sessions,

        COUNT(DISTINCT CASE
            WHEN wp.pageview_url LIKE '/products%'
            THEN ws.website_session_id
        END) AS product_views,

        COUNT(DISTINCT CASE
            WHEN wp.pageview_url = '/cart'
            THEN ws.website_session_id
        END) AS cart_views,

        COUNT(DISTINCT CASE
            WHEN wp.pageview_url IN ('/shipping', '/billing', '/billing-2')
            THEN ws.website_session_id
        END) AS checkout_views,

        COUNT(DISTINCT o.order_id) AS orders
    FROM website_sessions ws
    LEFT JOIN website_pageviews wp
        ON ws.website_session_id = wp.website_session_id
    LEFT JOIN orders o
        ON ws.website_session_id = o.website_session_id
) funnel_counts;
