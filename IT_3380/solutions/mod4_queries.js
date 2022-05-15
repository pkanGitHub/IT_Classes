
//1. List all zip codes from your home state.
db.zips.find({"state":"MO"}, {"_id" : 1, "city" : 1});

//2. List all of the zip codes from Missouri, Florida, Iowa, and Kansas.
db.zips.find({$or:[{"state":"MO"}, {"state":"FL"}, {"state":"IA"}, {"state":"KS"}]}, {"_id" : 1, "city" : 1});

//3. Which zip codes in Ohio have populations of less than 2000 people?
db.zips.find({"state": "OH", "pop": {$lte: 2000}}, {"_id" : 1, "city" : 1, "pop" : 1})

//4. Which zip codes have populations greater than 50,000 (90,000)people?
db.zips.find({"pop": {$gte: 50000}}, {"_id" : 1, "city" : 1, "pop" : 1})

//5. Which zip codes are located in the city of Columbia, Missouri?
db.zips.find({"city": "COLUMBIA", "state": "MO"}, {"_id": 1})

//6. List the population by zip code for all zip codes in the state of Missouri
db.zips.find({"state": "MO"}, {"_id": 1, "pop": 1})

//7. Which states have cities named springfield?
db.zips.find({"city": "SPRINGFIELD"}, {"state": 1})
db.zips.distinct("state", {city: "SPRINGFIELD"})

//8. How many cities named Springfield are there in the United States?
db.zips.distinct("state", {city: "SPRINGFIELD"}).length

//9. List the zip code, population, and state for cities named Emerald.
db.zips.find({"city": "EMERALD"}, {"_id": 1, "pop": 1, "state": 1})

//10. List the zip code, city, and state for cities with a population of 10 people.
db.zips.find({"pop": {$eq: 10}}, {"_id": 1, "city": 1, "state": 1})

//11. List all of the documents in the stocks collection.
db.stocks.find().pretty()

//12. List the company name and symbol for all companies in the “Information Technology” sector.
db.stocks.find({"Sector": "Information Technology"}, {"Symbol": 1, "Name": 1, "_id": 0})

//13. List the symbol, company name, and stock price for all companies in the “Financials” sector whose stock price is greater than $75.
db.stocks.find({"Sector": "Financials", "Price": {$gt: 75}}, {"_id": 0, "Symbol": 1, "Name": 1, "Price": 1})

//14. List the Company name, sector, and earnings for all companies with earnings (EBITDA) of at least $2.5 Billion
db.stocks.find({"EBITDA": {$gte: 2500000000}}, {"_id": 0, "Name": 1, "Sector": 1, "Earnings": 1, "EBITDA": 1})

//15. List the company name, symbol and sector for all companies with a 52 Week High greater than or equal to 150.
db.stocks.find({"52 Week High": {$gte: 150}}, {"_id": 0, "Name": 1, "Symbol": 1, "Sector": 1})

//16. List the symbol, company name, and stock price for all companies in the “Real Estate” sector whose stock price is less than $50.
db.stocks.find({"Sector": "Real Estate", "Price": {$lt: 50}}, {"_id": 0, "Symbol": 1, "Name": 1, "Price": 1})

//17. List the company name, symbol and dividend yield for companies in the Utilities or Industrials sectors.
db.stocks.find({$or:[{"Sector": "Utilities"}, {"Sector": "Industrials"}]}, {"_id": 0, "Name": 1, "Symbol": 1, "Dividend Yield": 1})

//18. List the company name, symbol and market cap for companies whose dividend yield is greater than 3 or whose earnings/share is less than 1.
db.stocks.find({$or:[{"Dividend Yield": {$gt: 3}},{"Earnings/Share": {$lt: 1}}]}, {"_id": 0, "Name": 1, "Symbol": 1, "Market Cap": 1})