# SQL Data Warehouse and Analytics Project

Welcome to the **SQL Data Warehouse and Analytics Project** repository! 🚀

This project demonstrates the development of a modern Data Warehouse using Microsoft SQL Server, following industry-standard Data Engineering practices. It covers the complete process of building a Data Warehouse, from extracting raw data from multiple source systems to transforming it into business-ready datasets for analytics and reporting.

The project follows **Medallion Architecture (Bronze, Silver, and Gold layers)** to organize and process data efficiently.

## 📌 Project Overview

The objective of this project is to build a centralized SQL Data Warehouse by integrating data from two different source systems:

- **CRM (Customer Relationship Management):** Contains customer information, product details, and sales transactions.
- **ERP (Enterprise Resource Planning):** Contains additional customer information, location details, and product category information.

The extracted data is processed through three layers of Medallion Architecture to produce clean, structured, and business-ready data for analytical purposes.

## 🏗️ Data Architecture

This project follows the **Medallion Architecture**, consisting of three layers:

### 1. Bronze Layer – Raw Data

- Stores raw data extracted from CRM and ERP source systems.
- Loads data from CSV files into SQL Server tables.
- Preserves the original source data without transformations.
- Implements batch processing and full-load ingestion.
- Uses Truncate and Insert loading methodology.

### 2. Silver Layer – Cleaned and Standardized Data

- Performs data cleansing and standardization.
- Removes duplicate records.
- Handles NULL and invalid values.
- Standardizes data formats and data types.
- Performs data normalization and enrichment.
- Integrates data from CRM and ERP systems.

### 3. Gold Layer – Business-Ready Data

- Creates business-oriented data models.
- Implements Star Schema.
- Creates dimension and fact views.
- Applies business rules and aggregations.
- Prepares analytical datasets for reporting and decision-making.

## 🔄 ETL Process

The project implements the ETL (Extract, Transform, Load) process:

1. **Extract:** Collect raw data from CRM and ERP CSV files.
2. **Transform:** Clean, standardize, integrate, and validate data.
3. **Load:** Load processed data into the appropriate Data Warehouse layers.

## 🛠️ Technology Stack

| Technology | Purpose |
|---|---|
| Microsoft SQL Server 2025 Express | Database management system |
| SQL | Data extraction and transformation |
| SQL Server Management Studio 22 | Database development and management |
| Git | Version control |
| GitHub | Source code management |
| Draw.io | Data architecture and data flow diagrams |
| Notion | Project documentation |

## 📂 Repository Structure

```text
sql-data-warehouse-project/
│
├── datasets/
│   ├── source_crm/
│   └── source_erp/
│
├── docs/
│   ├── data_architecture.drawio
│   ├── data_flow.drawio
│   ├── data_integration.drawio
│   ├── data_model.drawio
│   ├── ETL.drawio
│   ├── data_catalog.md
│   └── naming_conventions.md
│
├── scripts/
│   ├── bronze/
│   ├── silver/
│   ├── gold/
│   └── init_database.sql
│
├── tests/
│   ├── quality_checks_silver.sql
│   └── quality_checks_gold.sql
│
├── .gitignore
├── LICENSE
└── README.md
```

## 📊 Data Sources

The project uses six CSV datasets from two source systems.

**CRM Source System**

| File | Description |
|---|---|
| cust_info.csv | Customer information |
| prd_info.csv | Product information |
| sales_details.csv | Sales transaction details |

**ERP Source System**

| File | Description |
|---|---|
| CUST_AZ12.csv | Customer demographic information |
| LOC_A101.csv | Customer location information |
| PX_CAT_G1V2.csv | Product category information |

## 📐 Data Modeling

The Gold layer follows a Star Schema approach consisting of:

- **Dimension Tables:** Store descriptive information about business entities such as customers and products.
- **Fact Tables:** Store measurable business events such as sales transactions.
- **Aggregated Tables:** Provide summarized information for analytical queries.

Planned Gold layer objects:

- `gold.dim_customers`
- `gold.dim_products`
- `gold.fact_sales`

## 🧪 Data Quality and Testing

Data quality is an important part of this project.

The implementation includes validation checks for:

- Duplicate records.
- NULL values.
- Invalid data.
- Primary key uniqueness.
- Data consistency.
- Referential integrity.
- Correct data types.

## 🎯 Project Objectives

Through this project, the following Data Engineering concepts will be explored:

- Data Warehouse architecture.
- Medallion Architecture.
- ETL pipeline development.
- SQL Server database management.
- Data ingestion from multiple source systems.
- Data cleansing and transformation.
- Stored procedures.
- Fact and dimension modeling.
- Star Schema.
- Data quality validation.
- Git and GitHub version control.

## 🚀 Project Status

**Currently in Progress**

The project is being implemented step by step, following the reference tutorial and documenting the practical implementation.

| Phase | Status |
|---|---|
| Requirement Analysis | In Progress |
| Architecture Design | In Progress |
| Environment Setup | Completed |
| GitHub Repository Setup | Completed |
| Bronze Layer | Pending |
| Silver Layer | Pending |
| Gold Layer | Pending |
| Data Quality Testing | Pending |
| Documentation | In Progress |

## 📚 Learning Reference

This project is based on the SQL Data Warehouse from Scratch tutorial by **Data with Baraa**.

The implementation
