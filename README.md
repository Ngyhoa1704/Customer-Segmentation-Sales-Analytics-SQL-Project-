# Customer Segmentation Sales Analytics SQL Project
Customer Segmentation & Sales Analytics (SQL Project)

This project analyzes transactional data from Tiffany – TTP store to segment customers based on spending behavior and generate targeted business recommendations. The entire analysis is conducted using SQL.



## 1. Dataset Overview

The dataset contains detailed transaction data, with the following columns:

- `Date`: Transaction date  
- `Scheme Name`: Membership tier (e.g., PLATINUM, MEMBER…)  
- `Store Name`: Store identifier (e.g., TIFFANY – TTP)  
- `Item Name`: Product name  
- `Member Account Code`: Unique customer ID  
- `Invoice`: Invoice number (used to group line items of the same order)  
- `Sales Qty`: Quantity of items sold (positive = purchase, negative = return)  
- `Sales Amt`: Transaction value in VND (negative = return)



## 2. Project Steps

### 2.1 Customer Segmentation by Total Spending

Customers are segmented based on their **total spending (converted from VND to USD using the rate `* 0.00003858`)** as follows:

| Segment   | Condition                          |
|-----------|------------------------------------|
| Platinum  | Total Sales > $50,000              |
| Gold      | $25,000 < Total Sales ≤ $50,000    |
| Silver    | $10,000 < Total Sales ≤ $25,000    |
| CT        | $3,000 < Total Sales ≤ $10,000     |
| Others    | Total Sales ≤ $3,000               |

### 2.2 Metric Calculation per Segment

For each segment, the following KPIs are calculated:

- Total number of customers  
- Total revenue  
- Total number of transactions  
- Total items sold  
- Number of invoices with 2+ items (using subqueries and `GROUP BY Invoice`)  
- Average Transaction Value (ATV)  
- Units per Transaction (UPT)

Segments are processed individually with filter conditions and then combined using `UNION ALL`.



## 3. Top Products & Customers

- **Top 10 customers** by total sales amount and sales quantity  
- **Top 10 products** by total revenue and quantity sold  

Key insight:  
High-spending customers tend to purchase fewer items (often just one per transaction), while volume buyers contribute less in overall value.



## 4. Strategic Recommendations by Segment

### PLATINUM & GOLD  
Customers in this group place few orders, usually containing only one item, but with extremely high order values.  
Recommendation: Invest in VIP services, private consultations, luxury upselling, and exclusive vouchers.

### SILVER & CT  
These customers frequently buy 2 or more items per transaction, though the average order value is mid-range.  
Recommendation: Offer bundle deals, in-cart cross-sell prompts, and loyalty rewards to increase UPT and ATV.

### OTHERS  
This group has the highest number of customers but the lowest spending and UPT.  
Recommendation: Encourage multi-item purchases using free shipping thresholds and affordable product suggestions during checkout.



## Tools Used

- SQL Server Management Studio (SSMS)  
- SQL: Aggregation, Subqueries, Grouping, Filtering  
- Logical segmentation and business insight generation



## Detailed Analysis Report

For in-depth methodology, SQL logic, insights, and recommendations, see the attached documentation:

- [📘 Segmentation_Report.docx](https://docs.google.com/document/d/1vzuOX72GmYidHZQ36gwCPaflaa-RSb3FPOyTlQHCY8U/edit?tab=t.0)



## Key Takeaways

This project demonstrates end-to-end data analytics using SQL and showcases the ability to extract actionable business strategies from transactional datasets. It bridges technical data handling with real-world marketing applications—ideal for roles in data analysis, business intelligence, and growth strategy.
