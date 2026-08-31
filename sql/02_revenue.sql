-- ====================================================================
-- Milestone 3: Revenue Trajectory, AOV, and Growth Dynamics
-- File: sql/02_revenue.sql
-- ====================================================================

SET search_path TO ecom;

-- 1. Total Platform Lifetime Revenue & Metrics
SELECT 
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.qty * oi.unit_price)::NUMERIC, 2) AS lifetime_revenue,
    ROUND((SUM(oi.qty * oi.unit_price) / COUNT(DISTINCT o.order_id))::NUMERIC, 2) AS overall_aov
FROM ecom.orders o
JOIN ecom.order_items oi ON o.order_id = oi.order_id
WHERE o.payment_status = 'paid';

-- 2. Monthly Revenue, Completed Order Volume, and AOV Series
SELECT
    DATE_TRUNC('month', o.created_at)::DATE AS sales_month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.qty * oi.unit_price)::NUMERIC, 2) AS monthly_revenue,
    ROUND((SUM(oi.qty * oi.unit_price) / COUNT(DISTINCT o.order_id))::NUMERIC, 2) AS average_order_value
FROM ecom.orders o
JOIN ecom.order_items oi ON o.order_id = oi.order_id
WHERE o.payment_status = 'paid'
GROUP BY 1
ORDER BY 1;

-- 3. Annual Aggregate Performance & YoY Metrics
SELECT
    EXTRACT(YEAR FROM o.created_at) AS sales_year,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.qty * oi.unit_price)::NUMERIC, 2) AS annual_revenue,
    ROUND((SUM(oi.qty * oi.unit_price) / COUNT(DISTINCT o.order_id))::NUMERIC, 2) AS average_order_value
FROM ecom.orders o
JOIN ecom.order_items oi ON o.order_id = oi.order_id
WHERE o.payment_status = 'paid'
GROUP BY 1
ORDER BY 1;