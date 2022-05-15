## orders:

- _id
- orderDate
- requiredDate
- shippedDate
- status
- comments
- customerName
- salesRep
- orderDetails
  - productName
  - quantityOrdered
  - priceEach
  - orderLineNumber

## customers:

- _id
- customerName
- contactLastName
- contactFirstName
- phone
- addressLine1
- addressLine2
- city
- state
- postalCode
- country
- salesRep
- creditLimit
- payments
  - checkNumber
  - paymentDate
  - amount

## products:

- _id
- productName
- productScale
- productVendor
- productDescription
- quantityInStock
- buyPrice
- MSRP
- productLine
  - line    
  - textDescription
  - htmlDescription
  - image

## employees

- _id
- lastName
- firstName
- extension
- email
- reportsTo
- jobTitle
- office
  - officeCode
  - city
  - phone
  - addressLine1
  - addressLine2
  - state
  - country
  - postalCode
  - territory