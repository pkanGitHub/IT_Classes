// 1. How many orders has each order line appeared in? Display order line number and number of orders.
db.orders.aggregate([
    {$unwind: "$orderDetails"},
    {$group: {_id: "$orderDetails.orderLineNumber", NumberOfOrders: {$sum:1}}},
    {$sort: {NumberOfOrders:-1}}
])

// 2. Calculate the total payments each customer has made. Display customer name and the total payment.
db.customers.aggregate([
    {$unwind: "$payments"},
    {$group: {_id: "$customerName", TotalPayment: {$sum: "$payments.amount"}}},
    {$sort: {TotalPayment:-1}}
])

// 3. Calculate the number of payments each customer has made. Display customer name and the number of payments.
db.customers.aggregate([
    {$unwind: "$payments"},
    {$group: {_id: "$customerName", NumberOfPayment: {$sum:1}}},
    {$project: {customerName:1, NumberOfPayment:1}},
    {$sort: {NumberOfPayment:-1}}
])

// 4. How many employees work in each office. List the office code and number of employees.
db.employees.aggregate([
    {$unwind: "$office"},
    {$group: {_id: {officeCode:"$office.officeCode"}, NumberOfEmployees: {$sum:1}}},
    {$sort: {_id:1}}
])

// 5. What are the 10 most expensive orders? Display the Customer name and order total and display results in descending order by order total.
db.orders.aggregate([
    {$unwind: "$orderDetails"},
    {$group: {_id: {ID: "$_id", CustomerName: "$customerName"}, OrderTotal: {$sum: {$multiply:["$orderDetails.quantityOrdered", "$orderDetails.priceEach"]}}}},
    {$sort: {OrderTotal:-1}},
    {$limit: 10}
])

// 6. What is the sales value of each product in stock? Sale value is calculated by multiplying quantity in stock by MSRP. Display 
// the product name and the sales value in descending order based on sales value.
db.products.aggregate([
    {$group: {_id: "$productName", SalesValue: {$sum: {$multiply: ["$quantityInStock", "$MSRP"]}}}},
    {$sort: {SalesValue:-1}}
])

// 7. Which Customer has ordered the most "1913 Ford Model T Speedster". Display the customer name and total ordered.
db.orders.aggregate([
    {$unwind: "$orderDetails"},
    {$match: {"orderDetails.productName": "1913 Ford Model T Speedster"}},
    {$group: {_id: "$customerName", TotalOrdered: {$sum: "$orderDetails.quantityOrdered"}}},
    {$sort: {TotalOrdered: -1}},
    {$limit: 1}
])

// 8. How many customers does each sales rep have? Display the Sales rep name and the number of customers.
db.customers.aggregate([
    {$group: {_id: "$salesRep", NumberOfCustomers: {$sum:1}}},
    {$sort: {NumberOfCustomers: -1}}
])