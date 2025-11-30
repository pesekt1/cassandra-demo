# Cassandra Demo: SQL Store NoSQL

This demo showcases how Cassandra can be used for order management, comparing its strengths and query patterns to relational databases.

## Purpose

- Demonstrate Cassandra's data modeling for fast, scalable queries.
- Show denormalization and partition key access.
- Compare Cassandra queries with equivalent SQL (MySQL) queries.
- Highlight scenarios where Cassandra outperforms relational databases.

## How to Run

1. docker-compose up -d
2. Try queries from `demo-queries.sql` in `cqlsh` and compare with MySQL.

## Educational Notes

- Cassandra is not optimized for complex aggregations (SUM, COUNT, AVG).
- Use Spark or analytics tools for large-scale data analysis.
- Data modeling in Cassandra is query-driven: design tables for your access patterns.

## Useful Links

- [Cassandra Documentation](https://cassandra.apache.org/doc/latest/)
- [CQL Reference](https://cassandra.apache.org/doc/latest/cassandra/developing/cql/index.html)

## Data Model

Two main tables:

- `orders_by_customer`: Partitioned by `customer_id`, stores all orders and products for each customer.
- `orders_by_product`: Partitioned by `product_id`, stores all orders containing each product.

## Key Concepts

- **Denormalization**: Data is duplicated across tables for fast access by different keys.
- **Partition Key Queries**: Cassandra excels at queries using the partition key (e.g., all orders for a customer).
- **Partitioning**:  
  Cassandra distributes data across nodes using a partition key. A **node** is a single server in the Cassandra cluster that stores part of the data. A **cluster** is a group of nodes that work together to store and manage the entire dataset. The partition key determines which node in the cluster stores the data. All rows with the same partition key are stored together, making reads and writes for that key very fast and scalable. For example, in `orders_by_customer`, all orders for a given `customer_id` are stored in the same partition (and typically on the same node). This enables efficient retrieval and horizontal scaling, as partitions are automatically balanced across the cluster.
- **Scalability**: Designed for high write throughput and horizontal scaling.

## Example Queries & Explanations

Below are example queries from `demo-queries.sql` with explanations of why Cassandra is faster and simpler than MySQL for these access patterns.

### 1. Get all orders for a given customer

**Cassandra:**  
`customer_id` is the partition key. All data for a customer is stored together, so Cassandra retrieves it with a single partition scan—no JOINs, no index lookups.

**MySQL:**  
Requires multiple JOINs across orders, customers, order_items, products, statuses, and shippers. Relational databases must scan and join several tables, which is slower for large datasets.

---

### 2. Get all orders containing a given product

**Cassandra:**  
`product_id` is the partition key. Cassandra instantly retrieves all orders for a product from one partition.

**MySQL:**  
Requires JOINs between order_items, products, orders, and customers. Relational databases must scan order_items and join with other tables, which is slower.

---

### 3. Get all products for a specific order of a customer

**Cassandra:**  
Uses both partition key (`customer_id`) and clustering key (`order_id`). Data is modeled so all products for an order are stored together, making this query very efficient.

**MySQL:**  
Must filter order_items by order_id and check that the order belongs to the customer. Requires a subquery and JOIN, which is more complex and less efficient.

---

### 4. Get all orders for a customer in a date range

**Cassandra:**  
All orders for a customer are stored in the same partition. Filtering by order_id (if time-based or sequential) is fast.

**MySQL:**  
Must scan orders table and filter by customer and date range, possibly using indexes. Still slower for large datasets due to table scans and JOINs.

---

### 5. Get all customers who ordered a specific product

**Cassandra:**  
Directly retrieves customer info from the denormalized `orders_by_product` table. No JOINs required; very fast.

**MySQL:**  
Requires DISTINCT and multiple JOINs to get unique customers for a product.

---

### 6. Get all orders for a product in a date range

**Cassandra:**  
All orders for a product are stored in the same partition. Filtering by order_id (if sequential) is fast.

**MySQL:**  
Must scan order_items and join with orders and customers, then filter by date range.

---

### Summary

Cassandra queries are fast and simple because the data model is designed for the access patterns. No JOINs are needed; queries use partition and clustering keys for direct access.  
MySQL queries require multiple JOINs, subqueries, and rely on indexes, which become slower as data grows.  
Cassandra is ideal for high-volume, write-heavy workloads and real-time queries on large datasets.
