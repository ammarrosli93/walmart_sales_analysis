SELECT * FROM Walmart_Sales LIMIT 20;
SELECT * FROM Walmart_Sales WHERE Walmart_Sales.Weekly_Sales;
SELECT COUNT(*) AS Total_Rows FROM Walmart_Sales;
SELECT COUNT(DISTINCT Store) AS Total_Store FROM Walmart_Sales ORDER BY Store;
SELECT * FROM Walmart_Sales WHERE Walmart_Sales.Holiday_Flag = 1;
SELECT SUM(Weekly_Sales) AS TotalSalesHoliday1 FROM Walmart_Sales WHERE Walmart_Sales.Holiday_Flag = 1;
SELECT * FROM Walmart_Sales ORDER BY Weekly_Sales ASC;
SELECT * FROM Walmart_Sales WHERE Weekly_Sales > 2000000 ORDER BY Weekly_Sales DESC;
SELECT * FROM Walmart_Sales WHERE Weekly_Sales > 2000000 ORDER BY Weekly_Sales DESC;
SELECT Store, SUM(Weekly_Sales) AS Store_Total_Sales 
FROMWalmart_Sales 
GROUP BY Store  
ORDER BY Store_Total_Sales DESC;
SELECT Store, MAX(Weekly_Sales) AS Most_Weekly_Sales FROM Walmart_Sales;
SELECT Store, SUM(Weekly_Sales) AS Store_Total_Sales 
FROM Walmart_Sales 
GROUP BY Store  
ORDER BY Store_Total_Sales DESC;
SELECT Store, SUM(Weekly_Sales) AS Most_Weekly_Sales FROM Walmart_Sales;
SELECT Store, SUM(Weekly_Sales) AS Store_Total_Sales 
FROMWalmart_Sales 
GROUP BY Store  
ORDER BY Store_Total_Sales DESC;
SELECT Store, MAX(Weekly_Sales) AS Most_Weekly_Sales FROM Walmart_Sales;
SELECT Store, SUM(Weekly_Sales) AS Store_Total_Sales 
FROM Walmart_Sales 
GROUP BY Store  
ORDER BY Store_Total_Sales DESC
LIMIT 1;
SELECT Holiday_Flag, ROUND(AVG(Weekly_Sales), 0) AS Holiday_Avg_Sales FROM Walmart_Sales GROUP BY Holiday_Flag;
SELECT * FROM Walmart_Sales LIMIT 20;
SELECT Store, Weekly_Sales AS Most_Sales, Holiday_Flag AS Week FROM Walmart_Sales GROUP BY Store ORDER BY Most_Sales DESC ;
SELECT DATE, SUM(Weekly_Sales) AS Total_Sales FROM Walmart_Sales GROUP BY Date ORDER BY Total_Sales DESC LIMIT 10;
SELECT Date, Store, Weekly_Sales AS Sales FROM Walmart_Sales WHERE Weekly_Sales > (SELECT AVG(Weekly_Sales) FROM Walmart_Sales);
SELECT COUNT(*) FROM Walmart_Sales WHERE Weekly_Sales > (SELECT AVG(Weekly_Sales) FROM Walmart_Sales);
SELECT
  CASE
    WHEN Temperature < 40 THEN 'Cold'
    WHEN Temperature BETWEEN 40 AND 80 THEN 'Warm'
    ELSE 'Hot'
  END AS Temp_Group,
  ROUND(AVG(Weekly_Sales), 2) AS Avg_Sales,
  COUNT(*) AS Num_Records
FROM Walmart_Sales
GROUP BY Temp_Group
ORDER BY Avg_Sales DESC;
SELECT 
	Store, 
	COUNT(*) AS Week_Recorded,
	ROUND(SUM(Weekly_Sales), 2) AS Total_Sales, 
	ROUND(AVG(Weekly_Sales), 2) AS Avg_Sales, 
	ROUND(MIN(Weekly_Sales), 2) AS Min_Sales, 
	ROUND(MAX(Weekly_Sales), 2) AS Max_Sales 
FROM Walmart_Sales 
GROUP BY Store 
ORDER BY Total_Sales DESC;


	