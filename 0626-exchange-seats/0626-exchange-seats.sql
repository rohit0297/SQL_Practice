# Write your MySQL query statement below
SELECT
    s1.id,
    COALESCE(s2.student, s1.student) AS student
FROM
    Seat s1
LEFT JOIN
    Seat s2
ON 
    (s1.id % 2 = 1 AND s1.id + 1 = s2.id)
    OR
    (s1.id % 2 = 0 AND s1.id - 1 = s2.id)
ORDER BY
    s1.id;