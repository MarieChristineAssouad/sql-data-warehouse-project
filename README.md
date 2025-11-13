# Data Warehouse and Analytics Project

📊 Welcome to my **Data Warehouse and Analytics Project!** 📊

This is my **first** end-to-end data analytics project. A milestone in my journey to becoming a **data analyst**.

It demonstrates a complete data warehousing and analytics solution, from designing and building the data warehouse to generating actionable insights. Through this project, I applied real-world data engineering and analytics principles while following industry best practices and modern methodologies.

------------------------------------------------------------------------
## 🏗️ Data Architecture
The data architecture for this project follows Medallion Architecture Bronze, Silver, and Gold layers:

<img width="1383" height="665" alt="Untitled Diagram drawio" src="https://github.com/user-attachments/assets/30e59eda-519f-44a6-a720-84d6b29ddd0c" />

1. **Bronze Layer**: Stores raw data as-is from the source systems. Data is ingested from CSV Files into SQL Server Database.
2. **Silver Layer**: This layer includes data cleansing, standardization, and normalization processes to prepare data for analysis.
3. **Gold Layer**: Houses business-ready data modeled into a star schema required for reporting and analytics.

------------------------------------------------------------------------
## 📖 PROJECT OVERVIEW
This project involves:

1. Data Architecture: Designing a Modern Data Warehouse Using Medallion Architecture Bronze, Silver, and Gold layers.
2. ETL Pipelines: Extracting, transforming, and loading data from source systems into the warehouse.
3. Data Modeling: Developing fact and dimension tables optimized for analytical queries.
4. Analytics & Reporting: Creating SQL-based reports and dashboards for actionable insights.
   
This repository is an excellent resource for professionals and students looking to showcase expertise in:

  - SQL Development
  - Data Architect
  - Data Engineering
  - ETL Pipeline Developer
  - Data Modeling
  - Data Analytics
------------------------------------------------------------------------
## 💡 PROJECT REQUIREMENTS

### Building the Data Warehouse (Data Engineering)

#### *Objective*

Design and implement a modern data warehouse using SQL Server, consolidating sales data from multiple systems to support analytical reporting and data-driven decision-making.

#### *Specifications*

- **Data Sources**: Ingest data from two core systems (ERP and CRM) provided as *CSV* files.

- **Data Quality**: Apply data-cleaning logic using SQL functions such as TRIM(), NULLIF(), and COALESCE() to handle missing or inconsistent values.

- **Integration**: Use JOINs, CTEs, and UNIONs to merge both data sources into a single data model optimized for analytical queries.

- **Scope**: Focus on the latest dataset snapshot for current insights; historization and change-tracking not required.

- **Documentation**: Provide clear documentation of the data model to support both business *stakeholders* and *analytics teams*.


------------------------------------------------------------------------

### BI: Analytics & Reporting (Data Analytics)

#### *Objective*

Develop SQL-based analytics and business intelligence reports to uncover actionable insights on:

- **Customer Behavior**: identify retention patterns, purchase frequency, and churn indicators using window functions like RANK() and LAG().

- **Product Performance**: calculate KPIs such as revenue contribution and profitability by product category.

- **Sales Trends**: analyze growth over time using date aggregation and rolling averages.


These analytical queries deliver key performance metrics and data-backed insights to support strategic decision-making across teams.

------------------------------------------------------------------------

### 📂 Repository Structure

data-warehouse-project/
│
├── datasets/                           # Raw datasets used for the project (ERP and CRM data)
│
├── docs/                               # Project documentation and architecture details
│   ├── etl.drawio                      # Draw.io file shows all different techniquies and methods of ETL
│   ├── data_architecture.drawio        # Draw.io file shows the project's architecture
│   ├── data_catalog.md                 # Catalog of datasets, including field descriptions and metadata
│   ├── data_flow.drawio                # Draw.io file for the data flow diagram
│   ├── data_models.drawio              # Draw.io file for data models (star schema)
│   ├── naming-conventions.md           # Consistent naming guidelines for tables, columns, and files
│
├── scripts/                            # SQL scripts for ETL and transformations
│   ├── bronze/                         # Scripts for extracting and loading raw data
│   ├── silver/                         # Scripts for cleaning and transforming data
│   ├── gold/                           # Scripts for creating analytical models
│
├── tests/                              # Test scripts and quality files
│
├── README.md                           # Project overview and instructions
├── LICENSE                             # License information for the repository
├── .gitignore                          # Files and directories to be ignored by Git
└── requirements.txt                    # Dependencies and requirements for the project
------------------------------------------------------------------------

## 📜 *License*

This project is licensed under the MIT License.

## 👋 *About Me*

Hi! I’m **Marie Christine Assouad** (*Christine* for short). This project marks the start of my data analytics journey. With a background in mathematics and a unique chapter as the first female Navy lieutenant in my country, I’m now driven by a passion for uncovering insights through data and continuing my education to become a data analyst.
