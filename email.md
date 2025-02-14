# Third: communicate with stakeholders
Construct an email or slack message that is understandable to a product or business leader who is not familiar with your day-to-day work. 

### Summarize the results of your investigation. Include:
1. Key data quality issues and outstanding questions about the data
    a. One interesting trend in the data
2. Use a finding from part 2 or come up with a new insight
3. Request for action: explain what additional help, info, etc. you need to make sense of the data and resolve any outstanding issues

-------------------------------------------------------------------

Subject: Data Quality Issues and Insights from Recent Analysis.

Hello Stakeholders,

I hope this message finds you well. I wanted to share some key findings from our recent data quality analysis of the getch datasets (products.csv, transaction.csv, and user.csv). Below is a summary of the results:

Key Data Quality Issues:

Products Data (products.csv)

Missing Data:
CATEGORY_4 is missing in 92% of the rows, making it almost unusable.
MANUFACTURER and BRAND are missing in 27% of rows, which could affect brand-based analysis.
CATEGORY_3 has missing values in 7% of the data.
BARCODE is missing in about 0.5% of rows.
Duplicates: There are 215 duplicate rows, which could cause inaccurate aggregations.
Potential Data Issues: 
BARCODE is stored as a float, which can lead to rounding errors. It should be treated as a string.

Transactions Data (transaction.csv)

Missing Data: 
BARCODE is missing in 11.5% of rows, which could make it harder to link transactions to products.
Duplicates: There are 171 duplicate rows, which might indicate repeated records.
Potential Data Issues:
FINAL_QUANTITY and FINAL_SALE are stored as text but should be numeric.
PURCHASE_DATE and SCAN_DATE are stored as text instead of date/time.
Some BARCODE values are negative, which doesn’t seem valid.
FINAL_SALE has blank values, raising questions about whether those transactions had no cost or if data is missing.

User Data (user.csv)

Missing Data:
LANGUAGE is missing in 30.5% of rows.
GENDER is missing in 6% of rows.
STATE is missing in 4.8% of rows.
BIRTH_DATE is missing in 3.7% of rows.
Potential Data Issues:
BIRTH_DATE has a common value of 1970-01-01, which is likely a default placeholder.
GENDER values are inconsistent, with variations like non_binary, Non-Binary, and not_listed appearing separately.

Interesting Trend:
One interesting trend we observed is that the Health & Wellness category is the most common in the products.csv file, indicating a significant focus on this category among our products.

New Insight:
From our analysis, we found that users aged 26-40 (Millennials) have the highest percentage of sales in the Health & Wellness category. This insight can help us tailor our marketing strategies to target this demographic more effectively.

Request for Action:
To resolve the outstanding data quality issues and gain more accurate insights, we need the following:

Clarification on Placeholder Values: Understanding why BIRTH_DATE often defaults to 1970-01-01 and if there are any other placeholder values we should be aware of.
Standardization Guidelines: Assistance in standardizing GENDER, MANUFACTURER, and BRAND values to ensure consistency.
Data Correction: Help in correcting negative BARCODE values and ensuring FINAL_SALE values are accurately recorded.
Your support in addressing these issues will be invaluable in improving our data quality and enabling more precise analysis. Please let me know if you need any further details or if we can discuss this in more detail.

Best regards,

Ahmed Almuafa 
Data Analytics Team.
