/* =========================================================
   E-COMMERCE SALES ANALYSIS - SQL PROJECT
   Database: MySQL
   ========================================================= */


/* =========================================================
   1. DATABASE TABLES
   ========================================================= */

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    email VARCHAR(40) NOT NULL,
    city VARCHAR(40)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(40),
    category VARCHAR(40),
    price INT
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


/* =========================================================
   2. BASIC SALES ANALYSIS
   ========================================================= */


/* 2.1 Total quantity of products sold */

SELECT SUM(quantity) AS products_sold
FROM order_items;


/* 2.2 Total revenue */

SELECT SUM(p.price * o.quantity) AS revenue
FROM products p
JOIN order_items o
    ON p.product_id = o.product_id;


/* 2.3 Average Order Value (AOV)
       AOV = Total Revenue / Number of Orders */

SELECT
    SUM(p.price * o.quantity) / COUNT(DISTINCT o.order_id)
        AS average_order_value
FROM order_items o
JOIN products p
    ON o.product_id = p.product_id;


/* =========================================================
   3. PRODUCT ANALYSIS
   ========================================================= */


/* 3.1 Products sold by quantity */

SELECT
    p.product_name,
    SUM(o.quantity) AS quantity_sold
FROM products p
JOIN order_items o
    ON p.product_id = o.product_id
GROUP BY p.product_id
ORDER BY quantity_sold DESC;


/* 3.2 Top 5 selling products */

SELECT
    p.product_name,
    SUM(o.quantity) AS quantity_sold
FROM products p
JOIN order_items o
    ON p.product_id = o.product_id
GROUP BY p.product_id
ORDER BY quantity_sold DESC
LIMIT 5;


/* 3.3 Product with the highest revenue */

SELECT
    p.product_name,
    SUM(p.price * o.quantity) AS revenue_by_product
FROM order_items o
JOIN products p
    ON o.product_id = p.product_id
GROUP BY p.product_id
ORDER BY revenue_by_product DESC
LIMIT 1;


/* 3.4 Product purchased most frequently */

SELECT
    p.product_name,
    SUM(o.quantity) AS total_quantity
FROM order_items o
JOIN products p
    ON o.product_id = p.product_id
GROUP BY p.product_id
ORDER BY total_quantity DESC;


/* =========================================================
   4. CATEGORY ANALYSIS
   ========================================================= */


/* 4.1 Revenue by category */

SELECT
    p.category,
    SUM(p.price * o.quantity) AS revenue_generated_by_cat
FROM order_items o
JOIN products p
    ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue_generated_by_cat DESC;


/* 4.2 Category with the highest revenue */

SELECT
    p.category,
    SUM(p.price * o.quantity) AS revenue_generated_by_cat
FROM order_items o
JOIN products p
    ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue_generated_by_cat DESC
LIMIT 1;


/* =========================================================
   5. MONTHLY AND YEARLY SALES ANALYSIS
   ========================================================= */


/* 5.1 Monthly sales trend
       Displayed in chronological order */

SELECT
    MONTH(o.order_date) AS month_number,
    MONTHNAME(o.order_date) AS month,
    SUM(p.price * o1.quantity) AS revenue_by_month
FROM orders o
JOIN order_items o1
    ON o.order_id = o1.order_id
JOIN products p
    ON o1.product_id = p.product_id
GROUP BY month_number, month
ORDER BY month_number;


/* 5.2 Yearly revenue comparison */

SELECT
    YEAR(o.order_date) AS year,
    SUM(p.price * o1.quantity) AS revenue_by_year
FROM orders o
JOIN order_items o1
    ON o.order_id = o1.order_id
JOIN products p
    ON o1.product_id = p.product_id
GROUP BY year
ORDER BY revenue_by_year DESC;


/* =========================================================
   6. CUSTOMER ANALYSIS
   ========================================================= */


/* 6.1 Top 5 customers by spending */

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    SUM(p.price * o1.quantity) AS customer_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items o1
    ON o1.order_id = o.order_id
JOIN products p
    ON o1.product_id = p.product_id
GROUP BY c.customer_id
ORDER BY customer_spent DESC
LIMIT 5;


/* 6.2 Number of orders placed by each customer */

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(o.order_id) AS orders_placed
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY orders_placed DESC;


/* 6.3 Customer with the highest number of orders */

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(o.order_id) AS orders_placed
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY orders_placed DESC
LIMIT 1;


/* =========================================================
   7. CITY ANALYSIS
   ========================================================= */


/* 7.1 Revenue by city */

SELECT
    c.city,
    SUM(p.price * o1.quantity) AS revenue_by_city
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items o1
    ON o1.order_id = o.order_id
JOIN products p
    ON o1.product_id = p.product_id
GROUP BY c.city
ORDER BY revenue_by_city DESC;


/* 7.2 City with the highest revenue */

SELECT
    c.city,
    SUM(p.price * o1.quantity) AS revenue_by_city
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items o1
    ON o1.order_id = o.order_id
JOIN products p
    ON o1.product_id = p.product_id
GROUP BY c.city
ORDER BY revenue_by_city DESC
LIMIT 1;


/* =========================================================
   8. ORDER ANALYSIS
   ========================================================= */


/* 8.1 Order with the highest revenue */

SELECT
    o.order_id,
    SUM(p.price * o1.quantity) AS order_revenue
FROM orders o
JOIN order_items o1
    ON o.order_id = o1.order_id
JOIN products p
    ON o1.product_id = p.product_id
GROUP BY o.order_id
ORDER BY order_revenue DESC
LIMIT 1;


/* 8.2 Order with the highest total quantity of products */

SELECT
    order_id,
    SUM(quantity) AS order_quantity
FROM order_items
GROUP BY order_id
ORDER BY order_quantity DESC
LIMIT 1;


/* =========================================================
   9. BUSINESS INSIGHTS
   =========================================================

   1. 2024 generated the highest revenue.
   2. Coffee Maker generated the highest revenue among products.
   3. Order 13 had the highest total quantity of products purchased.
   4. Denver generated the highest revenue among cities.
   5. Matthew Moore generated the highest revenue among customers
      who placed orders.

   ========================================================= */
