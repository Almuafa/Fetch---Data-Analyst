# Fetch---Data-Analyst
# Data Quality and Insights Report

## Overview
As part of this analysis, I reviewed the data from three CSV files: `products.csv`, `transaction.csv`, and `user.csv`. The goal was to identify data quality issues and pinpoint any fields that might be difficult to understand. Below are my findings and recommendations.

---

## 1️⃣ Data Quality Issues

### **Products Data (`products.csv`)**
#### 🔹 **Missing Data**
- **CATEGORY_4** is missing in **92%** of the rows (778,093 out of 845,441), making it almost unusable.
- **MANUFACTURER & BRAND** are missing in **27%** of rows (~226,000 each), which could affect brand-based analysis.
- **CATEGORY_3** has missing values in **7%** of the data (60,566 rows).
- **BARCODE** is missing in about **0.5%** of rows (4,025 missing values).

#### 🔹 **Duplicates**
- There are **215 duplicate rows**, which could cause inaccurate aggregations.

#### 🔹 **Potential Data Issues**
- **BARCODE is stored as a float**, which can lead to rounding errors. It should be treated as a string.
- The most common manufacturer is **“PLACEHOLDER MANUFACTURER”**, which suggests missing or default data.

---

### **Transactions Data (`transaction.csv`)**
#### 🔹 **Missing Data**
- **BARCODE** is missing in **11.5%** of rows (5,762 rows), which could make it harder to link transactions to products.

#### 🔹 **Duplicates**
- There are **171 duplicate rows**, which might indicate repeated records.

#### 🔹 **Potential Data Issues**
- **FINAL_QUANTITY & FINAL_SALE** are stored as text but should be numeric.
- **PURCHASE_DATE & SCAN_DATE** are stored as text instead of date/time.
- Some **BARCODE values are negative**, which doesn’t seem valid.
- **FINAL_SALE has blank values**, which raises questions about whether those transactions had no cost or if data is missing.

---

### **User Data (`user.csv`)**
#### 🔹 **Missing Data**
- **LANGUAGE** is missing in **30.5%** of rows.
- **GENDER** is missing in **6%** of rows.
- **STATE** is missing in **4.8%** of rows.
- **BIRTH_DATE** is missing in **3.7%** of rows.

#### 🔹 **Potential Data Issues**
- **BIRTH_DATE has a common value of `1970-01-01`**, which is likely a default placeholder.
- **GENDER values are inconsistent**, with variations like `non_binary`, `Non-Binary`, and `not_listed` appearing separately.

---

## 2️⃣ Fields That Are Hard to Understand
Some columns contain highly variable data or ambiguous values that make analysis challenging:

### **High-Cardinality Fields** (Many Unique Values)
- **Products:** `CATEGORY_1`, `CATEGORY_2`, `CATEGORY_3`, `CATEGORY_4`, `MANUFACTURER`, `BRAND`
- **Transactions:** `STORE_NAME`, `USER_ID`, `RECEIPT_ID`
- **Users:** `STATE`, `BIRTH_DATE`

These fields may need additional cleaning, grouping, or external reference data to be useful.

### **Inconsistent Categorical Data**
- **GENDER** field has mixed formatting (e.g., `non_binary` vs. `Non-Binary`).
- **BRAND & MANUFACTURER** fields include placeholder values that may need standardization.

### **Suspicious or Placeholder Data**
- `CATEGORY_4` is mostly missing, making it unclear if it’s even useful.
- `FINAL_SALE` contains empty values—are they `0` or true missing data?
- `BIRTH_DATE` is often `1970-01-01`, which might not be a real birthdate.

---

## 3️⃣ Recommendations for Cleanup
✅ Convert **dates to proper datetime format** for accurate time-based analysis.
✅ Standardize **GENDER, MANUFACTURER, and BRAND** values for consistency.
✅ Investigate placeholder values like `PLACEHOLDER MANUFACTURER` to determine if they should be removed or replaced.
✅ Drop or carefully handle `CATEGORY_4`, since it's mostly missing.
✅ Convert `BARCODE` to **string** to avoid formatting issues.
✅ Investigate why **FINAL_SALE has blank values**—does it mean a missing price or a free product?

By implementing these improvements, we can ensure the data is cleaner, more structured, and easier to analyze. 🚀

