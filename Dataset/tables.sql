CREATE TABLE daily_product_sales (
    order_date DATE,
    product_id INT,
    revenue NUMERIC
);

INSERT INTO daily_product_sales VALUES
('202-01-01', 101, 500),
('2024-01-02', 102, 700),
('2024-01-03', 103, 300),
('2024-01-04', 101, 400),

('2024-01-01', 201, 800),
('2024-01-02', 202, 600),
('2024-01-03', 203, 900),
('2024-01-04', 201, 200),

('2024-01-01', 301, 1000),
('2024-01-02', 302, 1200),
('2024-01-03', 303, 1100),
('2024-01-04', 301, 500);

SELECT * FROM daily_product_sales;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name TEXT,
    city TEXT,
    signup_date DATE
);

INSERT INTO customers VALUES
(1, 'Amit', 'Delhi', '2022-01-10'),
(2, 'Neha', 'Mumbai', '2022-02-15'),
(3, 'Raj', 'Bangalore', '2022-03-20'),
(4, 'Simran', 'Delhi', '2022-04-05'),
(5, 'Karan', 'Mumbai', '2022-05-12');

SELECT * FROM customers;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name TEXT,
    category TEXT,
    price NUMERIC
);

INSERT INTO products VALUES
(101, 'T-Shirt', 'Apparel', 500),
(102, 'Jeans', 'Apparel', 1200),
(103, 'Shoes', 'Footwear', 2000),
(104, 'Jacket', 'Apparel', 2500),
(105, 'Sneakers', 'Footwear', 1800);

SELECT * FROM products;

CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT,
    revenue NUMERIC
);

INSERT INTO order_items VALUES
(1, 101, 2, 1000),
(1, 102, 1, 1200),

(2, 103, 1, 2000),

(3, 101, 3, 1500),

(4, 104, 1, 2500),

(5, 102, 2, 2400),

(6, 105, 1, 1800),

(7, 101, 1, 500),

(8, 103, 2, 4000),

(9, 104, 1, 2500),

(10, 102, 1, 1200);

SELECT * FROM order_items;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status TEXT
);

INSERT INTO orders VALUES
(1, 1, '2022-01-15', 'completed'),
(2, 2, '2022-01-20', 'completed'),
(3, 1, '2022-02-10', 'completed'),
(4, 3, '2022-02-18', 'completed'),
(5, 4, '2022-03-05', 'completed'),
(6, 5, '2022-03-25', 'completed'),
(7, 2, '2022-04-10', 'completed'),
(8, 3, '2022-04-22', 'completed'),
(9, 1, '2022-05-01', 'completed'),
(10, 4, '2022-05-15', 'completed');

SELECT * FROM orders;