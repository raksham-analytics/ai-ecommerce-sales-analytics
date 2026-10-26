-- MySQL 8+ | import data/orders_synthetic.csv into orders table
CREATE TABLE IF NOT EXISTS orders (order_id INT PRIMARY KEY, order_date DATE, customer_id VARCHAR(20), category VARCHAR(40), region VARCHAR(30), quantity INT, unit_price DECIMAL(12,2), discount_pct DECIMAL(5,2), unit_cost DECIMAL(12,2), sales DECIMAL(14,2), profit DECIMAL(14,2));
-- Monthly revenue, profit and order count
SELECT DATE_FORMAT(order_date,'%Y-%m') AS month, ROUND(SUM(sales),2) AS revenue, ROUND(SUM(profit),2) AS profit, COUNT(*) AS orders FROM orders GROUP BY month ORDER BY month;
-- Top categories by revenue
SELECT category, ROUND(SUM(sales),2) revenue, ROUND(SUM(profit),2) profit FROM orders GROUP BY category ORDER BY revenue DESC;
-- Regional sales
SELECT region, ROUND(SUM(sales),2) revenue, COUNT(DISTINCT customer_id) customers FROM orders GROUP BY region ORDER BY revenue DESC;
-- Repeat customers
SELECT customer_id, COUNT(*) order_count, ROUND(SUM(sales),2) lifetime_value FROM orders GROUP BY customer_id HAVING COUNT(*) > 1 ORDER BY lifetime_value DESC LIMIT 20;
-- Average order value by month
SELECT DATE_FORMAT(order_date,'%Y-%m') month, ROUND(AVG(sales),2) average_order_value FROM orders GROUP BY month ORDER BY month;
