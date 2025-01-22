SELECT
    e1.name as name
FROM 
    Employee e1 
    JOIN 
        Employee e2
    ON e1.id = e2.managerId
GROUP BY e2.managerID
HAVING count(e2.managerId) >=5
