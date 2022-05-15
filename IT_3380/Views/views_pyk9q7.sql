-- 1. Write a query to create a view named "SFEmployees" for those salespeople who work in the San Francisco office. Include the employee name (first, last), number, email, and job title.
CREATE VIEW SFEmployees AS 
SELECT Concat_ws(",", a.firstName, a.lastName) AS EmployeeName, a.employeeNumber, a.email, a.jobTitle
FROM employees AS a
INNER JOIN offices AS b ON a.officeCode = b.officeCode
WHERE b.city = "San Francisco";

    -- 1. Query the SFEmployees view to count the number of employees in the San Francisco office.
    SELECT COUNT(employeeNumber) AS NumberOfEmployees 
    FROM SFEmployees; 

-- 2. Write a query to create a view named "managers" to display all the managers. Include the manager’s name (first, last), number, email,  job title, and office city.
CREATE VIEW managers AS
SELECT concat_ws(" ", a.firstName, a.lastName) AS ManagerName, a.employeeNumber, a.email, a.jobTitle, b.city
FROM employees AS a
LEFT JOIN offices AS b ON a.officeCode = b.officeCode
WHERE a.employeeNumber IN (
    SELECT a.reportsTo
    FROM employees a
    GROUP BY a.reportsTo
); 
    -- 1. Query the managers view to show the number of managers in each city.
    SELECT COUNT(employeeNumber) AS NumberOfManagers, city
    FROM managers
    GROUP BY city;
    
-- 3. Write a query to create a view named "custByCity" to get a count of how many customers there are in each city.
CREATE VIEW custByCity AS
SELECT COUNT(customerNumber) AS NumberOfCustomers, city
FROM customers
GROUP BY city;
    -- 1. Query the custByCity view to show the number of customers in Singapore.
    SELECT city, NumberOfCustomers 
    FROM custByCity
    WHERE city = "Singapore";

-- 4. Write a query to create a view named "paymentsByMonth" that calculates payments per month. You will have to group by multiple columns for this query: month 
-- and year because payments from January 2004 and January 2005 should not be grouped together. Remember the SQL month() and year() functions.
CREATE VIEW paymentsByMonth AS
SELECT month(paymentDate) AS "Month", year(paymentDate) AS "Year", SUM(amount) AS TotalPayments
FROM payments
GROUP BY Year, Month
ORDER BY Year, Month;
    -- 1. Query the paymentsByMonth view to show payments in November 2004
    SELECT Month, Year, TotalPayments 
    FROM paymentsByMonth
    WHERE Month = 11 AND Year = 2004;

-- 5. Write a query to create a view named "orderTotalsByMonth" to calculate order totals (in dollars) per month.
CREATE VIEW orderTotalsByMonth AS
SELECT month(a.orderDate) AS "Month", year(a.orderDate) AS "Year", SUM(b.quantityOrdered * b.priceEach) AS OrderTotals
FROM orders AS a
INNER JOIN orderdetails AS b ON a.orderNumber = b.orderNumber
GROUP BY Year, Month
ORDER BY Year, Month;
    -- 1. Query the orderTotalsByMonth view to show the order total in August 2004.
    SELECT Month, Year, OrderTotals FROM orderTotalsByMonth
    WHERE Month = 8 AND Year = 2004;

-- 6. Write a query to create a view named "salesPerLine" that calculates sales per product line.
CREATE VIEW salesPerLine AS
SELECT a.productLine, SUM(b.quantityOrdered * b.priceEach) AS TotalSales
FROM products AS a
INNER JOIN orderdetails AS b
GROUP BY a.productLine;
    -- 1. Query the salesPerLine view to show the total sales for the "Classic Cars" line.
    SELECT productLine, TotalSales 
    FROM salesPerLine
    WHERE productLine = "Classic Cars";

-- 7. Write a query to create a view named "productSalesYear" that calculates sales per product per year. Include the product name, sales total, and year.
CREATE VIEW productSalesYear AS
SELECT a.productName, SUM(b.quantityOrdered * b.priceEach) AS SalesTotal, year(c.orderDate) AS "Year"
FROM products AS a
INNER JOIN orderdetails AS b ON a.productCode = b.productCode
INNER JOIN orders AS c ON b.orderNumber = c.orderNumber
GROUP BY a.productCode, year;
    -- 1. Query the productSalesYear view to show the sales per year for the "2001 Ferrari Enzo"
    SELECT year, productName, SalesTotal
    FROM productSalesYear
    WHERE productName = "2001 Ferrari Enzo";

-- 8. Write a query to create a view named "orderTotals" that displays the order total for each order. Include order number, customer name, and total.
CREATE VIEW orderTotals AS
SELECT a.orderNumber, b.customerName, SUM(c.quantityOrdered * c.priceEach) AS total
FROM orders AS a
INNER JOIN customers AS b ON a.customerNumber = b.customerNumber
INNER JOIN orderdetails AS c ON a.orderNumber = c.orderNumber
GROUP BY a.orderNumber;
    -- 1. Query the orderTotals view to select the top 15 orders.
    SELECT orderNumber, customerName, total
    FROM orderTotals
    ORDER BY total DESC
    LIMIT 15;

-- 9. Write a query to create a view named "salesPerRep" that calculates total sales for each sales rep.
CREATE VIEW salesPerRep AS
SELECT a.employeeNumber, SUM(d.quantityOrdered * d.priceEach) AS TotalSales
FROM employees AS a
LEFT JOIN customers AS b ON a.employeeNumber = b.salesRepEmployeeNumber
LEFT JOIN orders AS c ON b.customerNumber = c.customerNumber
LEFT JOIN orderdetails AS d ON c.orderNumber = d.orderNumber
GROUP BY a.employeeNumber
ORDER BY TotalSales; -- I wrote queries to find for ALL salesRep, even with the one without sales

-- 10. Write a query to create a view named "salesPerOffice" that displays sales per office.
CREATE VIEW salesPerOffice AS
SELECT a.officeCode, SUM(e.quantityOrdered * e.priceEach) AS Sales
FROM offices AS a
LEFT JOIN employees AS b ON a.officeCode = b.officeCode
LEFT JOIN customers AS c ON b.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN orders AS d ON c.customerNumber = d.customerNumber
LEFT JOIN orderdetails AS e ON d.orderNumber = e.orderNumber
GROUP BY a.officeCode
ORDER BY Sales;
