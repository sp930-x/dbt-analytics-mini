# dbt Analytics Engineering Mini Project
Layered Data Modeling for B2B SaaS / Subscription / FinTech Workloads

---

## Overview

This project demonstrates a modern analytics engineering workflow using dbt and DuckDB, inspired by real-world B2B SaaS and subscription-based business models (e.g., Payroll, HRIS, FinTech platforms).

Focus areas:

- Layered data modeling (sources -> staging -> marts)
- Clear separation between source cleaning and business logic
- Reusable SQL macros
- Data quality tests
- Explicit metric definitions for revenue reporting

---

## Data Model Architecture

Raw (Seeds)
  - customers
  - products
  - invoices
        ↓
Staging Layer
  - stg_customers
  - stg_products
  - stg_invoices
        ↓
Mart Layer
  - dim_customers
  - dim_products
  - fct_invoices
  - kpi_monthly_revenue

---

## Design Principles

Staging Layer:
- Type casting
- Standardization (e.g., lower(status))
- Minimal business logic
- Close to source

Mart Layer:
- Business logic & metric definitions
- Fact & Dimension modeling (Star Schema)
- Revenue definition explicitly tied to status = 'paid'

---

## Example Metric Definition

Monthly revenue is defined as:

- Revenue is recognized only for invoices where status = 'paid'
- Aggregated by month and customer country

Example logic:

where status = 'paid'

This approach ensures:
- Consistent metric definitions
- Transparent business logic
- Reproducible reporting

---

## Data Quality

The project includes:

- not_null tests
- unique constraints
- accepted_values validation for invoice status
- Reusable SQL macro (normalize_currency)

---

## Why This Matters for SaaS / FinTech

Subscription-based and payroll platforms require:

- Clear metric ownership (Revenue vs Invoice Issued)
- Traceable transformations
- Version-controlled data models
- Separation between raw ingestion and business logic
- Reproducible KPI calculations

This project demonstrates those patterns in a simplified environment.

---

## How to Run

dbt seed --full-refresh
dbt run
dbt test
dbt docs generate

---

## Tech Stack

- dbt Core
- DuckDB
- SQL (with Jinja templating)
- Git version control

---

## Future Extensions

- Snapshot for invoice status history (SCD Type 2)
- Multi-currency normalization logic
- Feature store–ready aggregation layer
- Integration with BI tools (Looker / Tableau)
