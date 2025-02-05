-- Data
SELECT * FROM storedata FETCH FIRST 10 ROWS ONLY;

SELECT * FROM storedata ORDER BY ROWI DESC FETCH FIRST 10 ROWS ONLY;

-- Handling Missing Values
UPDATE storedata SET Sales = NVL(Sales, 0), Profit = NVL(Profit, 0);

-- Proper Date Format
ALTER TABLE storedata MODIFY OrderDate DATE;

UPDATE storedata SET OrderDate = TO_DATE(OrderDate, 'DD/MM/YYYY');

-- Removing Duplicates
DELETE FROM storedata
WHERE ROWI NOT IN (
    SELECT MIN(ROWI) 
    FROM storedata 
    GROUP BY OrderID, CustomerID
);

------------------------------------------------    SALES PERFORMANCE ANALYSIS

-- Total Sales & Profit by Year 
SELECT EXTRACT(YEAR FROM OrderDate) AS Year, 
       SUM(Sales) AS Total_Sales, 
       SUM(Profit) AS Total_Profit
FROM storedata
GROUP BY EXTRACT(YEAR FROM OrderDate)
ORDER BY Year;

-- Total Sales & Profit per Quater

SELECT 
    EXTRACT(YEAR FROM OrderDate) AS year,
    CASE 
        WHEN EXTRACT(MONTH FROM OrderDate) IN (1,2,3) THEN 'Q1'
        WHEN EXTRACT(MONTH FROM OrderDate) IN (4,5,6) THEN 'Q2'
        WHEN EXTRACT(MONTH FROM OrderDate) IN (7,8,9) THEN 'Q3'
        ELSE 'Q4'
    END AS quarter,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM storedata
GROUP BY EXTRACT(YEAR FROM OrderDate),
         CASE 
             WHEN EXTRACT(MONTH FROM OrderDate) IN (1,2,3) THEN 'Q1'
             WHEN EXTRACT(MONTH FROM OrderDate) IN (4,5,6) THEN 'Q2'
             WHEN EXTRACT(MONTH FROM OrderDate) IN (7,8,9) THEN 'Q3'
             ELSE 'Q4'
         END
ORDER BY year, quarter;

-- Top 5 Best-Selling Products
SELECT ProductName, 
       SUM(Sales) AS Total_Sales, 
       SUM(Quantity) AS Total_Quantity
FROM storedata
GROUP BY ProductName
ORDER BY Total_Sales DESC
FETCH FIRST 5 ROWS ONLY;

-- Regional Sales & Profitability
SELECT Region, 
       SUM(Sales) AS Total_Sales, 
       SUM(Profit) AS Total_Profit
FROM storedata
GROUP BY Region
ORDER BY Total_Profit DESC;


------------------------------------------------    CUSTOMER SEGMENTATION 

-- RFM Recency (R),Frequency (F),Monetary Value (M) -> identify valuable customers based on their purchasing behavior

SELECT CustomerID,
       CustomerName,
       TRUNC(SYSDATE) - TRUNC(MAX(TO_DATE(OrderDate, 'DD-MM-YY'))) AS RecencyDays,  
       MAX(TO_DATE(OrderDate, 'DD-MM-YY')) AS Last_Purchase,
       COUNT(DISTINCT OrderID) AS Frequency,
       SUM(Sales) AS Monetary,
       CASE 
           WHEN SUM(Sales) > 5000 AND COUNT(DISTINCT OrderID) > 10 THEN 'High-Value'
           WHEN SUM(Sales) BETWEEN 1000 AND 5000 THEN 'Medium-Value'
           ELSE 'Low-Value'
       END AS Customer_Segment
FROM storedata
GROUP BY CustomerID, CustomerName
ORDER BY Monetary DESC;

-- save customer segment in db

alter table storedata modify (customer_segment varchar2 (15));

set serveroutput on;

DECLARE
    v_customer_id VARCHAR2(10);
    v_monetary NUMBER(38,3);
    CURSOR customer_cursor IS 
        SELECT CustomerID, SUM(Sales) AS Monetary 
        FROM storedata 
        GROUP BY CustomerID;
BEGIN
    OPEN customer_cursor;
    LOOP
        FETCH customer_cursor INTO v_customer_id, v_monetary;
        EXIT WHEN customer_cursor%NOTFOUND;
        
        IF v_monetary > 5000 THEN
            UPDATE storedata SET Customer_Segment = 'High-Value' WHERE CustomerID = v_customer_id;
        ELSIF v_monetary BETWEEN 1000 AND 5000 THEN
            UPDATE storedata SET Customer_Segment = 'Medium-Value' WHERE CustomerID = v_customer_id;
        ELSE
            UPDATE storedata SET Customer_Segment = 'Low-Value' WHERE CustomerID = v_customer_id;
        END IF;
    END LOOP;
    
    CLOSE customer_cursor;
    COMMIT;
END;
/



-- Discount Impact on Profitability

SELECT Category,
       ROUND(AVG(Discount), 2) AS Avg_Discount,
       SUM(Sales) AS Total_Sales,
       SUM(Profit) AS Total_Profit,
       ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin
FROM storedata
GROUP BY Category
ORDER BY Avg_Discount DESC;

-- Customer rewards program

SELECT customerid, SUM(sales) AS total_sales, SUM(profit) AS total_profit 
    FROM storedata
        GROUP BY customerid
        ORDER BY total_sales DESC FETCH FIRST 15 ROWS ONLY;
        
SELECT * FROM storedata;