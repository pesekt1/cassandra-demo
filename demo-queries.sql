-- Query Examples: Cassandra vs MySQL
-- Each example below demonstrates how Cassandra's data model enables fast, simple queries
-- compared to the JOIN-heavy, index-dependent queries in MySQL.
-- 1. Get all orders for a given customer
-- Cassandra query:
-- This is extremely fast in Cassandra because 'customer_id' is the partition key.
-- All data for a customer is stored together, so Cassandra can retrieve it in a single partition scan.
SELECT *
FROM orders_by_customer
WHERE customer_id = 7;
-- MySQL query:
-- Requires multiple JOINs across orders, customers, order_items, products, statuses, and shippers.
-- Relational databases must scan and join several tables, which is slower for large datasets.
SELECT c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    o.order_id,
    o.order_date,
    os.name AS status,
    s.name AS shipper_name,
    p.product_id,
    p.name AS product_name,
    oi.quantity,
    oi.unit_price
FROM orders o
    JOIN customers c ON o.customer_id = c.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    JOIN order_statuses os ON o.status = os.order_status_id
    LEFT JOIN shippers s ON o.shipper_id = s.shipper_id
WHERE c.customer_id = 7;
-- 2. Get all orders containing a given product
-- Cassandra query:
-- 'product_id' is the partition key, so Cassandra can instantly retrieve all orders for a product.
SELECT *
FROM orders_by_product
WHERE product_id = 4;
-- MySQL query:
-- Requires JOINs between order_items, products, orders, and customers.
-- Relational databases must scan order_items and join with other tables, which is slower.
SELECT p.product_id,
    p.name AS product_name,
    o.order_id,
    o.order_date,
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    oi.quantity,
    oi.unit_price
FROM order_items oi
    JOIN products p ON oi.product_id = p.product_id
    JOIN orders o ON oi.order_id = o.order_id
    JOIN customers c ON o.customer_id = c.customer_id
WHERE p.product_id = 4;
-- 3. Get all products for a specific order of a customer
-- Cassandra query:
-- Uses both partition key (customer_id) and clustering key (order_id).
-- Data is modeled so all products for an order are stored together, making this query very efficient.
SELECT *
FROM orders_by_customer
WHERE customer_id = 7
    AND order_id = 2;
-- MySQL query:
-- Must filter order_items by order_id and check that the order belongs to the customer.
-- Requires a subquery and JOIN, which is more complex and less efficient.
SELECT oi.order_id,
    p.product_id,
    p.name AS product_name,
    oi.quantity,
    oi.unit_price
FROM order_items oi
    JOIN products p ON oi.product_id = p.product_id
WHERE oi.order_id = 2
    AND oi.order_id IN (
        SELECT order_id
        FROM orders
        WHERE customer_id = 7
    );
-- 4. Get all orders for a customer in a date range
-- Cassandra query:
-- Efficient because all orders for a customer are stored in the same partition.
-- Filtering by order_id (assuming it is time-based or sequential) is fast.
SELECT *
FROM orders_by_customer
WHERE customer_id = 10
    AND order_id >= 6
    AND order_id <= 10;
-- MySQL query:
-- Must scan orders table and filter by customer and date range, possibly using indexes.
-- Still slower for large datasets due to table scans and JOINs.
SELECT o.order_id,
    o.order_date,
    os.name AS status,
    s.name AS shipper_name
FROM orders o
    JOIN order_statuses os ON o.status = os.order_status_id
    LEFT JOIN shippers s ON o.shipper_id = s.shipper_id
WHERE o.customer_id = 10
    AND o.order_date BETWEEN '2018-11-18' AND '2019-05-01';
-- 5. Get all customers who ordered a specific product
-- Cassandra query:
-- Directly retrieves customer info from the denormalized orders_by_product table.
-- No JOINs required; very fast.
SELECT customer_id,
    customer_name
FROM orders_by_product
WHERE product_id = 4;
-- MySQL query:
-- Requires DISTINCT and multiple JOINs to get unique customers for a product.
SELECT DISTINCT c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name
FROM order_items oi
    JOIN orders o ON oi.order_id = o.order_id
    JOIN customers c ON o.customer_id = c.customer_id
WHERE oi.product_id = 4;
-- 6. Get all orders for a product in a date range
-- Cassandra query:
-- Efficient because all orders for a product are stored in the same partition.
-- Filtering by order_id (if sequential) is fast.
SELECT *
FROM orders_by_product
WHERE product_id = 3
    AND order_id >= 6
    AND order_id <= 11;
-- MySQL query:
-- Must scan order_items and join with orders and customers, then filter by date range.
SELECT o.order_id,
    o.order_date,
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name
FROM order_items oi
    JOIN orders o ON oi.order_id = o.order_id
    JOIN customers c ON o.customer_id = c.customer_id
WHERE oi.product_id = 3
    AND o.order_date BETWEEN '2018-11-18' AND '2019-05-15';
-- Note: Aggregations (SUM, COUNT, AVG) are not Cassandra's strength; use Spark or other tools for analytics.
-- Summary:
-- Cassandra queries are fast and simple because the data model is designed for the access patterns.
-- No JOINs are needed; queries use partition and clustering keys for direct access.
-- MySQL queries require multiple JOINs, subqueries, and rely on indexes, which become slower as data grows.
-- Cassandra is ideal for high-volume, write-heavy workloads and real-time queries on large datasets.