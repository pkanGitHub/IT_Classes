## Make folder and copy file into MongoDB Server
1. In Docker directory copy file into docket using 
   `cp mongo-files mongo container:/root/`
2. Log into the server root of the mongo-container
  * `docker exec -it mongo-container bash`
3. `cd ~/` into home root directory
4. `ls` to see if the files are copied to there
5. The following commands will create a database named module4 and load the data from the zips.json and sp500-stocks.json into collections named zips and stocks.
   - `mongoimport --db module4 --collection stocks --drop --file sp500-stocks.json --jsonArray`
   - `mongoimport --db module4 --collection zips --drop --file zips.json --jsonArray`

## Log into the MongoDB Server
1. Log into the server root of the mongo-container
  * `docker exec -it mongo-container bash`
2. In root, type `mongo` to continue
3. `show dbs` to see the databases
4. `use module4` 

### Understanding the Commands
**mongoimport** : the mongodb command to load data into a database
–**db**: specifies which database to load the data into. If the database does not exist, it will be created.
–**collection**: specifies which collection in the database to load the data into. If the collection does not exist, it will be created.
–**drop**: if the collection exists before the import it will be dropped and a new collection created.
–**file**: specifies which file to load the data from.
–**jsonArray**: specifies the data format in the file is a JSON array.

#### zip 
- _id
- city
- loc
- pop
- state

#### stocks
- 52 Week High
- 52 Week Low
- Dividend Yield
- EBITDA
- Earnings/Share
- Market Cap
- Name
- Price
- Price/Book
- Price/Earnings
- Price/Sales
- SEC Filings
- Sector
- Symbol


### Aggregate
<!-- What are the 10 most populous cities in MO? -->
- $match: Only look at documents where state = MO
- $group: group document based on city & sum the population
- $sort: sort by total population
- $limit: to print out 10

<!-- List the cities in Illinois that have 3 or more zip codes? Sort in descending order by total number of zip codes. Hint: count multiple occurrences of a city’s name. -->
- $match: match state = IL
- $group: group by city
- $sum: number of zips
- (counting the number of zip code, not the city)
- $match: match total zips > 3
- $sort: -1
