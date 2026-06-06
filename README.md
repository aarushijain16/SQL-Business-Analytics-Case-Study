
# SQL Playbook: Business-Critical Analytical Queries

### PostgreSQL · CTEs · Window Functions · RFM · Cohort Analysis · 
### Revenue Analytics · Inventory Planning

---

## Overview

A reusable library of 20 business-critical SQL queries built for 
B2B and D2C analytics use cases - covering customer behaviour, 
revenue analysis, retention tracking, inventory planning, and 
demand forecasting.

Each query is structured around a real business question, not a 
technical exercise. The goal is to show how SQL translates raw 
transactional data into decisions - the same way it would inside 
a product-led B2B or e-commerce analytics function.

**Tools:** SQL (PostgreSQL) · CTEs · Window Functions · 
RFM Segmentation · Cohort Analysis · Time-Series Aggregation

---

## Business Problems Solved

**Customer Analytics**
- Who are the highest-value customers by revenue contribution?
- What is the repeat purchase rate and loyalty level by segment?
- Which customers are at churn risk based on recency signals?
- How do customer cohorts retain over time?

**Revenue & Product Analytics**
- Which products and price bands generate the highest revenue?
- How is revenue distributed across SKUs (Pareto analysis)?
- What product affinities exist in the basket data?

**Inventory & Operations**
- Which SKUs are at stockout risk based on current velocity?
- Where is inventory capital being tied up in slow-moving stock?
- How should reorder points be set by product category?

**Forecasting & Trends**
- What is the monthly demand trend by product?
- Which SKUs are growing vs. declining in velocity?
- How stable is revenue over time and where is volatility concentrated?

---

## Query Library Structure

```
SQL-Playbook-Business_Critical-Analytical-Queries/
│
├── README.md
├── queries/
├── explanations/
└── dataset/
```

* `queries/` --- 20 business-critical SQL queries
* `explanations/` --- Business logic and reasoning per query
* `dataset/` --- Sample dataset used for analysis

---

## Key Analyses

**1. Revenue & Product Analytics**
- Top-performing products by revenue and margin contribution
- Revenue concentration by price band
- Product performance classification (Star, Cash Cow, Long Tail)

**2. Customer Analytics**
- RFM segmentation (Recency, Frequency, Monetary)
- Cohort retention analysis by acquisition month
- Churn risk scoring based on recency decay
- Repeat purchase rate and loyalty tier classification

**3. Sales & Order Insights**
- Cumulative revenue trends with running totals
- Basket size and average order value analysis
- Market basket / product affinity analysis using co-purchase logic

**4. Inventory & Operations**
- Stock coverage days by SKU
- Sales velocity and inventory risk classification
- Reorder point modelling using demand variability

**5. Forecasting & Trends**
- Monthly demand forecasting using SQL window functions
- Trend classification: Growing / Stable / Declining
- Revenue volatility and stability scoring

---

## SQL Techniques Demonstrated

| Technique | Applied To |
|---|---|
| CTEs (Common Table Expressions) | Multi-step logic, readability |
| Window Functions (ROW_NUMBER, LAG, RANK) | Running totals, rankings, period-over-period |
| Cohort Analysis | Retention tracking by acquisition month |
| RFM Scoring | Customer segmentation |
| Time-Based Aggregation | Monthly trends, demand forecasting |
| Subqueries & Joins | Cross-table analysis |
| CASE WHEN Logic | Classification, tiering, conditional metrics |

---

## Key Insights Surfaced

- A small percentage of customers drive a disproportionate share 
  of revenue - consistent with Pareto distribution across B2B and 
  D2C datasets
- Repeat customers stabilise revenue more than acquisition - 
  retention metrics matter as much as growth metrics
- Price band analysis consistently reveals a mid-tier sweet spot 
  that outperforms both premium and entry-level segments
- Inventory risk concentrates in a predictable tail of slow-moving 
  SKUs that can be identified and acted on with simple velocity queries
- Revenue volatility signals operational risk before it becomes 
  a P&L problem

---

## Dataset Note

This playbook uses a publicly available e-commerce dataset. 
All queries are written to be reusable and adaptable - 
the logic applies directly to real B2B, D2C, and 
e-commerce analytics environments.

---

*Part of the E-Commerce & Supply Chain Analytics Portfolio*
*[View full portfolio](https://aarushijportfolio.lovable.app/)*
