// 1. How many products have an MSRP of $100 of greater?
db.products.aggregate([
    {$match: {MSRP:{$gte: 100}}},
    {$count: "MSRP > 100"}
])

db.products.aggregate([
    {$group: {_id: "$MSRP", "Number of Products": {$sum: 1}}},
    {$match: {buyPrice: {$gt: 100}}}
]);

db.products.find({"MSRP":{$gte: 100}}).count()

//2. Calculate the number of orders each customer has placed and display the top 25 in descending order 
//based on orders placed. Display the customer name and the orders placed in a columns called “Orders Placed”.
db.orders.aggregate([
    {$group: {_id: "$customerName", numOrders:{$sum: 1}}},
    {$sort: {"numOrders": -1}},
    {$limit: 25}
])

//3. List the product names where the quantity in stock is greater than 5000
db.products.aggregate([
    {$match: {quantityInStock:{$gt: 5000}}},
    {$project: {_id: 0, productName: 1}}
])
db.products.find({"quantityInStock":{$gt: 5000}}, {_id: 0, productName: 1})

//4. Calculate and display the number of customers in each state. Display the customer name and and number 
//of customers in each state in a column called “Number of Customers in State”. 
//Sort the results by the Number of Customers in State.
db.customers.aggregate([
    {$group: {_id: "$state", totalCustomers:{$sum: 1}}}
])

//5. Which employees manage the most people? Develop a query to calculate the number of people each employees 
//manages. Display the employee name and number of employees employees they manage in a column 
//called “Number of Reports”.
db.employees.aggregate([
    {$group: {_id: "$reportsTo", NumberOfReports:{$sum: 1}}}
])

//6. List the names and credit limit of the customers with the 10 highest credit limits
db.customers.aggregate([
    {$project:{_id: 0, customerName: 1, creditLimit: 1}},
    {$sort: {"creditLimit": -1}},
    {$limit: 10}
])

db.customers.aggregate([
    {$group: {_id: "$creditLimit", "Credit Limit": {$sum: 1}, customerName:{$addToSet: "$customerName"}}},
    {$project: {_id: 1, customerName: 1}},
    {$sort:{_id: -1}},
    {$limit: 10}
])

//Write a query to calculate the number of product lines in the database. 
//Display the result in a column called “Number of Lines”. 
db.products.aggregate([
    {$group:{_id: "$productLine.line", pcount: {$sum: 1}}},
    {$count: "Number of ProductLines"}
])

//8. Which customer made the single largest payment. List the customer name and the payment amount.
db.customers.aggregate([
    {$unwind: "$payments"},
    {$project:{_id: 0, customerName: 1, "payments.amount": 1}},
    {$sort: {"payments.amount": -1}},
    {$limit: 1}
])
