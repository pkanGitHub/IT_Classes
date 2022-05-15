-- 1. List all of the current employees first name, last name, salary and department name.
select e.first_name, e.last_name, s.salary, d.dept_name
from employees e, salaries s, dept_emp de, departments d
where e.emp_no = s.emp_no AND e.emp_no = de.emp_no AND de.dept_no = d.dept_no AND s.to_date = "9999-01-01";

select e.first_name, e.last_name, s.salary, d.dept_name
from employees e, salaries s, departments d, dept_emp f
where e.emp_no = s.emp_no AND d.dept_no = f.dept_no AND s.to_date = "9999-01-01";

-- 2. List the first name, last name, and salary of the current employees with the ten (10) highest salaries.
select e.first_name, e.last_name, s.salary
from employees e, salaries s
where e.emp_no = s.emp_no AND s.to_date = "9999-01-01"
order by s.salary DESC
limit 10;


--3. What is the total payroll (sum of all current salaries) for the company.
select sum(s.salary) as "Total Salary"
from salaries s
where s.to_date = "9999-01-01";


-- 4. Display a list of the unique titles for this company
select title
from titles
group by title;

-- 5. List the first name, last name, and department name for all current department managers. 
-- Remember that a current manager has a to_date value of 9999-01-01.

select e.first_name, e.last_name, d.dept_name
from employees e, dept_manager dm, departments d
where e.emp_no = dm.emp_no AND dm.dept_no = d.dept_no AND dm.to_date = "9999-01-01";

-- 6. How many employees does each department currently have? 
-- List the department name and number of employees in a column named “Number of Employees”.
select d.dept_name, count(de.dept_no) as "Number of Employees"
from departments d, dept_emp de
where d.dept_no = de.dept_no AND de.to_date = "9999-01-01"
group by d.dept_name;

SELECT d.dept_name, COUNT(e.emp_no) AS "NumberOfEmployees"
FROM departments d, dept_emp de
WHERE de.dept_no = d.dept_no AND de.to_date = "9999-01-01"
GROUP BY d.dept_name;
ORDER BY COUNT(e.emp_no);

-- 7. How many males and how many females have been hired by this company in its history?
select e.gender, count(e.gender) AS "Number of Employees"
from employees e
group by e.gender;

-- 8. List the titles and the number of current employees that hold that title.
select t.title, count(e.emp_no) as "Number of Employees"
from employees e, titles t
where e.emp_no = t.emp_no AND t.to_date = "9999-01-01"
group by t.title;
