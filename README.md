# Google Merchandise Store Ecommerce Performance Dashboard

## Project Overview

This project analyzes Google Merchandise Store ecommerce data using BigQuery SQL and visualizes the results in Looker Studio. The goal was to answer business questions around monthly revenue trends, traffic-channel performance, product demand, product conversion risk, and geographic revenue concentration.

## Dashboard Preview

The final dashboard is available in the `dashboard/` folder as a PDF export.

## Tools Used

- Google BigQuery
- SQL
- Google Sheets
- Looker Studio
- GitHub

## Dataset

- Source: BigQuery Public Dataset
- Project: `data-to-insights`
- Dataset: `ecommerce`
- Main table: `all_sessions`

## Business Questions

1. How did ecommerce revenue, sessions, and conversion rate change month over month?
2. Which traffic channels drove the most traffic, purchases, revenue, and conversion?
3. Which products generated the most units ordered and product revenue?
4. Which high-view products showed weak conversion behavior?
5. Which countries contributed the most ecommerce revenue?

## Key Metrics

- Total revenue
- Total sessions
- Unique visitors
- Conversion rate
- Revenue per session
- Average order value
- Product views
- Units ordered
- View-to-order rate
- Country-level revenue

## Key Findings

- The store generated approximately **$15.7M** in revenue across **524K sessions** and **420K unique visitors**.
- April 2017 generated the highest monthly revenue at approximately **$2.1M**, about **1.75x higher** than the monthly average.
- December 2016 had the strongest conversion rate at **7.15%**, about **1.6x higher** than the average.
- Organic Search drove the most traffic with **255K sessions**, nearly **49%** of total traffic.
- Referral had the strongest conversion rate at **12.19%**, about **7.7x higher** than Organic Search.
- Direct generated the highest revenue at approximately **$5.9M**.
- Google Men's Vintage Badge Tee led units ordered with **702K units**.
- Nest Learning Thermostat generated the highest product revenue at approximately **$870.7K**.
- The United States contributed about **95%** of total revenue.

## Recommendations

- Review April 2017 product mix and order values to identify what drove the revenue peak.
- Study December 2016 conversion behavior to identify tactics that can improve lower-converting months.
- Use Organic Search as a reach channel, but optimize organic landing pages to improve conversion.
- Study Referral and Direct traffic patterns because they show stronger purchase intent.
- Separate product volume analysis from revenue analysis because the highest-unit product is not always the highest-revenue product.
- Review high-view, low-conversion products for pricing, product-page content, or purchase-intent issues.
- Treat the United States as the core market while testing growth opportunities in Canada and other smaller markets.

## Repository Structure

```text
.
├── dashboard/
│   └── Google_Merchandise_Store_Ecommerce_Dashboard.pdf
├── data/
│   └── Ecommerce_dashboard_data.xlsx
├── insights/
│   └── business_insights.md
├── sql/
│   ├── 01_month_over_month_trend.sql
│   ├── 02_channel_performance.sql
│   ├── 03_top_products_ordered.sql
│   ├── 04_products_fail_to_convert.sql
│   └── 05_revenue_by_country.sql
└── README.md
```

## SQL Skills Demonstrated

- Aggregations
- Common table expressions
- Date parsing and formatting
- Conversion-rate calculations
- Revenue normalization
- Session-level analysis
- Product-level analysis
- Channel performance analysis
- Geographic analysis

## Dashboard Pages

### Page 1: Executive Overview
Summarizes revenue, sessions, visitors, conversion rate, monthly revenue trend, and traffic vs conversion performance.

### Page 2: Channel Performance
Compares traffic share, revenue, and conversion performance across channels such as Organic Search, Referral, Direct, Paid Search, Social, and Display.

### Page 3: Product & Geographic Performance
Highlights top products by units ordered, revenue by country, low-conversion products, and product/geographic recommendations.

## Project Summary

This project demonstrates how SQL and BI tools can be used together to move from raw ecommerce data to business-ready insights. The analysis separates traffic volume from traffic quality, product demand from revenue contribution, and overall revenue performance from conversion efficiency.
