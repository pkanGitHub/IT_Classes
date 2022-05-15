//1. Which states have zip codes with populations greater than (75,000) people?
db.zips.aggregate([
    {$match: {"pop":{$gte: 75000}}},
    {$group: { _id: "$state" }}
])

//2. Which cities have populations greater than 200,000 people?
db.zips.aggregate([
    {$group:{_id: {"city":"$city", "state":"$state"}, PopulationOfCity: {$sum: "$pop"}}},
    {$match: {PopulationOfCity:{$gt: 200000}}}
])

//3. What is the total population of each city in FL. Sort in ascending order based on total population?
db.zips.aggregate([
    {$match: {state: "FL"}},
    {$group: {_id: "$city", TotalPopulation: {$sum: "$pop"}}},
    {$sort: {TotalPopulation: 1}}
])

db.zips.aggregate([
    {$match: {state: "FL"}},
    {$group: {_id: "$city", TotalPopulation: {$sum: "$pop"}}},
    {$sort: {TotalPopulation: 1}}
])

//4. What are the 10 most populous cities in MO?
db.zips.aggregate([
    {$match: {state: "MO"}},
    {$group: {_id: "$city", totalPop: {$sum: "$pop"}}},
    {$sort: {totalPop: -1}},
    {$limit: 10}
])

//5. What is the population of New York City, NY?
db.zips.aggregate([
    {$match: {state: "NY", city: "NEW YORK"}},
    {$group: {_id: "$city", totalPop: {$sum: "$pop"}}}
])

//6. List the cities in Illinois that have 3 or more zip codes? 
//Sort in descending order by total number of zip codes. Hint: count multiple occurrences of a city’s name.
db.zips.aggregate([
    {$match: {state: "IL"}},
    {$group: {_id: "$city", totalzips: {$sum: 1}}},
    {$match: {totalzips: {$gte: 3}}},
    {$sort: {totalzips: -1}}
])

//7. Which state has the fewest number of zip codes?
db.zips.aggregate([
    {$group: {_id: "$state", numZips: {$sum: 1}}},
    {$sort : { numZips: 1 }},
    {$limit: 1}
])

//8. What is the name and total population of the most populous city in the zips database?
db.zips.aggregate([
    {$group: {_id: "$city", totalPop: {$sum: "$pop"}}},
    {$sort: {totalPop: -1}},
    {$limit: 1}
])
// -- This is the most correct result but both queries return the same result
db.zips.aggregate([
    {$group:{_id: {"city":"$city", "state":"$state"}, totalPop: {$sum: "$pop"}}},
    {$sort: {totalPop: -1}},
    {$limit: 1}
])

//9. What is the population of the least populated zip code in each state
db.zips.aggregate([
    {$group: {_id: "$city", totalPop: {$sum: "$pop"}}},
    {$sort: {totalPop: 1}},
    {$limit: 1}
])



// 10. What is the name and total population for the 15 most populous cities in the zips database?
db.zips.aggregate([
    {$group: {_id: "$city", totalPop: {$sum: "$pop"}}},
    {$sort: {totalPop: -1}},
    {$limit: 15}
])

// -- This is the most correct result. Both queries return slightly different results
db.zips.aggregate([
    {$group:{_id: {"city":"$city", "state":"$state"}, totalPop: {$sum: "$pop"}}},
    {$sort: {totalPop: -1}},
    {$limit: 15}
])

// 11. List the symbol and company name of the companies with the ten (10) highest stock price.
db.stocks.aggregate([
    {$sort: {Price: -1}},
    {$limit: 10},
    {$project: {_id: 0, Symbol: 1, Name: 1, Price: 1}}
])

//12. List total earnings (EBITDA) by sector.
db.stocks.aggregate([
    {$group: {_id: "$Sector", TotalEarnings: {$sum: "$EBITDA"}}},
])

//13. List the average earnings by sector
db.stocks.aggregate([
    {$group: {_id: "$Sector", AvgEarnings: {$avg: "$EBITDA"}}},
])

//14. Show the company name and symbol of the top 10 companies in earnings in the Industrials sector?
db.stocks.aggregate([
    {$match: {Sector: "Health Care"}},
    {$sort: {"Industrials": -1}},
    {$limit: 10},
    {$project: {_id: 0, Symbol: 1, Name: 1}}
])

//15. List the names of the companies in the Information Technology sector that paid dividends to 
// shareholders. You will know this if the “Dividend Yield” field is greater than 0.
db.stocks.aggregate([
    {$match: {"Sector": "Information Technology", "Dividend Yield": {$gt: 0}}},
    {$project: {_id: 0, Name: 1}}
])

//16. What are the top 10 companies in the "Health Care" sector when it comes to "Earnings/Share"?
db.stocks.aggregate([
    {$match: {Sector: "Health Care"}},
    {$sort: {"Earnings/Share": -1}},
    {$limit: 10},
    {$project: {_id: 0, Name: 1, "Earnings/Share": 1}}
])

//17. Calculate the total earnings (EBITDA) for all companies in the Health Care sector.
db.stocks.aggregate([
    {$match: {Sector: "Health Care"}},
    {$group: {_id: "$Sector", TotalEarnings: {$sum: "$EBITDA"}}}
])

//18. Calculate the number of outstanding shares for companies in the Industrials sector. 
//Number of outstanding shares can be calculated by dividing the Market Cap by the Price. 
//Display company name, symbol, and number of outstanding shares in ascending order.
db.stocks.aggregate([
    {$match: {Sector: "Industrials"}},
    {$project: {_id: 0, Name: 1, Symbol: 1, OutstandingShares:{$divide: ["$Market Cap", "$Price"]}}},
    {$sort: {OutstandingShares: -1}}
])

