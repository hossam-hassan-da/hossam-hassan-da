-- ========================================
-- Analysis 1: Number of Transactions by Age
-- ========================================
SELECT C.Age, COUNT(F.transaction_id) AS NUMBER_OF_TRANSACTION
FROM customer_table C
JOIN fact_sales_table F ON C.customer_key = F.customer_key
GROUP BY C.Age
ORDER BY NUMBER_OF_TRANSACTION DESC;

-- ========================================
-- Analysis 2: Amount Sold by Product Category
-- ========================================
SELECT Product_Category, SUM(Quantity) as amount_sold
FROM product_table
GROUP BY Product_Category
ORDER BY amount_sold DESC;

-- ========================================
-- Analysis 3: Average Sales per Category
-- ========================================
SELECT P.product_category, ROUND(AVG(F.Total_Amount), 1) AS AVG_sales_per_category
FROM product_table P
JOIN fact_sales_table F ON P.product_key = F.product_key
GROUP BY P.Product_Category
ORDER BY AVG_sales_per_category DESC;

-- ========================================
-- Analysis 4: Total Sales per Category
-- ========================================
SELECT P.product_category, SUM(F.Total_Amount) AS sales_per_category
FROM product_table P
JOIN fact_sales_table F ON P.product_key = F.product_key
GROUP BY P.Product_Category
ORDER BY sales_per_category DESC;

-- ========================================
-- Analysis 5: Top Customers (Max Amount = 2000)
-- ========================================
WITH top_customers AS (
    SELECT DISTINCT C.customer_id, MAX(F.Total_Amount) AS MAX_AMOUNT
    FROM customer_table C
    JOIN fact_sales_table F ON C.customer_key = F.customer_key
    GROUP BY C.customer_id
    ORDER BY MAX_AMOUNT DESC
)
SELECT customer_id, MAX_AMOUNT 
FROM top_customers
WHERE MAX_AMOUNT = 2000;

-- ========================================
-- Analysis 6: Total Sales per Month
-- ========================================
SELECT D.month, SUM(F.Total_Amount) AS total_sales_per_mounth
FROM date_time_table D
JOIN fact_sales_table F ON D.date_key = F.date_key
GROUP BY D.month
ORDER BY total_sales_per_mounth DESC;

-- ========================================
-- Analysis 7: Transactions by Gender and Day of Week
-- ========================================
SELECT C.gender, D.day_of_week, COUNT(F.transaction_id)
FROM customer_table C
JOIN fact_sales_table F ON C.customer_key = F.customer_key
JOIN date_time_table D ON D.date_key = F.date_key
GROUP BY C.gender, D.day_of_week
ORDER BY C.gender;

-- ========================================
-- Analysis 8: Total Sales per Week Days
-- ========================================
SELECT D.day_of_week, SUM(F.Total_Amount) AS total_sales_per_week_days
FROM date_time_table D
JOIN fact_sales_table F ON D.date_key = F.date_key
GROUP BY D.day_of_week
ORDER BY total_sales_per_week_days DESC;