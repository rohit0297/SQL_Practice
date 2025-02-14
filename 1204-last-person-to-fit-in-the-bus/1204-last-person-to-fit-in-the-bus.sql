# Write your MySQL query statement below
WITH AccumulatedWeight AS (
    SELECT
        *,
        SUM(weight) OVER (ORDER BY turn) AS total_weight
    FROM
        Queue
)

SELECT
    person_name
FROM
    AccumulatedWeight
WHERE
    total_weight <= 1000
ORDER BY turn DESC
LIMIT 1;