
-- 1. Write a query to create a view named "SFEmployees" for those salespeople who work in the San Francisco office. 
--Include the employee name (first, last), number, email, and job title.
CREATE VIEW SFEmployees AS
SELECT e.employeenumber, e.firstName, e.lastName, e.email, e.jobTitle
FROM employees e, offices o
WHERE e.officeCode = o.officeCode and o.city = "San Francisco";

-- OR

CREATE VIEW SFEmployees AS
SELECT e.employeenumber, e.firstName, e.lastName, e.email, e.jobTitle
FROM employees e
JOIN offices o ON e.officeCode = o.officeCode
WHERE o.city = "San Francisco";

    -- Query the view to count the number of employees in the San Francisco office.
SELECT COUNT(employeenumber) AS "Number of Employees"
FROM SFEmployees;

-- 2.Write a query to create a view named "managers" to display all the managers. 
--Include the manager’s name (first, last), number, email,  job title, and office city.
CREATE VIEW managers AS
SELECT e.employeeNumber, e.firstName, e.lastName, e.email, e.jobTitle, o.city
FROM employees e, offices o
WHERE e.officeCode = o.officeCode and e.employeeNumber IN (SELECT reportsTo from employees);

-- OR
CREATE VIEW managers AS
SELECT e.employeeNumber, e.firstName, e.lastName, e.email, e.jobTitle, o.city
FROM employees e
JOIN offices o ON e.officeCode = o.officeCode
WHERE e.employeeNumber IN (SELECT reportsTo from employees);


    --   Query the view to show the number of managers in each city.
SELECT city, COUNT(city) as "Number of Employees in City"
FROM managers
GROUP BY city
ORDER by COUNT(city) DESC;

-- 3.Write a query to create a view named "custByCity" to get a count of how many customers there are in each city.
CREATE VIEW custByCity AS
SELECT city, COUNT(city) AS "Customers in City"
FROM customers
GROUP BY city
ORDER by COUNT(city) DESC;

--    Query the view to show the number of customers in Singapore.
SELECT * from custByCity
WHERE city = "Singapore";

-- 4.Write a query to create a view named "paymentsByMonth" that calculates payments per month. You will have to group by multiple columns for this query: 
--month and year because payments from January 2004 and January 2005 should not be grouped together. Remember the SQL month() and year() functions.
CREATE VIEW paymentsByMonth AS
SELECT MONTH(paymentDate) AS "Month", YEAR(paymentDate) AS "Year", SUM(amount) AS "Sales"
FROM payments
GROUP BY MONTH(paymentDate), YEAR(paymentDate)
ORDER BY YEAR(paymentDate), MONTH(paymentDate);

--    Query the view to show payments in November 2004
SELECT * 
FROM paymentsByMonth
WHERE Month = 11 AND Year = 2004;

-- 5. Write a query to create a view named "orderTotalsByMonth" to calculate order totals (in dollars) per month.
CREATE VIEW orderTotalsByMonth AS
SELECT YEAR(o.orderDate) AS "Year", MONTH(o.orderDate) AS "Month", SUM(od.quantityOrdered * od.priceEach) AS "TotalSales"
FROM orders o, orderdetails od
WHERE o.orderNumber = od.orderNumber
GROUP BY MONTH(o.orderDate), YEAR(o.orderDate)
ORDER BY YEAR(o.orderDate), MONTH(o.orderDate);

--OR
CREATE VIEW orderTotalsByMonth AS
SELECT YEAR(o.orderDate) AS "Year", MONTH(o.orderDate) AS "Month", SUM(od.quantityOrdered * od.priceEach) AS "TotalSales"
FROM orders o
JOIN orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY MONTH(o.orderDate), YEAR(o.orderDate)
ORDER BY YEAR(o.orderDate), MONTH(o.orderDate);

--    Query the view to show the order total in August 2004.
SELECT *
FROM orderTotalsByMonth
WHERE Month = 8 AND Year = 2004;

-- 6. Write a query to create a view named "salesPerLine"that calculates sales per product line.
CREATE VIEW salesPerLine AS
SELECT p.productLine, SUM(od.quantityOrdered * od.priceEach) AS "totalSales"
FROM products p, orderdetails od
WHERE p.productCode = od.productCode
GROUP BY p.productLine;

--OR
SELECT p.productLine, SUM(od.quantityOrdered * od.priceEach) AS "totalSales"
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
GROUP BY p.productLine;

--    Query the view to show the total sales for the "Classic Cars" line.
SELECT totalSales
FROM salesPerLine
WHERE productLine = "Classic Cars";

-- 7. Write a query to create a view named "productSalesYear" that calculates orders per product per year. Include the product name, sales total, and year.
CREATE VIEW productSalesYear AS
SELECT p.productName, SUM(od.quantityOrdered * od.priceEach) AS "totalSales", YEAR(o.orderDate) AS "Year"
FROM products p, orderdetails od, orders o
WHERE p.productCode = od.productCode AND od.orderNumber = o.orderNumber
GROUP BY p.productCode, Year(o.orderDate)
ORDER BY p.productName;

--OR
CREATE VIEW productSalesYear AS
SELECT p.productName, SUM(od.quantityOrdered * od.priceEach) AS "totalSales", YEAR(o.orderDate) AS "Year"
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
JOIN orders o ON od.orderNumber = o.orderNumber
GROUP BY p.productCode, Year(o.orderDate)
ORDER BY p.productName;

--    Query the view to show the sales per year for the "2001 Ferrari Enzo"
SELECT *
FROM productSalesYear
WHERE productName = "2001 Ferrari Enzo";


--Write a query to create a view named "orderTotals" that displays the order total for each order. Include order number, customer name, and total.
CREATE VIEW orderTotals AS
SELECT c.customerName, od.orderNumber, SUM(od.quantityOrdered * od.priceEach) AS "orderTotal"
FROM orders o, orderdetails od, customers c
WHERE o.orderNumber = od.orderNumber AND o.customerNumber = c.customerNumber
GROUP BY od.orderNumber;

--OR
CREATE VIEW orderTotals AS
SELECT c.customerName, od.orderNumber, SUM(od.quantityOrdered * od.priceEach) AS "orderTotal"
FROM orders o
JOIN orderdetails od ON o.orderNumber = od.orderNumber
JOIN customers c ON o.customerNumber = c.customerNumber
GROUP BY od.orderNumber;

--    Query the view to select the top 15 orders.
SELECT *
FROM orderTotals
ORDER BY orderTotal DESC
LIMIT 15;

-- Write a query to create a view named "salesPerRep" that calculates total sales for each sales rep.
CREATE VIEW salesPerRep AS
SELECT e.employeeNumber, e.firstNAME, e.lastname, SUM(od.quantityOrdered * od.priceEach) AS "totalSales"
FROM employees e, customers c, orders o, orderdetails od
WHERE e.employeeNumber = c.salesRepEmployeeNumber AND c.customerNumber = o.customerNumber AND o.orderNumber = od.orderNumber
GROUP BY e.employeeNumber;

--OR
CREATE VIEW salesPerRep AS
SELECT e.employeeNumber, e.firstNAME, e.lastname, SUM(od.quantityOrdered * od.priceEach) AS "totalSales"
FROM employees e
JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber 
GROUP BY e.employeeNumber;

-- Write a query to create a view named "salesPerOffice" that displays sales per office.
CREATE VIEW salesPerOffice AS
SELECT f.officeCode, f.city, SUM(od.quantityOrdered * od.priceEach) AS "totalSales"
FROM offices f, employees e, customers c, orders o, orderdetails od
WHERE f.officeCode = e.officeCode AND e.employeeNumber = c.salesRepEmployeeNumber AND c.customerNumber = o.customerNumber AND o.orderNumber = od.orderNumber
GROUP BY f.officeCode;

--OR
CREATE VIEW salesPerOffice AS
SELECT f.officeCode, f.city, SUM(od.quantityOrdered * od.priceEach) AS "totalSales"
FROM offices f
JOIN employees e ON f.officeCode = e.officeCode
JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY f.officeCode;

