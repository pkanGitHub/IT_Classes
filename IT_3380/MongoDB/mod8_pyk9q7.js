// Calculate the number of orders for each product that has been ordered. Display the product name and number of 
// orders in a column called “Number of Orders”. Display the results in descending order based on “Number of Orders”. Note: 
// You are calculating the number of orders and not quantity ordered. For example, if Alice orders 3 pizzas today and 5 pizzas next 
// week then pizza orders equals 2 and the quantity of pizzas ordered equals 8.
db.orders.aggregate([
    {$unwind: "$orderDetails"},
    {$match: {"orderDetails.quantityOrdered": {$gt:0}}},
    {$group: {_id: "$orderDetails.productName", NumberOfOrders: {$sum:1}}},
    {$sort: {NumberOfOrders:-1}}
])

// Calculate the total number of each product that has been ordered. Display the product name and quantity ordered in a column called 
// “Quantity Ordered”. Display the results in descending order based on Quantity Ordered.
db.orders.aggregate([
    {$unwind: "$orderDetails"},
    {$match: {"orderDetails.quantityOrdered": {$gt:0}}},
    {$group: {_id: "$orderDetails.productName", QuantityOrdered:{$sum:"$orderDetails.quantityOrdered"}}},
    {$sort: {QuantityOrdered:-1}}
])

// Calculate the total dollar value of the top 25 products that has been ordered in the database. Display the product name and the dollar 
// value in a column called “Total Value”.
db.orders.aggregate([
    {$unwind: "$orderDetails"},
    {$group: {_id: "$orderDetails.productName", TotalValue:{$sum: {$multiply:["$orderDetails.quantityOrdered", "$orderDetails.priceEach"]}}}},
    {$sort: {"TotalValue":-1}},
    {$limit: 25}
])

// Calculate the number of orders each customer has placed and display the top 25 in descending order based on orders placed. Display the 
// customer name and the orders placed in a columns coaaled “Orders Placed”.
db.orders.aggregate([
    {$group: {_id: "$customerName", OrdersPlaced: {$sum:1}}},
    {$sort: {OrdersPlaced:-1}},
    {$project: {customerName: 1, OrdersPlaced:1}},
    {$limit: 25}
])

// Calculate the total payments made each year. Display the year and total payments in a column called “Total Payments”.
db.customers.aggregate([
    {$unwind: "$payments"},
    {$group: {_id: {year: {$year: "$payments.paymentDate"}}, TotalPayments: {$sum: "$payments.amount"}}},
    {$sort: {_id: 1}}
])

// Calculate the total payments made each month in 2004. Display the month and total payments in a column called “Total Payments”. Order 
// the results by month in ascending order. **Hint: You will need to use the $addFields to add a field for year using the $year function, then 
// match for 2004
db.customers.aggregate([
    {$unwind: "$payments"},
    {$addFields: {"year" : {$year: "$payments.paymentDate"}}},
    {$match: {"year":2004}},
    {$group: {_id: {$month: "$payments.paymentDate"}, TotalPayments: {$sum: "$payments.amount"}}},
    {$sort: {_id: 1}}
])

// Calculate the total payments made each day in December of 2004. Display the day in a column named “Day” and total payments in a column called 
// “Total Payments”. Order the results by day in ascending order. **Hint: You will need to use the $addFields to add a field for year and month, 
// using the $year and $month functions, then match for 2004 and 12
db.customers.aggregate([
    {$unwind: "$payments"},
    {$addFields: {"year" : {$year: "$payments.paymentDate"}, "month": {$month: "$payments.paymentDate"}}},
    {$match: {"year":2004, "month":12}},
    {$group: {_id: {days: {$dayOfMonth: "$payments.paymentDate"}}, TotalPayments: {$sum: "$payments.amount"}}},
    {$sort: {_id: 1}}
])

// Calculate the total payments made by each customer in the database who has made a payment. Display the customer name and the total payments in a 
// column named “Total Payments”. Order the results by total payments.
db.customers.aggregate([
    {$unwind: "$payments"},
    {$group: {_id: "$customerName", TotalPayments: {$sum: "$payments.amount"}}},
    {$sort: {TotalPayments:-1}}
])

// Calculate and display the number of customers in each state. Display the customer name and and number of customers in each state in a column 
// called “Number of Customers in State”. Sort the results by the Number of Customers in State.
db.customers.aggregate([
    {$group: {_id: {state:"$state"}, NumberOfCustomerInState: {$sum:1}}},
    {$sort: {NumberOfCustomerInState:-1}}
])

// Which employees manage the most people? Develop a query to calculate the number of people each employees manages. Display the employee number 
// and number of employees employees they manage in a column called “Number of Reports”.
db.employees.aggregate([
    {$group: {_id: "$reportsTo", NumberOfReports: {$sum:1}, empNum: {$addToSet: "$_id"}}},
    {$sort: {NumberOfReports: -1}}
]); // with the only way I can have some sort of employee Number printing... 
// or if it was a typo where he is asking for employee name instead of number, then just remove the addToSet.

// Write a query to calculate the number of product lines in the database. Display the result in a column called “Number of Lines”.
db.products.aggregate([
    {$unwind: "$productLine"},
    {$group: {_id: "$productLine.line", NumberOfLines: {$sum: 1}}},
    {$count: 'NumberOfLines'}
])

// Calculate the dollar value of each product in inventory. You can calculate this by multiplying the quantity in stock by the buy price. Display the 
// product name, quantity in stock, buy price, and in its dollar value in a column called “Dollar Value”. Sort the results in descending order based 
// on dollar value.
db.products.aggregate([
    {$sort:{DollarValue:-1}},
    {$project:{_id:0, productName:1, quantityInStock:1, buyPrice:1, DollarValue:{$multiply:["$quantityInStock", "$buyPrice"]}}}
]);