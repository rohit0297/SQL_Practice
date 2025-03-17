# Write your MySQL query statement below
SELECT
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM
    Employee e
    JOIN Department d
    ON e.departmentId = d.id
WHERE 3 > (
    SELECT COUNT(DISTINCT(e2.salary))
    FROM Employee e2
    WHERE e2.salary > e.salary
    AND e.departmentId = e2.departmentId
)