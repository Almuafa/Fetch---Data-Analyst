# Fetch---Data-Analyst

## Project Overview
This project involves analyzing and cleansing data from Fetch to gain insights and address data quality issues. The data includes information on products, transactions, and users.

## Project Stages

### 1. Data Exploration
- **Objective**: Understand the structure and content of the raw data files.
- **Files**: 
  - `data/raw/products.csv`
  - `data/raw/transaction.csv`
  - `data/raw/user.csv`
- **Activities**:
  - Loaded the raw data into pandas DataFrames.
  - Conducted initial data exploration to identify missing values, duplicates, and data types.

### 2. Data Quality Analysis
- **Objective**: Identify and document data quality issues.
- **Files**: 
  - `notebooks/data-quality-issues.ipynb`
- **Activities**:
  - Checked for missing values, duplicates, and data type mismatches.
  - Documented key data quality issues such as missing `CATEGORY_4` in `products.csv`, missing `BARCODE` in `transaction.csv`, and inconsistent `GENDER` values in `user.csv`.

### 3. Data Cleansing
- **Objective**: Clean the raw data to address identified data quality issues.
- **Files**: 
  - `notebooks/cleansing.ipynb`
  - `data/cleansed/products_cleaned.csv`
  - `data/cleansed/transactions_cleaned.csv`
  - `data/cleansed/users_cleaned.csv`
- **Activities**:
  - Filled missing values with appropriate placeholders.
  - Converted data types to ensure consistency.
  - Removed duplicate rows.
  - Saved the cleaned data to the `data/cleansed` directory.

### 4. Data Analysis
- **Objective**: Perform analysis to gain insights from the cleaned data.
- **Files**: 
  - `notebooks/sql_query.ipynb`
  - `sql/fetch_querys.sql`
- **Activities**:
  - Loaded the cleaned data into a SQLite database.
  - Executed SQL queries to answer business questions such as:
    - Top 5 brands by receipts scanned among users 21 and over.
    - Leading brand in the Dips & Salsa category.
    - Percentage of sales in the Health & Wellness category by generation.
    - Year-over-year growth percentage.

### 5. Communication
- **Objective**: Summarize findings and communicate with stakeholders.
- **Files**: 
  - `email.md`
- **Activities**:
  - Drafted an email to stakeholders summarizing key data quality issues, interesting trends, and requests for action.
  - Highlighted the need for clarification on placeholder values and assistance in standardizing certain fields.

## Conclusion
This project involved a comprehensive analysis and cleansing of Fetch's data to improve data quality and gain valuable insights. The cleaned data and analysis results provide a solid foundation for making informed business decisions.


