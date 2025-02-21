# Write your MySQL query statement below
SELECT 
    sell_date,
    COUNT(DISTINCT product) AS num_sold,
    GROUP_CONCAT(DISTINCT product ORDER BY product SEPARATOR ',') AS products #aggregation function that combines data from multiple rows into a single string  
FROM
    Activities
GROUP BY 
    sell_date
ORDER BY
    sell_date;