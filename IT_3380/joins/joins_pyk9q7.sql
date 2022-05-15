-- For each of the following questions you will write queries using the following three (3) types of joins. You 
-- also have to write a description of if/how the results differ. In your description you should include the number of 
-- results returned and the columns where NULL values are returned.


-- 2A
-- 1. Display the customer name, customer number, along with their sales rep’s number, first name, and last name.
SELECT a.customerName, a.customerNumber, b.employeeNumber, b.firstName, b.lastName
FROM customers AS a
LEFT JOIN employees AS b ON a.salesRepEmployeeNumber = b.employeeNumber;
-- WHERE b.employeeNumber IS NULL; use to check number of NULL

SELECT a.customerName, a.customerNumber, b.employeeNumber, b.firstName, b.lastName
FROM customers AS a
RIGHT JOIN employees AS b ON a.salesRepEmployeeNumber = b.employeeNumber;
-- WHERE a.customerName IS NULL; use to check number of NULL

SELECT a.customerName, a.customerNumber, b.employeeNumber, b.firstName, b.lastName
FROM customers AS a
JOIN employees AS b ON a.salesRepEmployeeNumber = b.employeeNumber;

-- 2. Display each employee’s first and last name and their office code, city, and phone.
SELECT a.firstName, a.lastName, b.officeCode, b.city, b.phone
FROM employees AS a
LEFT JOIN offices AS b ON a.officeCode = b.officeCode;

SELECT a.firstName, a.lastName, b.officeCode, b.city, b.phone
FROM employees AS a
RIGHT JOIN offices AS b ON a.officeCode = b.officeCode;

SELECT a.firstName, a.lastName, b.officeCode, b.city, b.phone
FROM employees AS a
JOIN offices AS b ON a.officeCode = b.officeCode;

-- 3. Display the customer’s name, and number along with the order number order date, product name, quantity, and 
-- price for each of the customer’s orders.
SELECT a.customerName, a.customerNumber, b.orderNumber, b.orderDate, d.productName, c.quantityOrdered AS Quantity, c.priceEach AS Price
FROM customers AS a
LEFT JOIN orders AS b ON a.customerNumber = b.customerNumber
LEFT JOIN orderdetails AS c ON b.orderNumber = c.orderNumber
LEFT JOIN products AS d ON c.productCode = d.productCode;
-- WHERE b.orderNumber IS NULL;
-- GROUP BY a.customerNumber, b.orderNumber, c.productCode;

SELECT a.customerName, a.customerNumber, b.orderNumber, b.orderDate, d.productName, c.quantityOrdered AS Quantity, c.priceEach AS Price
FROM customers AS a
RIGHT JOIN orders AS b ON a.customerNumber = b.customerNumber
RIGHT JOIN orderdetails AS c ON b.orderNumber = c.orderNumber
RIGHT JOIN products AS d ON c.productCode = d.productCode;
-- WHERE a.customerNumber IS NULL;
-- GROUP BY a.customerNumber, c.orderNumber, d.productCode;

SELECT a.customerName, a.customerNumber, b.orderNumber, b.orderDate, d.productName, c.quantityOrdered AS Quantity, c.priceEach AS Price
FROM customers AS a
JOIN orders AS b ON a.customerNumber = b.customerNumber
JOIN orderdetails AS c ON b.orderNumber = c.orderNumber
JOIN products AS d ON c.productCode = d.productCode
-- WHERE a.customerNumber IS NULL OR b.orderNumber IS NULL OR d.productName IS NULL
-- GROUP BY a.customerNumber, b.orderNumber, c.productCode; -- 

-- 4. Display the customer name and customer number along with the payment date, check number, and amount for each payment
SELECT a.customerName, a.customerNumber, b.paymentDate, b.checkNumber, b.amount
FROM customers AS a
LEFT JOIN payments AS b ON a.customerNumber = b.customerNumber;
-- WHERE b.amount IS NULL;

SELECT a.customerName, a.customerNumber, b.paymentDate, b.checkNumber, b.amount
FROM customers AS a
RIGHT JOIN payments AS b ON a.customerNumber = b.customerNumber;

SELECT a.customerName, a.customerNumber, b.paymentDate, b.checkNumber, b.amount
FROM customers AS a
JOIN payments AS b ON a.customerNumber = b.customerNumber;

-- 5. Display the product line, text description, and product name for all products
SELECT b.productLine, b.textDescription, a.productName
FROM products AS a
LEFT JOIN productlines AS b ON a.productLine = b.productLine;

SELECT b.productLine, b.textDescription, a.productName
FROM products AS a
RIGHT JOIN productlines AS b ON a.productLine = b.productLine;

SELECT b.productLine, b.textDescription, a.productName
FROM products AS a
JOIN productlines AS b ON a.productLine = b.productLine;

-- 2B
-- For the following questions you should write a query using the most appropriate join.

-- 1. Show the customer name, order number and order date only for customers who have placed orders.
SELECT a.customerName, b.orderNumber, b.orderDate
FROM customers AS a
JOIN orders AS b ON a.customerNumber = b.customerNumber;

-- 2. Show the order number, and order total for all orders. Include orders with no order details.
SELECT a.orderNumber, SUM(b.quantityOrdered * b.priceEach) AS OrderTotal
FROM orders AS a
LEFT JOIN orderdetails AS b ON a.orderNumber = b.orderNumber
GROUP BY a.orderNumber; -- there's no orders that has no order details in this database

-- 3. Show the employee name (first, last) and office address (address line 1, state and country) for all employees.
SELECT CONCAT_ws (',', a.firstName, a.lastName) AS EmployeeName, CONCAT_ws(', ', b.addressLine1, b.state, b.country) AS OfficeAddress
FROM employees AS a
LEFT JOIN offices AS b ON a.officeCode = b.officeCode; -- if the state is missing, meaning the state was null


-- 4. Show the customer, number, payment date, check number, and amount for each payment. Include customers who have not made any payments.
SELECT a.customerName, a.customerNumber, b.paymentDate, b.checkNumber, b.amount
FROM customers AS a
LEFT JOIN payments AS b ON a.customerNumber = b.customerNumber;

-- 5. Show the employee name, customer name and the total sales for that customer. The results should include employees 
-- even if they have do not have customers.
SELECT CONCAT_WS(' ', a.firstName, a.lastName) AS employeeName, b.customerName, SUM(c.amount) AS totalSales
FROM employees AS a
LEFT JOIN customers AS b ON a.employeeNumber = b.salesRepEmployeeNumber
LEFT JOIN payments AS c ON b.customerNumber = c.customerNumber
GROUP BY a.employeeNumber, b.customerNumber;
