-- Write a query to create a view named “EmployeesPerRegion” that shows the region_name and the number of employees from that region in a column called “Number of Employees”.
CREATE VIEW EmployeesPerRegion AS
SELECT a.region_name, COUNT(e.employee_id) AS NumberOfEmployees
FROM regions AS a
JOIN countries AS b ON a.region_id = b.region_id
JOIN locations AS c ON b.country_id = c.country_id
JOIN departments AS d ON c.location_id = d.location_id
JOIN employees AS e ON d.department_id = e.department_id
GROUP BY a.region_id
ORDER BY a.region_id;
    -- Query the EmployeesPerRegion to show the number of employees from the Americas.
    SELECT * FROM EmployeesPerRegion WHERE region_name="Americas";

-- Write a query to create a view named “managers” to display all the managers. Include the manager’s name (first, last), phone number, email, job title, and department name.
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
    -- Query the managers view to show the number of managers in each department.
    SELECT department_name, COUNT(*) AS NumberOfManager FROM managers GROUP BY department_name;

-- Write a query to create a view named “DependentsByDepartment” to get a count of how many dependents there are in each department.
CREATE VIEW DependentsByDepartment AS
SELECT COUNT(c.dependent_id) AS NumberOfDependents, a.department_name 
FROM departments AS a
JOIN employees AS b ON a.department_id = b.department_id
JOIN dependents AS c ON b.employee_id = c.employee_id
GROUP BY a.department_id; 
    -- Query the DependentsByDepartment view to show the department with the largest number of dependents. This should show the department name and the number of dependents.
    SELECT department_name, NumberOfDependents 
    FROM DependentsByDepartment 
    ORDER BY NumberOfDependents DESC
    LIMIT 2; 

-- Write a query to create a view named “HiresByYear” that calculates the number of employees hired each year. Remember the SQL $year function.
CREATE VIEW HiresByYear AS
SELECT YEAR(hire_date) AS "Year", COUNT(employee_id) AS NumberOfEmployees
FROM employees
GROUP BY Year
ORDER BY Year;
    -- Query the HiresByYear view to show the number of hires in 1997.
    SELECT * FROM HiresByYear WHERE Year="1997";

-- Write a query to create a view named “SalaryByDepartment” to calculate total salaries for each department.
CREATE VIEW SalaryByDepartment AS
SELECT a.department_name, SUM(b.salary) AS TotalSalaries
FROM departments AS a
JOIN employees AS b ON a.department_id = b.department_id
GROUP BY a.department_name
ORDER BY TotalSalaries;
    -- Query the SalaryByDepartment view to show the total salary for the Finance department.
    SELECT * FROM SalaryByDepartment WHERE department_name="Finance";

-- Write a query to create a view named “SalaryByJobTitle” to calculate total salaries for each job title.
CREATE VIEW SalaryByJobTitle AS
SELECT b.job_title, SUM(a.salary) AS TotalSalaries
FROM employees AS a
JOIN jobs AS b ON a.job_id = b.job_id
GROUP BY b.job_title;
    -- Query the SalaryByJobTitle view to show the job title and total salary for the title with the highest total salary.
    SELECT * 
    FROM SalaryByJobTitle 
    ORDER BY TotalSalaries DESC
    LIMIT 1;

-- Write a query to create a view named “EmployeeDependents” that calculates the number of dependents each employees has. This query should show employees even if they have 0 dependents. Display the employee name (first, last), email, phone number, and number of dependents. Hint: left or right join.
CREATE VIEW EmployeeDependents AS
SELECT concat_ws(" ", a.first_name, a.last_name) AS EmployeeName, a.email, a.phone_number, COUNT(dependent_id) AS NumberOfDependents
FROM employees AS a
LEFT JOIN dependents AS b ON a.employee_id = b.employee_id
GROUP BY a.employee_id;
    -- Query the EmployeeDependents view to show employees with no children". Show employee name (first, last), email, phone number, and number of dependents.
    SELECT * FROM EmployeeDependents WHERE NumberOfDependents=0;

-- Write a query to create a view named “CountryLocation” that calculates the number of locations in each country. This query should show countries even if they have 0 locations. Display the country name and number of locations.
CREATE VIEW CountryLocation AS
SELECT a.country_name, COUNT(b.location_id) AS NumberOfLocations
FROM countries AS a
LEFT JOIN locations AS b ON a.country_id = b.country_id
GROUP BY a.country_id;
    -- Query the CountryLocation view to show countries with no locations". Show country name and number of locations.
    SELECT * FROM CountryLocation WHERE NumberOfLocations=0;