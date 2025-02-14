---
-- Second: provide SQL queries
-- Answer three of the following questions with at least one question coming from the closed-ended and one from the open-ended question set. Each question should be answered using one query.
-- Closed-ended questions:
-- What are the top 5 brands by receipts scanned among users 21 and over?
-- What are the top 5 brands by sales among users that have had their account for at least six months?
-- What is the percentage of sales in the Health & Wellness category by generation?
-- Open-ended questions: for these, make assumptions and clearly state them when answering the question.
-- Who are Fetch’s power users?
-- Which is the leading brand in the Dips & Salsa category?
-- At what percent has Fetch grown year over year?
--------------------------------------------------------------

-- 1. Closed-ended Questions
-- a) What are the top 5 brands by receipts scanned among users 21 and over?

SELECT p.BRAND, COUNT(t.RECEIPT_ID) AS receipts_scanned
FROM transactions t
JOIN users u ON t.USER_ID = u.ID
JOIN products p ON t.BARCODE = p.BARCODE
WHERE (strftime('%Y', 'now') - strftime('%Y', u.BIRTH_DATE)) >= 21
GROUP BY p.BRAND
ORDER BY receipts_scanned DESC
LIMIT 5;

-- b) What are the top 5 brands by sales among users that have had their account for at least six months?

SELECT p.BRAND, SUM(t.FINAL_SALE) AS total_sales
FROM transactions t
JOIN users u ON t.USER_ID = u.ID
JOIN products p ON t.BARCODE = p.BARCODE
WHERE (strftime('%Y', 'now') - strftime('%Y', u.CREATED_DATE)) >= 0.5
GROUP BY p.BRAND
ORDER BY total_sales DESC
LIMIT 5;

-- c) What is the percentage of sales in the Health & Wellness category by generation?

SELECT
    CASE
        WHEN (strftime('%Y', 'now') - strftime('%Y', u.BIRTH_DATE)) BETWEEN 18 AND 25 THEN 'Gen Z'
        WHEN (strftime('%Y', 'now') - strftime('%Y', u.BIRTH_DATE)) BETWEEN 26 AND 40 THEN 'Millennials'
        WHEN (strftime('%Y', 'now') - strftime('%Y', u.BIRTH_DATE)) BETWEEN 41 AND 56 THEN 'Gen X'
        ELSE 'Boomers'
    END AS generation,
    SUM(CASE WHEN p.CATEGORY_1 = 'Health & Wellness' THEN t.FINAL_SALE ELSE 0 END) / SUM(t.FINAL_SALE) * 100 AS percentage_sales
FROM transactions t
JOIN users u ON t.USER_ID = u.ID
JOIN products p ON t.BARCODE = p.BARCODE
GROUP BY generation;

-- 2. Open-ended Questions
-- a) Who are Fetch’s power users?

SELECT u.ID, SUM(t.FINAL_SALE) AS total_sales
FROM transactions t
JOIN users u ON t.USER_ID = u.ID
GROUP BY u.ID
ORDER BY total_sales DESC
LIMIT 10;  -- Top 10 power users

-- b) Which is the leading brand in the Dips & Salsa category?

SELECT p.BRAND, SUM(t.FINAL_SALE) AS total_sales
FROM transactions t
JOIN products p ON t.BARCODE = p.BARCODE
WHERE p.CATEGORY_1 = 'Dips & Salsa'
GROUP BY p.BRAND
ORDER BY total_sales DESC
LIMIT 1;

-- c) At what percent has Fetch grown year over year?

WITH sales_per_year AS (
    SELECT strftime('%Y', t.PURCHASE_DATE) AS year, SUM(t.FINAL_SALE) AS total_sales
    FROM transactions t
    GROUP BY year
)
SELECT
    current_year.year,
    current_year.total_sales,
    previous_year.total_sales,
    ((current_year.total_sales - previous_year.total_sales) / previous_year.total_sales) * 100 AS growth_percentage
FROM sales_per_year current_year
LEFT JOIN sales_per_year previous_year ON current_year.year = strftime('%Y', 'now') - 1
WHERE current_year.year = strftime('%Y', 'now') OR previous_year.year = strftime('%Y', 'now') - 1;
