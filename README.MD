\# Pratap Labs Retail Intelligence



An end-to-end retail analytics solution that transforms synthetic operational data into decision-ready business intelligence using Databricks, Snowflake, dbt and Power BI.



\## Project Objective



The solution provides retail leaders with a consolidated view of sales, profitability, products, stores, customers, inventory and returns. It demonstrates a complete modern analytics workflow—from data generation and transformation to semantic modelling, visualization and automated cloud refresh.



\## Technology Stack



\* Databricks and Apache Spark for synthetic data generation and data-quality transformations

\* Snowflake for cloud data warehousing

\* dbt Core for modular SQL transformations, testing and analytics models

\* Power BI Desktop and Power BI Service for semantic modelling, dashboards and scheduled refresh

\* Git and GitHub for version control and technical documentation



\## Architecture



```mermaid

flowchart LR

&#x20;   A\[Databricks Bronze] --> B\[Databricks Silver]

&#x20;   B --> C\[Snowflake]

&#x20;   C --> D\[dbt Models]

&#x20;   D --> E\[Power BI Semantic Model]

&#x20;   E --> F\[Power BI Reports]

```



\## Data Scope



The synthetic retail dataset contains:



\* 10,000 customers

\* 500 products

\* 25 stores

\* 100,000 orders

\* 300,378 order-item records

\* 28,804 returned items

\* 450,000 inventory snapshots

\* 60 promotions



The analytical period covers 2023 through 2025.



\## Data Engineering



\### Databricks Bronze Layer



The Bronze layer generates and stores raw synthetic retail data for customers, products, stores, orders, order items, returns, inventory snapshots and promotions.



\### Databricks Silver Layer



The Silver layer applies validation, standardization and business rules. It checks identifiers, prices, dates, order status, return timing, inventory conditions and promotional validity.



\### Snowflake Warehouse



Validated datasets are loaded into Snowflake and organized for analytics workloads. Snowflake provides scalable cloud storage and compute for dbt and Power BI.



\### dbt Transformation Layer



The dbt project contains:



\* Source definitions

\* Staging models

\* Customer, product and store dimensions

\* Sales, orders, returns and inventory facts

\* Executive KPI models

\* Daily-sales analytics

\* Customer-value analysis

\* Inventory-risk analysis

\* Product, store and returns analytics

\* Reusable macros and schema tests



\## Power BI Report



The published Power BI report contains seven analytical pages:



1\. Executive Overview

2\. Sales Trends

3\. Product Performance

4\. Store Performance

5\. Customer Analysis

6\. Inventory Risk

7\. Return Analysis



\### Executive KPIs



\* Total Revenue: $111.57M

\* Gross Profit: $42.80M

\* Gross Margin: 38.36%

\* Total Orders: 100,000

\* Units Sold: 750.22K

\* Revenue per Order: $1.12K



\## Deployment and Security



The semantic model is published to Power BI Service and connected to Snowflake through encrypted RSA key-pair authentication.



Deployment features include:



\* Secure Snowflake key-pair authentication

\* Power BI cloud connection mapping

\* Successful on-demand refresh validation

\* Automated daily refresh at 6:00 AM IST

\* Refresh-failure notifications for the semantic-model owner

\* Private keys, credentials, local profiles and generated files excluded from version control



\## Business Value



The solution enables decision-makers to:



\* Monitor revenue, profit and margin performance

\* Identify sales trends and seasonal movement

\* Compare store and regional performance

\* Evaluate product contribution

\* Segment and assess customer value

\* Detect inventory and stock-out risk

\* Analyze returns and refund patterns

\* Receive automatically refreshed reporting



\## Repository Structure



```text

pratap-labs-retail-bi/

├── .gitignore

├── README.md

├── powerbi/

└── retail\_intelligence/

&#x20;   ├── analyses/

&#x20;   ├── macros/

&#x20;   ├── models/

&#x20;   │   ├── staging/

&#x20;   │   └── analytics/

&#x20;   ├── seeds/

&#x20;   ├── snapshots/

&#x20;   ├── tests/

&#x20;   └── dbt\_project.yml

```



\## Security Notice



This repository does not include passwords, private keys, passphrases, authentication tokens, local dbt profiles or Power BI binary files.



\## Status



\* Data engineering: Complete

\* Snowflake warehouse: Complete

\* dbt analytics models: Complete

\* Power BI report: Complete

\* Secure cloud connection: Complete

\* Manual refresh test: Successful

\* Scheduled refresh: Active



\## Author



\*\*Pratap Labs\*\*

Data Science, Analytics, Machine Learning and AI

\[PratapLabs.com](https://prataplabs.com)



