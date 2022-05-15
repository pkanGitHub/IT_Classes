-- Write a query to show the customer number, name, payment date, and payment amount for payments greater than the average payment
SELECT c.customerNumber, c.customerName, p.paymentDate, p.amount, (SELECT AVG(p.amount) FROM payments p) AS "Avg Payment"
FROM customers c, payments p
WHERE c.customerNumber = p.customerNumber AND p.amount > (SELECT AVG(p.amount) FROM payments p);

--Create a query to generate a list of managers
SELECT employeeNumber, firstName, lastName
FROM employees
WHERE employeeNumber IN (select reportsTo from employees);

-- Which offices have the same number of employees as the London office? Show the city, office code and number of employees
SELECT e.officeCode, o.city, COUNT(e.officeCode) AS "Number of Employees"
FROM employees e, offices o
WHERE e.officeCode = o.officeCode
GROUP BY e.officeCode
HAVING COUNT(e.officeCode) = (SELECT COUNT(e.officeCode)
    FROM employees e, offices o
    WHERE e.officeCode = o.officeCode AND o.city = "London")
ORDER BY COUNT(e.officeCode);


--Which product(s) have a higher quantityordered than "1940s Ford truck"
SELECT p.productName, SUM(o.quantityOrdered) as "Quantity Ordered"
FROM orderdetails o, products p
WHERE o.productCode = p.productCode
GROUP BY o.productCode 
HAVING SUM(o.quantityOrdered) > (SELECT SUM(o.quantityOrdered)
    FROM orderdetails o, products p
    WHERE o.productCode = p.productCode AND p.productName = "1940s Ford truck")
ORDER BY SUM(o.quantityOrdered) DESC;


-- Show the products that have a lower dollar value in sales than the "1957 Corvette Convertible"
SELECT p.productName, SUM(o.quantityOrdered * o.priceEach) AS "Total Value"
FROM orderdetails o, products p
WHERE o.productCode = p.productCode
GROUP BY p.productCode
HAVING SUM(o.quantityOrdered * o.priceEach) < (SELECT SUM(o.quantityOrdered * o.priceEach) AS "Total Value"
    FROM orderdetails o, products p
    WHERE o.productCode = p.productCode AND p.productName = "1934 Ford V8 Coupe")
ORDER BY SUM(o.quantityOrdered * o.priceEach) DESC;

-- Show the order number, customer number, and order total for orders with a larger order total than order number 10222
SELECT od.orderNumber, o.customerNumber, SUM(od.quantityOrdered * od.priceEach) AS "Order Total"
FROM orderdetails od, orders o 
WHERE od.orderNumber = o.orderNumber
GROUP BY od.orderNumber
HAVING SUM(od.quantityOrdered * od.priceEach) > (SELECT SUM(quantityOrdered * priceEach) AS "Order Total"
    FROM orderdetails
    WHERE orderNumber = 10222)
ORDER by SUM(od.quantityOrdered * od.priceEach) DESC;


-- Show the company name and total payments for companies whose name ends in "Ltd"
SELECT c.customerName, SUM(p.amount) as 'Total Payments'
FROM customers c, payments p
WHERE c.customerNumber = p.customerNumber AND customerName LIKE '%Ltd'
GROUP By p.customerNumber;

SELECT c.customerName, SUM(p.amount) as 'Total Payments'
FROM customers c, payments p
WHERE c.customerNumber = p.customerNumber
GROUP By p.customerNumber
HAVING customerName LIKE '%Ltd';

-- How many employees have a three digit extension? A three digit extension looks like xXXX
SELECT COUNT(employeeNumber) AS "NumEmployees"
FROM employees
WHERE extension LIKE 'x___';

-- Show the product code, name, vendor, and buy price for products from the 1950s (1950 - 1959). The year appears is in the name.
SELECT productCode, productName, productVendor, buyPrice
FROM products
WHERE productName LIKE '195%';

-- show all office information for offices in the 212 area code. Hint. Look at the phone number
SELECT * 
FROM offices
WHERE phone LIKE '+1 212%';

-- Show first name, last name, employee number and email for the sales managers
SELECT firstName, lastName, employeeNumber, jobTitle, email
FROM employees 
WHERE jobTitle LIKE 'Sale_ Manager%';
