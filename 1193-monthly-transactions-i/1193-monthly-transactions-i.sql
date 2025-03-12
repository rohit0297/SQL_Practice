# Write your MySQL query statement below
SELECT
    DATE_FORMAT(trans_date, '%Y-%m') AS month, #extracted year and month
    country,
    COUNT(id) AS trans_count, # total number of transactions
    COUNT(CASE WHEN state = "approved" THEN id END) AS approved_count, # total number of approved transactions
    SUM(amount) AS trans_total_amount, # total amount of all transactions
    COALESCE(SUM(CASE WHEN state = "approved" THEN amount END), 0) AS approved_total_amount # total amount of approved transactions
FROM
    Transactions
GROUP BY
    month, country