SELECT
    e1.name
FROM 
    Employee e1
JOIN (SELECT managerID, count(managerID) as reportcount
    FROM Employee 
    GROUP  BY managerID
    HAVING count(*) >= 5) e2
ON
    e1.id = e2.managerId;