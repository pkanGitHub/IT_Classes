-- List all of the current employees first name, last name, salary and department name. (265332 rows returned)
SELECT b.first_name, b.last_name, a.salary, d.dept_name 
FROM salaries AS a
LEFT JOIN employees AS b ON a.emp_no = b.emp_no
LEFT JOIN dept_emp AS c ON b.emp_no = c.emp_no
LEFT JOIN departments AS d ON c.dept_no = d.dept_no
WHERE a.to_date = '9999-01-01';

-- List the first name, last name, and salary of the current employees with the ten (10) highest salaries. (#1 Salary Tokuyasu 
-- Pesch 158220, #10 salary Weicheng Hatcliff  152687 )
SELECT a.first_name, a.last_name, b.salary
FROM employees AS a
LEFT JOIN salaries AS b ON a.emp_no = b.emp_no
WHERE b.to_date = '9999-01-01'
ORDER BY b.salary DESC
LIMIT 10;

-- What is the total payroll (sum of all current salaries) for the company. (17291866123)
SELECT SUM(a.salary) AS totalPayroll
FROM salaries AS a
WHERE a.to_date = '9999-01-01';

-- Display a list of the unique titles for this company. (7 Titles: Senior Engineer, Staff, Staff 
-- Engineer, Senior Staff, Assistant Engineer, Technique Leader, Manager)
SELECT DISTINCT a.title FROM titles AS a;

-- List the first name, last name, and department name for all current department managers. Remember 
-- that a current manager has a to_date value of 9999-01-01. (9 results)
SELECT a.first_name, a.last_name, c.dept_name
FROM employees AS a
LEFT JOIN dept_manager AS b ON a.emp_no = b.emp_no
LEFT JOIN departments AS c ON b.dept_no = c.dept_no
WHERE b.to_date = '9999-01-01';

-- How many employees does each department currently have? List the department name and number of 
-- employees in a column named “Number of Employees”.
SELECT c.dept_name, COUNT(a.emp_no) AS NumberOfEmployees
FROM employees AS a
LEFT JOIN dept_emp AS b ON a.emp_no = b.emp_no
LEFT JOIN departments AS c ON b.dept_no = c.dept_no
WHERE b.to_date = '9999-01-01'
GROUP BY c.dept_name
ORDER BY c.dept_name; --JUST TO LIST IN THE SAME ORDER AS PROVIDED ANSWER

-- How many males and how many females have been hired by this company in its history?
SELECT a.gender, COUNT(a.emp_no) AS NumberOfEmployees
FROM employees AS a
GROUP BY a.gender;

-- List the titles and the number of current employees that hold that title.
SELECT a.title, COUNT(b.emp_no) AS NumberOfEmployees
FROM titles AS a
LEFT JOIN employees AS b ON a.emp_no = b.emp_no
WHERE a.to_date = '9999-01-01'
GROUP BY a.title;
