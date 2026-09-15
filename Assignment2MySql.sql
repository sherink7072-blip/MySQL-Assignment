use employee;

SELECT DISTINCT salary
FROM Employees;

SELECT age AS Employee_Age, salary AS Employee_Salary
FROM Employees;

SELECT *
FROM Employees
WHERE salary > 50000 AND hire_date < '2016-01-01';

SELECT * FROM Employees WHERE designation IS NULL;

UPDATE Employees
SET designation = 'Data Scientist'
WHERE designation IS NULL;


SELECT *
FROM Employees
ORDER BY department_id ASC, salary DESC;


SELECT *
FROM Employees
WHERE YEAR(hire_date) = 2018
LIMIT 5;

SELECT SUM(e.salary) AS Total_Finance_Salary
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id
WHERE d.department_name = 'Finance';

SELECT MIN(age) AS Youngest_Employee_Age
FROM Employees;

SELECT location, MAX(salary) AS Max_Salary
FROM Employees
GROUP BY location;


SELECT designation, AVG(salary) AS Avg_Salary
FROM Employees
WHERE designation LIKE '%Analyst%'
GROUP BY designation;

SELECT d.department_name, COUNT(e.employee_id) AS Emp_Count
FROM Departments d
JOIN Employees e ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING COUNT(e.employee_id) < 3;


SELECT location, AVG(age) AS Avg_Female_Age
FROM Employees
WHERE gender = 'Female'
GROUP BY location
HAVING AVG(age) < 30;

SELECT name,designation,department_name
FROM Employees
INNER JOIN Departments d ON department_id = department_id;

SELECT d.department_name, COUNT(e.employee_id) AS Total_Employees
FROM Departments d
LEFT JOIN Employees e ON d.department_id = e.department_id
GROUP BY d.department_name;