# Write your MySQL query statement below
SELECT name, unique_id 
FROM employees as emp 
LEFT JOIN employeeUNI as uni
on uni.id = emp.id;