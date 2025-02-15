# Write your MySQL query statement below
WITH salary_counts AS (
    SELECT
        CASE 
            WHEN income < 20000 THEN 'Low Salary'
            WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
            ELSE 'High Salary'
        END AS category,
        COUNT(*) AS accounts
    FROM Accounts
    GROUP BY category
)

SELECT categories.category, COALESCE(salary_counts.accounts, 0) AS accounts_count
FROM (
    SELECT 'High Salary' AS category
    UNION ALL
    SELECT 'Low Salary'
    UNION ALL
    SELECT 'Average Salary'
) AS categories
LEFT JOIN salary_counts
ON categories.category = salary_counts.category;