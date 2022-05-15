-- 2A
-- Display the customer name, customer number, along with their sales rep’s number, first name, and last name.
SELECT c.customerNumber, c.customerName, e.employeeNumber, e.firstName, e.lastname
FROM customers c
JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber;

SELECT c.customerNumber, c.customerName, e.employeeNumber, e.firstName, e.lastname
FROM customers c
LEFT JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber;

SELECT c.customerNumber, c.customerName, e.employeeNumber, e.firstName, e.lastname
FROM customers c
RIGHT JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber;


-- Display each employee’s first and last name and their office code, city, and phone.
SELECT e.firstName, e.lastname, o.officeCode, o.city, o.phone
FROM employees e
JOIN offices o ON e.officeCode = o.officeCode;

SELECT e.firstName, e.lastname, o.officeCode, o.city, o.phone
FROM employees e
LEFT JOIN offices o ON e.officeCode = o.officeCode;

SELECT e.firstName, e.lastname, o.officeCode, o.city, o.phone
FROM employees e
RIGHT JOIN offices o ON e.officeCode = o.officeCode;

-- Display the customer’s name, and number along with the order number order date, product name, quantity, and price for each of the customer’s orders.
SELECT c.customerName, o.orderNumber, o.orderDate, p.productName, od.quantityOrdered, od.priceEach
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
JOIN products p ON od.productCode = p.productCode;

SELECT c.customerName, o.orderNumber, o.orderDate, p.productName, od.quantityOrdered, od.priceEach
FROM customers c
LEFT JOIN orders o ON c.customerNumber = o.customerNumber
LEFT JOIN orderdetails od ON o.orderNumber = od.orderNumber
LEFT JOIN products p ON od.productCode = p.productCode;

SELECT c.customerName, o.orderNumber, o.orderDate, p.productName, od.quantityOrdered, od.priceEach
FROM customers c
RIGHT JOIN orders o ON c.customerNumber = o.customerNumber
RIGHT JOIN orderdetails od ON o.orderNumber = od.orderNumber
RIGHT JOIN products p ON od.productCode = p.productCode;

-- Display the customer name and customer number along with the payment date, check number, and amount for each payment
SELECT c.customerName, c.customerNumber, p.paymentDate, p.checkNumber, p.amount
FROM customers c
JOIN payments p ON c.customerNumber = p.customerNumber;

SELECT c.customerName, c.customerNumber, p.paymentDate, p.checkNumber, p.amount
FROM customers c
LEFT JOIN payments p ON c.customerNumber = p.customerNumber;

SELECT c.customerName, c.customerNumber, p.paymentDate, p.checkNumber, p.amount
FROM customers c
RIGHT JOIN payments p ON c.customerNumber = p.customerNumber;

-- Display the product line, description, and product name for all products


-- 2B
-- Show the customer name, order number and order date only for customers who have placed orders.
SELECT c.customerName, o.orderNumber, o.orderDate
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber;

-- Show the order number, and order total for all orders. Include orders with no order details.
SELECT o.orderNumber, SUM(od.quantityOrdered * od.priceEach) as "Order Total"
FROM orders o
LEFT JOIN orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY o.orderNumber;

--OR
SELECT o.orderNumber, SUM(od.quantityOrdered * od.priceEach) as "Order Total"
FROM orderdetails od 
RIGHT JOIN orders o ON o.orderNumber = od.orderNumber
GROUP BY o.orderNumber;


-- Show the employee name (first, last) and office address (address line 1, state and country) for all employees.
SELECT e.firstName, e.lastname, o.addressLine1, o.state, o.country
FROM employees e
JOIN offices o ON e.officeCode = o.officeCode;

-- Show the customer, number, payment date, check number, and amount for each payment. Include customers who have not made any payments.
SELECT c.customerNumber, c.customerName, p.paymentDate, p.checkNumber, p.amount
FROM customers c
LEFT JOIN payments p ON c.customerNumber = p.customerNumber;

--OR
SELECT c.customerNumber, c.customerName, p.paymentDate, p.checkNumber, p.amount
FROM payments p
RIGHT JOIN customers c ON c.customerNumber = p.customerNumber;


-- Show the employee name, customer name and the total sales for that customer. The results should include employees even if they have do not have customers.
SELECT e.firstName, e.lastname, c.customerName, SUM(od.quantityOrdered * od.priceEach) as "Total Sales"
FROM employees e
LEFT JOIN customers c ON c.salesRepEmployeeNumber = e.employeeNumber
LEFT JOIN orders o ON c.customerNumber = o.customerNumber
LEFT JOIN orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY c.customerName, e.firstName, e.lastname
ORDER BY e.firstName;

