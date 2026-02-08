-- =====================================================
-- Q2c: Top Landing Pages
-- Objective: Identify the most common entry pages for user sessions
-- =====================================================

SELECT
    wp.pageview_url AS landing_page,
    COUNT(*) AS total_sessions
FROM website_pageviews wp
JOIN (
    SELECT
        website_session_id,
        MIN(website_pageview_id) AS first_pageview_id
    FROM website_pageviews
    GROUP BY website_session_id
) first_page
    ON wp.website_pageview_id = first_page.first_pageview_id
GROUP BY wp.pageview_url
ORDER BY total_sessions DESC;
