--Create Orders Table
CREATE TABLE orders (
    row_id INT,
    order_id VARCHAR(50),
    order_date VARCHAR(20),
    ship_date VARCHAR(20),
    ship_mode VARCHAR(50),
    customer_id VARCHAR(50),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name TEXT,
    sales NUMERIC,
    quantity INT,
    discount NUMERIC,
    profit NUMERIC
);

--Create Returns Table
CREATE TABLE returns (
    returned VARCHAR(10),
    order_id VARCHAR(50)
);

--Create People Table
CREATE TABLE people (
    person VARCHAR(100),
    region VARCHAR(50)
);

-- Total Revenue, Profit, Orders & Profit Margin
SELECT 
    SUM(sales) AS total_revenue,
    SUM(profit) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin_percentage
FROM orders;


-- Category-wise Sales & Profit
SELECT 
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM orders
GROUP BY category
ORDER BY total_sales DESC;


-- Region-wise Sales & Profit
SELECT 
    region,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM orders
GROUP BY region
ORDER BY total_sales DESC;


-- Sub-Category Profitability
SELECT 
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM orders
GROUP BY sub_category
ORDER BY total_profit DESC;


-- Discount Impact Analysis
SELECT 
    discount,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM orders
GROUP BY discount
ORDER BY discount;


-- Ship Mode Analysis
SELECT 
    ship_mode,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales
FROM orders
GROUP BY ship_mode
ORDER BY total_orders DESC;


-- Customer Analysis
SELECT 
    customer_name,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM orders
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;