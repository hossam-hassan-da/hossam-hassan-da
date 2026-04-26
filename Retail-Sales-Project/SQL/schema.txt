-- ========================================
-- 1. Create Database
-- ========================================
CREATE DATABASE retail_sales;
USE retail_sales;

-- ========================================
-- 2. Create Source Table (Raw Data)
-- ========================================
CREATE TABLE retail_sales_source (
    transaction_id INT,
    Date DATE,
    Customer_ID VARCHAR(20),
    Gender VARCHAR(20),
    Age INT,
    Product_Category VARCHAR(20),
    Quantity INT,
    Price_per_Unit INT,
    Total_Amount INT
);

-- ========================================
-- 3. Create Dimension Tables
-- ========================================

-- Product Dimension Table
CREATE TABLE product_table (
    product_key INT AUTO_INCREMENT PRIMARY KEY,
    Product_Category VARCHAR(20),
    Quantity INT,
    Price_per_Unit INT
);

INSERT INTO product_table (Product_Category, Quantity, Price_per_Unit)
SELECT Product_Category, Quantity, Price_per_Unit
FROM retail_sales_source;

-- Customer Dimension Table
CREATE TABLE customer_table (
    customer_key INT AUTO_INCREMENT PRIMARY KEY,
    customer_id VARCHAR(20),
    gender VARCHAR(20),
    Age INT
);

INSERT INTO customer_table (customer_id, gender, Age)
SELECT Customer_ID, Gender, Age
FROM retail_sales_source;

-- Date/Time Dimension Table
CREATE TABLE date_time_table (
    date_key INT AUTO_INCREMENT PRIMARY KEY,
    full_date DATE NOT NULL,
    month VARCHAR(20) NOT NULL,
    day_of_week VARCHAR(20) NOT NULL
);

INSERT INTO date_time_table (full_date, month, day_of_week)
SELECT Date, MONTHNAME(Date), DAYNAME(Date)
FROM retail_sales_source;

-- ========================================
-- 4. Create Fact Table with Relationships
-- ========================================
CREATE TABLE fact_sales_table (
    sales_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_key INT NOT NULL,
    product_key INT NOT NULL,
    date_key INT NOT NULL,
    transaction_id INT NOT NULL,
    Total_Amount INT NOT NULL,
    
    FOREIGN KEY (customer_key) REFERENCES customer_table(customer_key),
    FOREIGN KEY (product_key) REFERENCES product_table(product_key),
    FOREIGN KEY (date_key) REFERENCES date_time_table(date_key)
);