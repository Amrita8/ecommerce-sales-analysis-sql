-- 1. List all tables in the schema
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public';
-- 2. Inspect sample records from core tables
Select * from ecom.orders LIMIT 10;
Select * from ecom.customers LIMIT 10;
Select * from ecom.order_items LIMIT 10;
Select * from ecom.products LIMIT 10;
-- 3. High-level metrics: customer count, order count, and timeline
SELECT 
    COUNT(DISTINCT customer_id) AS total_customers,
    COUNT(DISTINCT order_id) AS total_orders,
    MIN(created_at) AS earliest_order,
    MAX(created_at) AS latest_order
FROM 
    ecom.orders;
