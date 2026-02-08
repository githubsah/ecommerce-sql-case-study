-- =====================================================
-- Q3b: Funnel Drop-Off Analysis
-- Objective: Identify where users drop off in the purchase funnel
-- =====================================================

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
    ON ws.website_session_id = o.website_session_id;
