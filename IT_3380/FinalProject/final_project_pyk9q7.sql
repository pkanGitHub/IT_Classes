-- here are the view tables in order

CREATE VIEW EmployeesPerRegion AS
SELECT a.region_name, COUNT(e.employee_id) AS NumberOfEmployees
FROM regions AS a
JOIN countries AS b ON a.region_id = b.region_id
JOIN locations AS c ON b.country_id = c.country_id
JOIN departments AS d ON c.location_id = d.location_id
JOIN employees AS e ON d.department_id = e.department_id
GROUP BY a.region_id
ORDER BY a.region_id;

CREATE VIEW managers AS
SELECT concat_ws(" ", a.first_name, a.last_name) AS ManagerName, a.phone_number, a.email, c.job_title, b.department_name
FROM employees AS a
LEFT JOIN departments AS b ON a.department_id = b.department_id
LEFT JOIN jobs AS c ON a.job_id = c.job_id
WHERE a.employee_id IN (
    SELECT manager_id
    FROM employees
    GROUP BY manager_id
);

CREATE VIEW DependentsByDepartment AS
SELECT COUNT(c.dependent_id) AS NumberOfDependents, a.department_name 
FROM departments AS a
JOIN employees AS b ON a.department_id = b.department_id
JOIN dependents AS c ON b.employee_id = c.employee_id
GROUP BY a.department_id; 

CREATE VIEW HiresByYear AS
SELECT YEAR(hire_date) AS "Year", COUNT(employee_id) AS NumberOfEmployees
FROM employees
GROUP BY Year
ORDER BY Year;

CREATE VIEW SalaryByDepartment AS
SELECT a.department_name, SUM(b.salary) AS TotalSalaries
FROM departments AS a
JOIN employees AS b ON a.department_id = b.department_id
GROUP BY a.department_name
ORDER BY TotalSalaries;

CREATE VIEW SalaryByJobTitle AS
SELECT b.job_title, SUM(a.salary) AS TotalSalaries
FROM employees AS a
JOIN jobs AS b ON a.job_id = b.job_id
GROUP BY b.job_title;

CREATE VIEW EmployeeDependents AS
SELECT concat_ws(" ", a.first_name, a.last_name) AS EmployeeName, a.email, a.phone_number, COUNT(dependent_id) AS NumberOfDependents
FROM employees AS a
LEFT JOIN dependents AS b ON a.employee_id = b.employee_id
GROUP BY a.employee_id;

CREATE VIEW CountryLocation AS
SELECT a.country_name, COUNT(b.location_id) AS NumberOfLocations
FROM countries AS a
LEFT JOIN locations AS b ON a.country_id = b.country_id
GROUP BY a.country_id;