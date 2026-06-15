# Walmart Weekly Sales Analysis

A data analysis project using SQL to explore weekly sales patterns across 45 Walmart stores.

---

## Objective

To analyze Walmart's weekly sales data and uncover insights about store performance, holiday impact, and external factors such as temperature, fuel price, CPI, and unemployment rate.

---

## Dataset

- **Source:** [Kaggle — Walmart Sales Dataset](https://www.kaggle.com/datasets/mikhail1681/walmart-sales)
- **Rows:** 6,435
- **Columns:** 8

| Column | Type | Description |
|---|---|---|
| Store | INTEGER | Store number (1–45) |
| Date | TEXT | Week start date |
| Weekly_Sales | REAL | Total sales for that week |
| Holiday_Flag | INTEGER | 1 = Holiday week, 0 = Normal week |
| Temperature | REAL | Temperature in the region (°F) |
| Fuel_Price | REAL | Fuel price in the region |
| CPI | REAL | Consumer Price Index |
| Unemployment | REAL | Unemployment rate |

---

## Tools Used

- **SQLite** — Database engine
- **DBeaver** — SQL client and database management tool
- **SQL** — Data querying and analysis

---

## Key Questions Answered

1. How many unique stores are in the dataset?
2. What are the total sales per store?
3. Which store has the highest total sales?
4. Do holiday weeks generate higher sales than normal weeks?
5. Which weeks had the highest total sales across all stores?
6. How does temperature affect weekly sales?
7. What is the full performance summary per store?

---

## SQL Concepts Applied

- `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`
- `DISTINCT` — finding unique values
- `GROUP BY` with aggregate functions — `SUM()`, `AVG()`, `COUNT()`, `MIN()`, `MAX()`
- Subqueries — filtering above average records
- `CASE WHEN` — custom grouping (e.g. temperature bands)
- `ROUND()` — formatting decimal output

---

## Key Queries

### Total sales per store
```sql
SELECT Store,
       SUM(Weekly_Sales) AS Total_Sales
FROM Walmart_Sales
GROUP BY Store
ORDER BY Total_Sales DESC;
```

### Holiday vs normal week sales
```sql
SELECT Holiday_Flag,
       ROUND(AVG(Weekly_Sales), 2) AS Avg_Sales,
       COUNT(*) AS Number_Of_Weeks
FROM Walmart_Sales
GROUP BY Holiday_Flag;
```

### Top 5 highest sales weeks
```sql
SELECT Date,
       SUM(Weekly_Sales) AS Weekly_Total
FROM Walmart_Sales
GROUP BY Date
ORDER BY Weekly_Total DESC
LIMIT 5;
```

### Sales above average (subquery)
```sql
SELECT *
FROM Walmart_Sales
WHERE Weekly_Sales > (
    SELECT AVG(Weekly_Sales)
    FROM Walmart_Sales
);
```

### Sales by temperature group (CASE WHEN)
```sql
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
```

### Full store performance summary
```sql
SELECT
  Store,
  COUNT(*) AS Weeks_Recorded,
  ROUND(SUM(Weekly_Sales), 2) AS Total_Sales,
  ROUND(AVG(Weekly_Sales), 2) AS Avg_Sales,
  ROUND(MIN(Weekly_Sales), 2) AS Min_Sales,
  ROUND(MAX(Weekly_Sales), 2) AS Max_Sales
FROM Walmart_Sales
GROUP BY Store
ORDER BY Total_Sales DESC;
```

---

## Key Findings

- There are **45 unique stores** in the dataset
- Holiday weeks tend to have higher average sales compared to normal weeks
- Sales vary by temperature group, with warm weeks showing stronger performance
- Top performing stores consistently outperform others across all weeks recorded

---

## Project Structure

```
walmart-sales-analysis/
├── README.md                  
├── walmart_analysis.sql       
├── data_description.md        
└── screenshots/
      ├── total_sales_by_store.png
      ├── holiday_vs_normal.png
      └── temperature_groups.png
```

---

## How to Reproduce

1. Download the dataset from [Kaggle](https://www.kaggle.com/datasets/mikhail1681/walmart-sales)
2. Install [SQLite](https://www.sqlite.org/download.html) and [DBeaver](https://dbeaver.io/download/)
3. Create a new SQLite database in DBeaver (`wallmart.db`)
4. Import the CSV file into a table named `Walmart_Sales`
5. Open `walmart_analysis.sql` and run the queries

---

## About

This project was built as part of my SQL learning journey, practising real-world data analysis using SQLite and DBeaver.
