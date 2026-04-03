## 🧠 Problem Statement
[Q1](https://github.com/aarushijain16/SQL-Business-Analytics-Case-Study/blob/main/Queries/Q1.sql).
Identify the top 3 products in each category based on total revenue. 
## 🎯 Objective
To determine which products drive the highest revenue within each category, enabling better product prioritization.

## 🛠️ Approach
- Aggregated total revenue at the product level using SUM()
- Used a Common Table Expression (CTE) to structure intermediate results
- Applied ROW_NUMBER() as a window function
- Partitioned data by category to rank products within each category based on revenue

## ⚙️ Why This Function?
ROW_NUMBER() is used to assign a unique rank to each product within its category based on revenue.  
It is preferred over RANK() or DENSE_RANK() because it ensures exactly 3 products are selected per category, even when there are ties in revenue.

## 💡 Business Insight
This analysis helps identify top-performing products within each category, allowing businesses to:
- Focus on high-revenue products for promotions
- Optimize inventory allocation
- Prioritize production and supply for best-selling items
