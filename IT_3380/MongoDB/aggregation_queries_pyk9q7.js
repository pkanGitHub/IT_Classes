// Which states have zip codes with populations greater than (75,000) people?
db.zips.aggregate([
    {$match:{pop:{$gt:75000}}},
    {$project: {state:1}}
]);

// Which cities have populations greater than 200,000 people?
db.zips.aggregate([
    {$group: {_id: {$concat: ["$city",", ","$state"]}, TotalPopulation: {$sum: "$pop"}}},
    {$match : {TotalPopulation:{$gt:200000}}},
    {$sort: {TotalPopulation:1}} //for easier reading
]);

// What is the total population of each city in FL. Sort in ascending order based on total population?
db.zips.aggregate([
    {$match:{state:"FL"}},
    {$group:{_id:"$city",TotalPopulation:{$sum: "$pop"}}},
    {$sort: {TotalPopulation: 1}},
    {$project: {city:1, TotalPopulation:1}}
]);

// What are the 10 most populous cities in MO?
db.zips.aggregate([
    {$match: {state: "MO"}},
    {$group: {_id: "$city", TotalPopulation:{$sum: "$pop"}}},
    {$sort: {TotalPopulation: 1}},
    {$limit: 10}
]);

// What is the population of New York City, NY?
db.zips.aggregate([
    {$match:{state:"NY",city:"NEW YORK"}},
    {$group:{"_id":"NEW YORK",TotalPop:{$sum:"$pop"}}},
]);

// List the cities in Illinois that have 3 or more zip codes? Sort in descending order by total number of zip codes. Hint: count multiple occurrences of a city’s name.
db.zips.aggregate([
    {$match: {state: "IL"}},
    {$group: {_id: "$city", totalNumberZipCode: {$sum: 1}}}, //sum can be use as count
    {$match: {totalNumberZipCode: {$gte:3}}},
    {$sort: {totalNumberZipCode: -1}}
]);

// Which city has the fewest number of zip codes?
db.zips.aggregate([
    {$group: {_id: {$concat: ["$city",", ","$state"]}, TotalZip: {$sum:1}}},
    {$sort: {TotalZip: 1}},
    {$limit: 1}
    // Written based on cities for different states
]);

// What is the name and total population of the most populous city in the zips database?
db.zips.aggregate([
    {$group: {_id:{$concat:["$city",", ", "$state"]}, TotalPop:{$sum: "$pop"}}},
    {$sort: {TotalPop:-1}},
    {$limit: 1}
    // Calculate based on cities from different states
]);

// What is the name and total population of the least populous city in the zips database?
db.zips.aggregate([
    {$group: {_id:{$concat:["$city",", ", "$state"]}, TotalPop:{$sum: "$pop"}}},
    {$sort: {TotalPop:1}},
    {$limit: 1}
    // Calculate based on cities from different states
]);

// What is the name and total population for the 15 most populous cities in the zips database?
db.zips.aggregate([
    {$group: {_id:{$concat:["$city",", ", "$state"]}, TotalPop:{$sum: "$pop"}}},
    {$sort: {TotalPop:-1}},
    {$limit: 15}
    // Calculate based on cities from different states
]);

// List the symbol and company name of the companies with the ten (10) highest stock price.
db.stocks.aggregate([
    {$sort: {Price: -1}}, // -1 is sort by most to least
    {$limit: 10},
    {$project: {_id:0, Symbol: 1, Name: 1}}
]);

// List total earnings (EBITDA) by sector.
db.stocks.aggregate([
    {$group: {_id: "$Sector", TotalEarning: {$sum: "$EBITDA"}}}
]);

// List the average earnings by sector
db.stocks.aggregate([
    {$group:{_id:"$Sector", AverageEarning: {$avg: "$EBITDA"}}}
]);

// Show the company name and symbol of the top 10 companies in earnings in the Industrials sector?
db.stocks.aggregate([
    {$match: {Sector: "Industrials"}},
    {$sort: {EBITDA: -1}},
    {$limit: 10},
    {$project: {_id:0, Name:1, Symbol:1}}
]);

// List the names of the companies in the Information Technology sector that paid dividends to shareholders. You will know this if the “Dividend Yield” field is greater than 0.
db.stocks.aggregate([
    {$match: {Sector: "Information Technology", "Dividend Yield": {$gt:0}}},
    {$project: {_id:0, Name:1}}
]);

// What are the top 10 companies in the “Health Care” sector when it comes to “Earnings/Share”?
db.stocks.aggregate([
    {$match: {Sector: "Health Care"}},
    {$sort: {"Earnings/Share": -1}},
    {$limit: 10},
    {$project: {_id:0, Name:1}}
]);

// Calculate the total earnings (EBITDA) for all companies in the Information Technology sector.
db.stocks.aggregate([
    {$match: {Sector: "Information Technology"}},
    {$group: {_id:"Information Technology", TotalEarnings:{$sum: "$EBITDA"}}},
    {$project: {TotalEarnings:1}}
]);

// Calculate the number of outstanding shares for companies in the Industrials sector. Number of outstanding shares can be calculated by dividing the Market Cap 
// by the Price. Display company name, symbol, and number of outstanding shares in ascending order.
db.stocks.aggregate([
    //divde market cap by price
    {$match:{Sector: "Industrials"}},
    {$project: {_id:0, Name:1, Symbol:1, OutstandingShares:{$divide: ["$Market Cap", "$Price"]}}},
    {$sort: {OutstandingShares:1}}
]);