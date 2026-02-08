-- =====================================================
-- Q2a: Most Visited Pages
-- Objective: Identify pages with the highest overall user engagement
-- =====================================================

SELECT
    pageview_url,
    COUNT(*) AS total_pageviews
FROM website_pageviews
GROUP BY pageview_url
ORDER BY total_pageviews DESC;
