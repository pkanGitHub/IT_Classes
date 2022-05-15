-- SELECT (Read) Queries

-- 1. Write a query to calculate the payments each sales agent is responsible for. Display the agent name and the total payments.
SELECT a.AGENT_NAME, SUM(b.PAYMENT_AMT) AS TotalPayments
FROM agents as a
JOIN customer as b ON a.AGENT_CODE = b.AGENT_CODE
GROUP BY b.CUST_CODE
ORDER BY TotalPayments DESC;

-- 2. Write a query to calculate payments for each sales agent by country of the sales agent. Display the agent country and total payments.
SELECT a.CUST_COUNTRY as Country, SUM(a.PAYMENT_AMT) AS TotalPayments
FROM customer as a
LEFT JOIN agents as b ON a.AGENT_CODE = b.AGENT_CODE
GROUP BY a.CUST_COUNTRY
ORDER BY TotalPayments DESC;

-- 3. Calculate the commission for each order. Display order id, customer name, agent name, and commission amount.
SELECT a.ORD_NUM, b.CUST_NAME, c.AGENT_NAME, SUM(c.COMMISSION) AS CommissionAMT
FROM orders as a
LEFT JOIN customer as b ON a.CUST_CODE = b.CUST_CODE
LEFT JOIN agents as c ON a.AGENT_CODE = c.AGENT_CODE
GROUP BY a.ORD_NUM;

-- Update Queries (need screenshot result A, B, C)

-- 1. In the customers table, for customers from New York update the CUST_CITY value to change it from “New York” to “NY”.
UPDATE customer SET CUST_CITY = 'NY' WHERE CUST_CITY = 'New York';
    -- A. Now write an query to select all customers from New York City.
    SELECT * FROM customer WHERE CUST_CITY = 'NY';

-- 2. Increase the commission for sales agents from London by 20%.
UPDATE agents SET COMMISSION = (COMMISSION * .2) + COMMISSION;
    -- B. Calculate the commission for each order where the agent is from London. Display order id, customer name, agent name, and commission amount.
    SELECT a.ORD_NUM, b.CUST_NAME, c.AGENT_NAME, SUM(c.COMMISSION) AS CommissionAMT
    FROM orders as a
    LEFT JOIN customer as b ON a.CUST_CODE = b.CUST_CODE
    LEFT JOIN agents as c ON a.AGENT_CODE = c.AGENT_CODE
    WHERE b.CUST_CITY = 'London'
    GROUP BY a.ORD_NUM;

-- 3. Update customers with grade 2 to grade 3.
UPDATE customer SET GRADE = 3 WHERE GRADE = 2;
    -- C. Select all customers names and customer codes with grade 3.
    SELECT CUST_CODE, CUST_NAME FROM customer WHERE GRADE = 3;

-- Delete Queries (need screenshot result E,F)

-- 1. Delete sales agents from Bangalore.
DELETE FROM agents WHERE WORKING_AREA = 'Bangalore';
    -- E. Write a query to select all columns for all sales agents
    SELECT * FROM agents ORDER BY WORKING_AREA;

-- 2. Delete customers whose name begins with the letter “S”.
DELETE FROM customer WHERE CUST_NAME LIKE 'S%'; 
    -- F. Select all columns for all customers.
    SELECT * FROM customer ORDER BY CUST_NAME DESC;
