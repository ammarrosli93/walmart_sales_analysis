# Data Description

## Source

- **Dataset:** Walmart Sales
- **Provider:** Kaggle
- **URL:** https://www.kaggle.com/datasets/mikhail1681/walmart-sales

---

## Overview

This dataset contains historical weekly sales data from 45 Walmart stores. It includes external factors such as temperature, fuel price, consumer price index (CPI), and unemployment rate that may influence sales performance.

- **Total records:** 6,435
- **Total columns:** 8
- **Time period:** Weekly sales data across multiple years

---

## Column Descriptions

| Column       | Data Type | Description                                                                             |
| ------------ | --------- | --------------------------------------------------------------------------------------- |
| Store        | INTEGER   | Store identification number, ranging from 1 to 45                                       |
| Date         | TEXT      | The week start date for the recorded sales                                              |
| Weekly_Sales | REAL      | Total sales revenue for the store in that week                                          |
| Holiday_Flag | INTEGER   | Indicates whether the week includes a public holiday. 1 = Holiday week, 0 = Normal week |
| Temperature  | REAL      | Average temperature in the region during that week, measured in Fahrenheit              |
| Fuel_Price   | REAL      | Average fuel price in the region during that week                                       |
| CPI          | REAL      | Consumer Price Index — measures the average change in prices paid by consumers          |
| Unemployment | REAL      | Regional unemployment rate during that week                                             |

---

## Notes

- The `Holiday_Flag` column marks weeks that coincide with major US holidays such as the Super Bowl, Labour Day, Thanksgiving, and Christmas
- `Weekly_Sales` is the primary metric used throughout this analysis
- External factors (Temperature, Fuel_Price, CPI, Unemployment) are regional and may vary across stores
