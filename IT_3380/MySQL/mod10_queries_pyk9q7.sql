-- Write queries using subqueries for the following questions. Your solution from module 6 will be of help to you for the following.

-- 1. Write a query to show the customer number, name, payment date, and payment amount for payments greater than the average payment.
SELECT a.customerNumber, a.customerName, b.paymentDate, SUM(b.amount) AS PaymentAmount
FROM customers AS a
LEFT JOIN payments AS b ON a.customerNumber = b.customerNumber
GROUP BY a.customerNumber, b.paymentDate
HAVING PaymentAmount > 
(
    SELECT AVG(amount) 
    FROM payments
);

-- 2. Create a query to generate a list of managers. Show their employee number, first name, and last name.
SELECT employeeNumber, firstName, lastName
FROM employees
WHERE employeeNumber IN 
(
    SELECT e.reportsTo FROM employees e
    GROUP BY e.reportsTo
);
-- 3. Which offices have the same number of employees as the London office? Show the city, office code and number of employees.
SELECT a.city, a.officeCode, COUNT(b.employeeNumber) AS NumberOfEmployees
FROM offices AS a
LEFT JOIN employees AS b ON a.officeCode = b.officeCode
GROUP BY a.officeCode
HAVING NumberOfEmployees = 
(
    SELECT COUNT(b.employeeNumber) 
    FROM offices AS a 
    LEFT JOIN employees AS b 
    ON a.officeCode = b.officeCode
    WHERE a.city = "London"
);

-- 4. Which product(s) have a higher quantity ordered than “1940s Ford truck”? Show the product names and quantity ordered.
SELECT a.productName, SUM(b.quantityOrdered) AS QuantityOrdered
FROM products AS a
LEFT JOIN orderdetails AS b ON a.productCode = b.productCode
GROUP BY a.productCode
HAVING QuantityOrdered >
(
    SELECT SUM(b.quantityOrdered)
    FROM products AS a
    LEFT JOIN orderdetails AS b ON a.productCode = b.productCode
    WHERE a.productName = "1940s Ford truck"
);

-- 5. Show the products that have a lower dollar value in orders than the “1957 Corvette Convertible”. Show the product name and total value.
SELECT a.productName, SUM(b.quantityOrdered * b.priceEach) AS TotalValue
FROM products AS a
LEFT JOIN orderdetails AS b ON a.productCode = b.productCode
GROUP BY a.productCode
HAVING TotalValue <
(
    SELECT SUM(b.quantityOrdered * b.priceEach)
    FROM products AS a
    LEFT JOIN orderdetails AS b ON a.productCode = b.productCode
    WHERE a.productName = "1957 Corvette Convertible"
);

-- 6. Show the order number, customer number, and order total for orders with a larger order total than order number 10222.
SELECT a.orderNumber, b.customerNumber, SUM(a.quantityOrdered * a.priceEach) AS OrderTotal
FROM orderdetails AS a
LEFT JOIN orders AS b ON a.orderNumber = b.orderNumber
GROUP BY a.orderNumber
HAVING OrderTotal >
(
    SELECT SUM(a.quantityOrdered * a.priceEach)
    FROM orderdetails AS a
    LEFT JOIN orders AS b ON a.orderNumber = b.orderNumber
    WHERE a.orderNumber = 10222
);


-- Write queries using wildcards for the following questions.

-- 1. Show the company name and total payments for companies whose name ends in “Ltd”.
SELECT a.customerName, SUM(b.amount) AS TotalPayments
FROM customers AS a
RIGHT JOIN payments AS b ON a.customerNumber = b.customerNumber
WHERE a.customerName LIKE '%Ltd'
GROUP BY a.customerNumber;

-- 2. How many employees have a three digit extension? A three digit extension looks like xXXX.
SELECT COUNT(extension) AS NumberOfEmployees
FROM employees
WHERE extension LIKE 'x___';

-- 3. Show the product code, name, vendor, and buy price for products from the 1950s (1950 - 1959). The year appears is in the name.
SELECT productCode, productName, productVendor, buyPrice
FROM products
WHERE productName LIKE '195_%';

-- 4. show all office information for offices in the 212 area code. Hint. Look at the phone number.
SELECT * FROM offices
WHERE phone LIKE '%212%';

ask-- 5. Show first name, last name, employee number and email for the sales managers.
SELECT employeeNumber, firstName, lastName, email
FROM employees
WHERE jobTitle LIKE 'S%M%';

-- 6. Show the name, product code, quantity in stock, and buy price for products with “Chevy” in the name.
SELECT productCode, productName, quantityInStock, buyPrice
FROM products
WHERE productName LIKE '%Chevy%';
