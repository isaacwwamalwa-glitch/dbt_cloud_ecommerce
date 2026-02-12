# 📊 E-Commerce Customer Behavior Analytics Platform
*Repository: dbt_cloud_ecommerce*



## 📌 Project Overview

This project is an **end-to-end analytics engineering portfolio project** designed to analyze **e-commerce customer behavior**, revenue performance, and product trends using a modern data stack.

The goal is to demonstrate:
- Sound **data modeling principles** (facts, dimensions, marts)
- **dbt-driven transformations**
- **Business-focused analytics**
- Production-ready **BI consumption** via Looker Studio

The final output enables stakeholders to answer key business questions around **customer acquisition, revenue growth, product performance, and order quality**.

---

## 🏗️ Architecture Overview

**Data Flow**

Raw CSV / Google Sheets
        ↓
BigQuery (raw)
        ↓
dbt (staging → dimensions → facts → marts)
        ↓
BigQuery (analytics-ready marts)
        ↓
Looker Studio dashboards

---

## 🧰 Tech Stack

| Layer | Tool |
|-----|-----|
| Data Warehouse | Google BigQuery |
| Transformations | dbt Cloud (Free Tier) |
| Modeling Paradigm | Kimball-style dimensional modeling |
| BI / Visualization | Looker Studio |
| Version Control | Git & GitHub |

---

## 🗂️ Data Model Structure

The project follows a **layered dbt modeling approach**:

### 🔹 Staging Models (`stg_`)
- Clean and standardize raw data
- Type casting and column renaming
- Minimal business logic

Examples:
- `stg_customers`
- `stg_orders`
- `stg_order_items`
- `stg_products`

### 🔹 Dimension Models (`dim_`)
- Describe core business entities
- One row per entity
- Used for filtering and grouping

Examples:
- `dim_customers`
- `dim_products`

### 🔹 Fact Models (`fct_`)
- Capture atomic business events
- Defined at a clear grain
- Contain numeric, additive measures

Examples:
- `fct_orders` (one row per order)
- `fct_order_items` (one row per product per order)

### 🔹 Mart Models (`mart_`)
- Business-ready, aggregated tables
- Optimized for BI tools
- One mart per business domain

Examples:
- `mart_customer_acquisition`
- `mart_customer_value`
- `mart_revenue`
- `mart_product_performance`
- `mart_order_quality`
- `mart_customer_cohorts`

---

## 📊 Business Questions Answered

### 👥 Customer Acquisition & Growth
- Monthly new customer trends
- Best-performing signup channels
- Country and city-level acquisition

### 💰 Customer Value & Behavior
- Customer lifetime value (LTV)
- First purchase timing
- Top-value customers

### 📈 Sales & Revenue Performance
- Revenue trends over time
- Average order value (AOV)
- Revenue by payment method and geography

### 🛒 Product & Category Performance
- Top-performing products and categories
- Brand-level performance across categories

### ⚠️ Order Quality & Operations
- Percent of completed, cancelled, and returned orders
- Revenue lost to cancellations and returns

### 🔁 Retention & Cohort Analysis
- Customer cohort performance over time
- Revenue evolution by signup cohort

---

## 🧪 Data Quality & Testing

The project uses **dbt schema tests** to ensure data reliability:

- `not_null` and `unique` tests on primary keys
- `accepted_values` tests on categorical fields
- `relationships` tests between facts and dimensions

This ensures:
- Trusted joins
- Consistent metrics
- Early detection of data issues

---

## 📊 Looker Studio Dashboards

Each business domain has a **dedicated Looker Studio page**, powered exclusively by **mart-level models**.

Benefits:
- Simplifies dashboard logic
- Improves performance
- Enforces metric consistency

---

## 🚀 Key Design Decisions

- **Dimensional modeling** separates descriptive context (dimensions) from measurable events (facts)
- **Marts** centralize business logic and avoid duplication in BI tools
- **dbt tests and documentation** enforce data quality and transparency
- **BigQuery** ensures scalability and native Looker integration

---

## 📁 Repository Structure

```text
models/
├── staging/
│   ├── ecommerce/
│   │   ├── stg_customers.sql
│   │   ├── stg_orders.sql
│   │   ├── stg_order_items.sql
│   │   └── stg_products.sql
│   └── schema.yml
├── dimensions/
│   ├── dim_customers.sql
│   ├── dim_products.sql
│   └── schema.yml
├── facts/
│   ├── fct_orders.sql
│   ├── fct_order_items.sql
│   └── schema.yml
└── marts/
    ├── finance/
    │   ├── mart_revenue.sql
    │   └── schema.yml
    ├── marketing/
    │   ├── mart_customer_acquisition.sql
    │   └── schema.yml
    └── product/
        ├── mart_product_performance.sql
        └── schema.yml
seeds/
macros/


### 🔮 Future Improvements

- Add incremental models for large fact tables
- Implement snapshotting for slowly changing dimensions
- Add dbt exposures for BI lineage
- Automate ingestion using Airbyte or Fivetran
- Implement CI checks for dbt runs


### 👤 Author

Isaac Wamalwa  
Data Analyst | Analytics Engineering Enthusiast

### 📎 Notes for Reviewers

This project is designed to mirror real-world analytics workflows, emphasizing:

- clarity over complexity
- scalability over shortcuts
- business impact over vanity metrics

