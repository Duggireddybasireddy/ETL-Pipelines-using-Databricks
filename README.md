# Databricks Data Pipeline Project

A structured data engineering pipeline built on Databricks that ingests raw data from Volumes, applies data quality transformations, and produces a unified store sales analytical layer — fully automated via a Databricks Workflow.

---

## Table of Contents

- [Project Overview](#project-overview)
- [Architecture](#architecture)
- [Pipeline Layers](#pipeline-layers)
  - [1. Raw Layer — Ingestion](#1-raw-layer--ingestion)
  - [2. Standard Layer — Transformation & Quality](#2-standard-layer--transformation--quality)
  - [3. Distribution Layer — Unified Store Sales](#3-distribution-layer--unified-store-sales)
- [Databricks Workflow](#databricks-workflow)
- [Dataset](#Dataset)

---

## Project Overview

This project implements a **Medallion Architecture** (Raw → Standard → Distribution) on Databricks to process and consolidate store sales data. It covers end-to-end data engineering from ingestion through business-ready reporting tables, with automated orchestration using Databricks Workflows.

---

## Architecture

```
Databricks Volumes
       │
       ▼
  [ RAW Layer ]
  Raw data ingested as-is from source files
       │
       ▼
  [ STANDARD Layer ]
  Data quality checks + transformations applied
  (null handling, numeric validation, cleansing)
       │
       ▼
  [ DISTRIBUTION Layer ]
  Joined & unified store_sales table
  (customers + stores + sales + items)
       │
       ▼
  [ Databricks Workflow ]
  Automated end-to-end orchestration
```

---

## Pipeline Layers

### 1. Raw Layer — Ingestion

**Source:** Databricks Volumes  
**Target:** `raw` schema

Data is ingested from Databricks Volumes into the Raw layer with no transformations applied. This layer preserves the original source data exactly as received, acting as an audit trail and reprocessing source.

- Reads files directly from the configured Databricks Volume path
- Loads data into raw Delta tables
- No transformations or filtering performed at this stage
- Supports full reload and incremental ingestion patterns

---

### 2. Standard Layer — Transformation & Quality

**Source:** `raw` schema  
**Target:** `standard` schema

The Standard layer applies data quality checks and transformations to ensure data integrity before joining.

**Data Quality Rules applied:**

| Rule | Description |
|------|-------------|
| Numeric Validation | Ensures numeric fields satisfy `value >= 0`; negative values are flagged or corrected |
| Null Handling | Null values in numeric columns are replaced with `0` |
| Additional Cleansing | Column-level standardisation, type casting, and other domain-specific checks |

All records passing quality checks are written to the standard layer as clean Delta tables.

---

### 3. Distribution Layer — Unified Store Sales

**Source:** `standard` schema  
**Target:** `distribution` schema

The Distribution layer consolidates multiple domain entities into a single, analytics-ready table.

**Source tables joined:**

| Table | Description |
|-------|-------------|
| Customer Information | Customer demographics and identifiers |
| Store Information | Store location and metadata |
| Sales Information | Transaction-level sales records |
| Items in Store | Product/item catalogue per store |

**Output table:** `store_sales`

All tables are joined on their respective keys to produce a comprehensive `store_sales` table that serves as the primary source for reporting and analytics.

---

## Databricks Workflow

The entire pipeline is automated using a **Databricks Workflow** that orchestrates the three layers in sequence.

**Workflow DAG:**

```
[Ingest: Volumes → Raw]
         │
         ▼
[Transform: Raw → Standard]
         │
         ▼
[Consolidate: Standard → Distribution]
```

**Workflow features:**
- Sequential task execution with dependency management
- Configurable schedule (daily / trigger-based)
- Task-level failure alerts and retry logic
- Cluster reuse across tasks for cost efficiency

To trigger the workflow manually, navigate to **Workflows → your pipeline job → Run Now** in the Databricks UI.

---

## Dataset

TPC-DS Benchmark Dataset, This is the dataset used in this project. Download Dataset from below link
  
  ### [Dataset](https://zenodo.org/records/17866010)
  
---

## Notes

- All tables are stored as **Delta format** for ACID compliance and time-travel support.
- The `store_sales` distribution table is the primary consumption layer for BI tools and downstream analytics.
- Re-running any layer is idempotent — existing data is overwritten cleanly.
