CREATE DATABASE superstore_db;

USE superstore_db;


-- =====================================
-- SUPERSTORE DATA ANALYTICS PROJECT
-- MYSQL ANALYSIS
-- =====================================

USE superstore_db;

-- 1. Check tables
SHOW TABLES;

-- 2. Check table structure
DESCRIBE superstore_cleaned;

-- 3. Display first 10 records
SELECT *
FROM superstore_cleaned
LIMIT 10;

-- 4. Total records
SELECT COUNT(*) AS Total_Records
FROM superstore_cleaned;

-- 5. Overall KPIs
SELECT
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    COUNT(DISTINCT Customer_ID) AS Total_Customers,
    ROUND(AVG(Sales), 2) AS Average_Sales
FROM superstore_cleaned;

-- 6. Sales by Category
SELECT
    Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore_cleaned
GROUP BY Category
ORDER BY Total_Sales DESC;

-- 7. Sales by Region
SELECT
    Region,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore_cleaned
GROUP BY Region
ORDER BY Total_Sales DESC;

-- 8. Top 10 Products
SELECT
    Product_Name,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM superstore_cleaned
GROUP BY Product_Name
ORDER BY Total_Sales DESC
LIMIT 10;

-- 9. Top 10 Customers
SELECT
    Customer_ID,
    Customer_Name,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM superstore_cleaned
GROUP BY Customer_ID, Customer_Name
ORDER BY Total_Sales DESC
LIMIT 10;

-- 10. Sales by Segment
SELECT
    Segment,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore_cleaned
GROUP BY Segment
ORDER BY Total_Sales DESC;

-- 11. Sales by Sub-Category
SELECT
    Sub_Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore_cleaned
GROUP BY Sub_Category
ORDER BY Total_Sales DESC;

-- 12. Monthly Sales Analysis
SELECT
    DATE_FORMAT(Order_Date, '%Y-%m') AS Month,
    ROUND(SUM(Sales), 2) AS Monthly_Sales,
    ROUND(SUM(Profit), 2) AS Monthly_Profit
FROM superstore_cleaned
GROUP BY DATE_FORMAT(Order_Date, '%Y-%m')
ORDER BY Month;

-- 13. Loss-Making Products
SELECT
    Product_Name,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore_cleaned
GROUP BY Product_Name
HAVING SUM(Profit) < 0
ORDER BY Total_Profit ASC;

-- 14. Profit Margin
SELECT
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(
        SUM(Profit) / NULLIF(SUM(Sales), 0) * 100,
        2
    ) AS Profit_Margin_Percentage
FROM superstore_cleaned;

-- 15. Sales by State
SELECT
    State,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore_cleaned
GROUP BY State
ORDER BY Total_Sales DESC;

-- 16. Sales by Shipping Mode
SELECT
    `Ship Mode`,
    ROUND(SUM(Sales), 2) AS Total_Sales
    
FROM superstore_cleaned
GROUP BY `Ship Mode`
ORDER BY Total_Sales DESC;


describe superstore_cleaned;

select user(), current_user();

alter user 'root'@'localhost' identified by 'Prachimagadum@123';