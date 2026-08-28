-- 1. List all tables in the schema
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'ecom';
-- 2. Inspect sample records from core tables
Select * from ecom.orders LIMIT 10;
Select * from ecom.customers LIMIT 10;
Select * from ecom.order_items LIMIT 10;
Select * from ecom.products LIMIT 10;
SELECT * from ecom.product_variants LIMIT 10;
SELECT * from ecom.categories LIMIT 10;
-- 3. High-level metrics: customer count, order count, and timeline
SELECT 
    COUNT(DISTINCT customer_id) AS total_customers,
    COUNT(DISTINCT order_id) AS total_orders,
    MIN(created_at) AS earliest_order,
    MAX(created_at) AS latest_order,
    SUM(total) AS total_revenue

FROM 
    ecom.orders;
-- 4. Top 10 high selling products
Select p.product_id, p.product_name,COUNT(oi.qty) AS quantity, SUM(o.total) AS total_price 
FROM ecom.products p
JOIN ecom.product_variants pv 
ON p.product_id = pv.product_id
JOIN ecom.order_items oi 
ON pv.variant_id = oi.variant_id
JOIN ecom.orders o
ON oi.order_id = o.order_id
GROUP BY p.product_id
ORDER BY total_price DESC
LIMIT 10;