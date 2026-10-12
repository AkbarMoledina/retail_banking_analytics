# Retail Banking Analytics

> ⚠️ **Work in Progress** — Data loading and staging layers are complete. Dimensional modelling, fact tables, marts and visualisation layers are actively in development.

An end-to-end analytics engineering project modelling retail banking data using dbt and Snowflake. Built on the [Berka dataset](https://www.kaggle.com/datasets/marceloventura/the-berka-dataset) — a real anonymised dataset from a Czech bank, containing over 1 million transactions across 5,300+ clients.

The project demonstrates production-grade analytics engineering patterns including a Kimball-style star schema, incremental fact table materialisations, surrogate keys, and comprehensive dbt testing.

---

## Tech Stack

| Layer | Tool |
|---|---|
| Data Warehouse | Snowflake |
| Transformation | dbt Core |
| Visualisation | Evidence.dev |
| Version Control | GitHub |

---

## Data Source

The [Berka dataset](https://www.kaggle.com/datasets/marceloventura/the-berka-dataset) is a real anonymised financial dataset released for a data mining competition. It contains 8 related tables covering accounts, clients, transactions, loans, credit cards and geographic districts.

Raw tables were loaded into Snowflake via the Snowflake UI as a one-time ingestion step. In a production environment this would be handled by a managed EL tool such as Fivetran or Airbyte.

---

## Project Architecture

```
RAW (Snowflake)
    └── accounts, cards, clients, dispositions, districts, loans, orders, transactions

DEV_STAGING (dbt views)
    └── stg_accounts, stg_cards, stg_clients, stg_dispositions, stg_districts, stg_loans, stg_orders, stg_transactions
```

---

## Status

| Layer | Status |
|---|---|
| Raw data ingestion | ✅ Complete |
| Staging models | ✅ Complete |
| Dimensions | 🔄 In development |
| Fact tables | 🔄 In development |
| Marts | 🔄 In development |
| dbt tests | 🔄 In development |
| dbt documentation | 🔄 In development |
| Evidence.dev report | 🔄 In development |

---

## Key Analytical Questions

The marts layer will be designed to answer the following:

- **Customer segmentation** — Which clients are high, medium and low value based on transaction behaviour?
- **Loan customer characteristics** — What account and client characteristics are associated with customers with loans?
- **Transaction behaviour** — How does spending behaviour change before and after a loan is issued?
- **Regional analysis** — How does credit performance and transaction volume vary by district?

---

## Project Structure

```
retail_banking_analytics/
├── models/
│   ├── staging/
│   │   └── stg_*.sql
│   ├── intermediate/
│   ├── marts/
│   └── sources.yml
├── macros/
├── tests/
├── seeds/
└── dbt_project.yml
```
---
