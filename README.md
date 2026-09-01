# Ecommerce Sales & Customer Analytics with SQL (PostgreSQL)

**Author:** Amrita Saha Gupta | Data Analyst  
**Repository:** `ecommerce-sales-analysis-sql`

## Project Overview
An end-to-end data analytics project analyzing **40,000 transactions** and **8,800 customers** from a live PostgreSQL ecommerce database. This project evaluates core executive questions regarding overall revenue health, monthly sales dynamics, and customer value concentration to identify growth opportunities.

The database spans transactions from March 2026 through June 2026, generating **$239.58M in gross lifetime revenue** with an Average Order Value (AOV) of **$6,334.51**.

---

## Key Business Insights
1. **Extreme Customer Concentration:** VIP Buyers (5+ orders) account for only **26.1% of the customer base** (2,614 users) but generate **78.0% of total lifetime revenue** ($152.27M). One-time buyers comprise 50.0% of users but yield just 12.6% of sales.
2. **Q2 Revenue Velocity Spike:** Monthly sales peaked in **April 2026 at $104.25M** across 16,352 orders—an **82.2% revenue increase** over March 2026 ($57.22M), driven by heavy volume expansion rather than price changes.
3. **High-Value Product Drivers:** Revenue is heavily weighted toward high-end wearables and audio gear, led by the **Vastra Craft Pulse Kids Smartwatch** ($1.41M total revenue) and **Silverbirch Works Trek GPS Watch** ($1.36M total revenue).

---

## Repository Structure
```text
├── sql/
│   ├── 01_exploration.sql     # Database schema inspection & high-level counts
│   ├── 02_revenue.sql         # Monthly and annual revenue trends & AOV tracking
│   └── 03_customers.sql       # RFM segmentation & lifetime value analysis
├── findings/
│   ├── 00_executive_summary.md # 3-takeaway executive overview
│   ├── 01_business_overview.md # Core database metrics & product performance
│   ├── 02_business_health.md   # Revenue growth trajectory & seasonality
│   └── 03_customer_segments.md # Customer value tiers & retention insights
└── README.md