
-- 1. Calculate the number of orders for each product that has been ordered.
SELECT p.productName, COUNT(o.productCode) as "NumOrders"
FROM orderdetails o, products p
WHERE o.productCode = p.productCode
GROUP BY o.productCode
ORDER BY COUNT(o.productCode) DESC;

-- 2. Calculate the total number of each product that has been ordered. Display the product name and quantity ordered in a column called “Quantity Ordered”.
SELECT p.productName, SUM(o.quantityOrdered) as "Quantity Ordered"
FROM orderdetails o, products p
WHERE o.productCode = p.productCode
GROUP BY o.productCode
ORDER BY SUM(o.quantityOrdered) DESC;

-- 3. Calculate the total dollar value of the top 25 products that has been ordered in the database
SELECT p.productName, SUM(o.quantityOrdered * o.priceEach) AS "Total Value"
FROM orderdetails o, products p
WHERE o.productCode = p.productCode
GROUP BY p.productCode
ORDER BY SUM(o.quantityOrdered * o.priceEach) DESC
LIMIT 25;


-- 4. Calculate the number of orders each customer has placed and display the top 25 in descending order based on orders placed.
SELECT c.customerName, COUNT(o.customerNumber) as "NumOrders"
FROM customers c, orders o
WHERE c.customerNumber = o.customerNumber
GROUP BY o.customerNumber
ORDER BY COUNT(o.customerNumber) DESC
LIMIT 25;

-- 5. Calculate the total payments made each year.
SELECT SUM(amount) as "Total Payments", YEAR(paymentDate) as "Year"
FROM payments
GROUP BY YEAR(paymentDate);

-- 6. Calculate the total payments made each month in 2004
SELECT SUM(amount) AS "Payment", MONTH(paymentDate) AS "Month"
FROM payments
WHERE YEAR(paymentDate) = 2004
GROUP BY MONTH(paymentDate)
ORDER BY MONTH(paymentDate);

-- 7. Calculate the total payments made each day in December of 2004.
SELECT SUM(amount), DAY(paymentDate)
FROM payments
WHERE YEAR(paymentDate) = 2004 AND MONTH(paymentDate) = 12
GROUP BY DAY(paymentDate)
ORDER BY DAY(paymentDate);

-- 8. Calculate the total payments made by each customer in the database who has made a payment. 
SELECT c.customerName, SUM(p.amount) as "Total Payments"
FROM customers c, payments p
WHERE c.customerNumber = p.customerNumber
GROUP BY c.customerName
ORDER BY SUM(p.amount) DESC;

-- 9. Customers by state
SELECT state, COUNT(state) AS "Num Customers in State"
FROM customers
GROUP BY state
ORDER by COUNT(state) DESC;

-- 10. Which employee manages the most employees?
SELECT reportsTo, COUNT(reportsTo) as "NumReports"
FROM employees
GROUP BY reportsTo;

-- 11. How many product lines
SELECT COUNT(productLine)
FROM productlines;

-- 12. 
SELECT productName, quantityInStock, buyPrice, SUM(quantityInStock * buyPrice) as "Dollar Value"
FROM products
GROUP BY productCode
ORDER BY SUM(quantityInStock * buyPrice);

