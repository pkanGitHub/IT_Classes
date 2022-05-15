// How many products have an MSRP of $100 of greater?
db.products.count({"MSRP":{$gte:100}});

// Calculate the number of orders each customer has placed and display the top 25 in descending order 
// based on orders placed. Display the customer name and the orders placed in a columns called “Orders Placed”.
db.orders.aggregate(
    {$group: {_id: "$customerName", OrdersPlaced:{$sum:1}}},
    {$sort: {OrdersPlaced:-1}},
    {$limit: 25},
    {$project: {customerName:1, OrdersPlaced:1}}
);

// List the product names where the quantity in stock is greater than 5000
db.products.find(
    {"quantityInStock":{$gt:5000}},
    {"_id":0, "productName":1, "quantityInStock":1}
);

// Calculate and display the number of customers in each state. Display the customer name and and number 
// of customers in each state in a column called “Number of Customers in State”. Sort the results by 
// the Number of Customers in State.
db.customers.aggregate([
    {$group: {_id: "$state", NumberofCustomersInState: {$sum:1}}},
    {$sort: {NumberofCustomersInState:-1}},
    {$project: {_id:0, state:1, NumberofCustomersInState:1}}
]);

// Which employees manage the most people? Develop a query to calculate the number of people each employees manages. 
// -Display the employee name and number of employees employees they manage in a column called “Number of Reports”.
db.employees.aggregate([
    {$group: {_id:"$reportsTo", NumberOfReports: {$sum:1}}},
    {$sort: {NumberOfReports: -1}},
    {$project: {reportsTo:1, NumberOfReports:1}}
]);

// List the names and credit limit of the customers with the 10 highest credit limits
db.customers.aggregate([
    {$sort: {creditLimit: -1}},
    {$limit: 10},
    {$project: {_id:0, customerName: 1, creditLimit: 1}}
]);

// Write a query to calculate the number of product lines in the database. Display the result in a 
// column called “Number of Lines”. 
db.products.aggregate([
    {$group: {_id: "$productLine.line", NumberofLinesEach:{$sum:1}}},
    {$group: {_id:null, NumberofLines: {$sum:"$NumberofLinesEach"}}},
    {$project: {_id:0, NumberofLines:1}}
]);
// above will give you 110 if includes the duplicates,
// or if you want unique product lines is below which gives you 7
db.products.aggregate([
    {$group: {_id: "$productLine.line", NumberofLines: {$sum: 1}}},
    {$count: 'NumberofLines'}
])

// Calculate the dollar value of each product in inventory. You can calculate this by multiplying the 
// quantity in stock by the buy price. Display the product name, quantity in stock, buy price, and in 
// its dollar value in a column called “Dollar Value”. Sort the results in descending order based on 
// dollar value.
db.products.aggregate([
    {$sort:{DollarValue:-1}},
    {$project:{_id:0, productName:1, quantityInStock:1, buyPrice:1, DollarValue:{$multiply:["$quantityInStock", "$buyPrice"]}}}
]);
