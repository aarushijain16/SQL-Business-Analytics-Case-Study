## 🧠 Problem Statement
[Q2](https://github.com/aarushijain16/SQL-Business-Analytics-Case-Study/blob/main/Queries/Q2.sql). Calculate daily revenue and cumulative (running) revenue over time.

## 🎯 Objective
To track revenue generation on a daily basis and analyze how revenue accumulates over time, helping understand business growth trends.

## 🛠️ Approach
- Aggregated total revenue at the daily level using SUM()
- Used a Common Table Expression (CTE) to structure daily revenue calculation
- Applied SUM() as a window function to compute cumulative revenue
- Ordered by order_date to ensure chronological calculation of running totals

## ⚙️ Why This Function?
SUM() OVER() is used to calculate cumulative revenue without collapsing rows like GROUP BY.  
It allows each row to retain its daily revenue while also computing a running total across ordered dates, making it ideal for time-series analysis.

## 💡 Business Insight
This analysis helps businesses:
- Track revenue growth trends over time  
- Identify periods of high or low sales performance  
- Support forecasting and financial planning  
- Monitor consistency and momentum in revenue generation  
