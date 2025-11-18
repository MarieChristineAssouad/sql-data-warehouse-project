# Data Warehouse and Analytics Project

📊 Welcome to my *Data Warehouse and Analytics Project!*  
This is my first end-to-end analytics project and a milestone in my journey toward becoming a *data analyst*.

It demonstrates a complete workflow—from designing and building a SQL-based data warehouse to running analytical SQL queries and generating business insights.

---

## 🏗️ Data Architecture

This warehouse follows the *Medallion Architecture* (Bronze → Silver → Gold):

<img width="1383" height="665" alt="Untitled Diagram drawio" src="https://github.com/user-attachments/assets/30e59eda-519f-44a6-a720-84d6b29ddd0c" />

1. *Bronze Layer*  
   Raw CSV data ingested into SQL Server.

2. *Silver Layer*  
   Cleaned and standardized using functions like TRIM(), NULLIF(), and COALESCE().

3. *Gold Layer*  
   Business-ready fact & dimension tables modeled into a star schema.

------------------------------------------------------------------------
## 📖 Project Overview

This project includes:

- *Data Architecture* – Designing and implementing a SQL data warehouse  
- *ETL Pipelines* – Ingesting and transforming CSV data  
- *Data Modeling* – Creating fact/dim tables for analytics  
- *Business Analytics* – Generating insights with SQL  

It demonstrates skills across:

- SQL Development  
- Data Engineering  
- Data Modeling  
- Data Analytics
------------------------------------------------------------------------
## 💡 Project Requirements

### 🎯 Objective  
Build a modern data warehouse in SQL Server to consolidate sales data and support analytical reporting.

### 🔧 Specifications  
- *Data Sources:* Two CSV datasets from ERP and CRM systems  
- *Data Quality:* Clean and standardize values using SQL functions  
- *Integration:* Merge datasets using JOINs, CTEs, UNIONs  
- *Scope:* Focus on a single snapshot (no historical SCD needed)  
- *Documentation:* Provide clear modeling & analytics documentation  

This requirement set mirrors real-world expectations for junior data engineering and analytics roles.


------------------------------------------------------------------------

## 📊 Data Analysis

The project includes several exploratory and analytical SQL scripts.

### 🔹 Magnitude Analysis  
Breaks down the business across key dimensions:
- Customers by country and gender  
- Products and categories  
- Revenue by category  
- Revenue by customer  

### 🔹 Ranking Analysis  
Identifies performance insights:
- Top 5 products (simple + window function)  
- Bottom 5 products  
- Customers with the fewest orders  

### 🔹 KPI & Measure Exploration  
Generates a consolidated KPI table with:
- Total sales  
- Total quantity sold  
- Average price  
- Total orders  
- Total products & customers  

### 🔹 Dimensional Exploration  
Validates dimension structure:
- Categories & subcategories  
- Customer geography  
- Column metadata  

### 🔹 Date Exploration  
Evaluates dataset coverage:
- First & last order dates  
- Months/years of data  
- Youngest & oldest customers  

These analyses reflect real workflows used by analysts and BI teams.

---

------------------------------------------------------------------------

### 📂 Repository Structure

<img width="571" height="390" alt="Untitled Diagram drawio png3" src="https://github.com/user-attachments/assets/e13cac9f-0f48-4c8b-8909-97571d412522" />

------------------------------------------------------------------------

## 📜 *License*

This project is licensed under the MIT License.

## 👋 *About Me*

Hi! I’m **Marie Christine Assouad** (*Christine* for short). This project marks the start of my data analytics journey. With a background in mathematics and a unique chapter as the first female Navy lieutenant in my country, I’m now driven by a passion for uncovering insights through data and continuing my education to become a data analyst.
