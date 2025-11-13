# Data Warehouse and Analytics Project

📊 Welcome to my **Data Warehouse and Analytics Project!** 📊

This is my **first** end-to-end data analytics project. A milestone in my journey to becoming a **data analyst**.

It demonstrates a complete data warehousing and analytics solution, from designing and building the data warehouse to generating actionable insights. Through this project, I applied real-world data engineering and analytics principles while following industry best practices and modern methodologies.

------------------------------------------------------------------------
## Data Architecture
The data architecture for this project follows Medallion Architecture Bronze, Silver, and Gold layers:


<img width="1373" height="655" alt="Untitled Diagram drawio2" src="https://github.com/user-attachments/assets/828cde6b-aefc-430e-94aa-2c99d0c6304d" />

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

## 📜 *License*

This project is licensed under the MIT License.

## 👋 *About Me*

Hi! I’m **Marie Christine Assouad** (*Christine* for short). This project marks the start of my data analytics journey. With a background in mathematics and a unique chapter as the first female Navy lieutenant in my country, I’m now driven by a passion for uncovering insights through data and continuing my education to become a data analyst.
