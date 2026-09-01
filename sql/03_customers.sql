-- ====================================================================
-- Milestone 4: Customer Segmentation & Concentration
-- File: sql/03_customers.sql
-- ====================================================================

SET search_path TO ecom;

-- 1. Customer Lifetime Aggregations & Tiering
WITH customer_summary AS (
    SELECT
        c.customer_id,
        COUNT(DISTINCT o.order_id) AS total_orders,
        COALESCE(SUM(oi.unit_price), 0) AS lifetime_spend
    FROM ecom.customers c
    LEFT JOIN ecom.orders o ON c.customer_id = o.customer_id
    LEFT JOIN ecom.order_items oi ON o.order_id = oi.order_id
    GROUP BY c.customer_id
)
SELECT
    CASE
        WHEN total_orders = 1 THEN '1. One-Time Buyer'
        WHEN total_orders BETWEEN 2 AND 4 THEN '2. Repeat Buyer (2-4)'
        WHEN total_orders >= 5 THEN '3. VIP Buyer (5+)'
        ELSE '0. Inactive / No Orders'
    END AS customer_segment,
    COUNT(*) AS customer_count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER(), 1) AS pct_customers,
    ROUND(SUM(lifetime_spend)::NUMERIC, 2) AS total_revenue,
    ROUND(100.0 * SUM(lifetime_spend) / SUM(SUM(lifetime_spend)) OVER(), 1) AS pct_revenue,
    ROUND(AVG(lifetime_spend)::NUMERIC, 2) AS avg_customer_spend
FROM customer_summary
GROUP BY 1
ORDER BY 1;