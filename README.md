# E-Commerce Sales Analysis Using SQL

## Project Overview

This project analyzes an e-commerce sales database using MySQL.

The analysis focuses on sales performance, products, categories, customers, cities, orders, and yearly/monthly revenue trends. SQL queries are used to extract meaningful business insights from the data.

---

## Objectives

* Calculate total quantity of products sold
* Calculate total revenue
* Calculate Average Order Value (AOV)
* Analyze monthly sales trends
* Identify top-selling products
* Identify the highest-revenue product
* Analyze revenue by category
* Identify the highest-revenue category
* Analyze customer spending and order frequency
* Analyze city-wise revenue
* Identify the highest-value order
* Compare yearly revenue
* Generate business insights

---

## Database Schema

The project contains four tables:

### 1. Customers

| Column      | Data Type   | Description         |
| ----------- | ----------- | ------------------- |
| customer_id | INT         | Unique customer ID  |
| first_name  | VARCHAR(40) | Customer first name |
| last_name   | VARCHAR(40) | Customer last name  |
| email       | VARCHAR(40) | Customer email      |
| city        | VARCHAR(40) | Customer city       |

### 2. Orders

| Column      | Data Type | Description                             |
| ----------- | --------- | --------------------------------------- |
| order_id    | INT       | Unique order ID                         |
| customer_id | INT       | ID of the customer who placed the order |
| order_date  | DATE      | Date when the order was placed          |

### 3. Products

| Column       | Data Type   | Description         |
| ------------ | ----------- | ------------------- |
| product_id   | INT         | Unique product ID   |
| product_name | VARCHAR(40) | Name of the product |
| category     | VARCHAR(40) | Product category    |
| price        | INT         | Product price       |

### 4. Order Items

| Column        | Data Type | Description           |
| ------------- | --------- | --------------------- |
| order_item_id | INT       | Unique order-item ID  |
| order_id      | INT       | Associated order ID   |
| product_id    | INT       | Associated product ID |
| quantity      | INT       | Quantity purchased    |

---

## Table Relationships

The tables are connected using primary and foreign keys.

```text
Customers
    |
    | 1 : Many
    ↓
Orders
    |
    | 1 : Many
    ↓
Order_Items
    ↑
    | Many : 1
    |
Products
```

Relationship flow:

```text
Customers → Orders → Order_Items ← Products
```

---

## SQL Concepts Used

* SELECT
* JOIN
* INNER JOIN
* GROUP BY
* ORDER BY
* LIMIT
* SUM()
* COUNT()
* CONCAT()
* YEAR()
* MONTH()
* MONTHNAME()
* Aggregate Functions
* Primary Keys
* Foreign Keys
* Aliases
* Date Functions

---

## Analysis Performed

### Sales Analysis

* Total products sold
* Total revenue
* Average Order Value

### Product Analysis

* Products sold by quantity
* Top 5 selling products
* Product with the highest revenue
* Most frequently purchased product

### Category Analysis

* Revenue by category
* Highest-revenue category

### Time Analysis

* Monthly revenue trend
* Yearly revenue comparison

### Customer Analysis

* Top 5 customers by spending
* Number of orders placed by each customer
* Customer with the highest number of orders

### City Analysis

* Revenue by city
* City with the highest revenue

### Order Analysis

* Order with the highest revenue
* Order with the highest total quantity of products

---

## Key Business Insights

Based on the analysis:

1. **2024 generated the highest revenue** compared with the other analyzed year.

2. **Coffee Maker generated the highest revenue** among the products.

3. **Order 13 had the highest total quantity of products purchased.**

4. **Denver generated the highest revenue** among the analyzed cities.

5. **Matthew Moore generated the highest revenue** among customers who placed orders.

---

## Tools Used

* **MySQL**
* **SQL**
* **GitHub**

---

## Project Structure

```text
ecommerce-sales-analysis-sql/
│
├── ecommerce_sales_analysis.sql
└── README.md
```

### Files

| File                           | Description                                                             |
| ------------------------------ | ----------------------------------------------------------------------- |
| `ecommerce_sales_analysis.sql` | Contains database tables and all SQL analysis queries                   |
| `README.md`                    | Contains project documentation, schema, analysis, and business insights |

---

## Conclusion

This project demonstrates how SQL can be used to analyze e-commerce data and extract useful business insights.

The project covers database relationships, joins, aggregate functions, grouping, sorting, date-based analysis, customer analysis, product analysis, and revenue analysis.
