-- 1. Display the customer first name, last name, and movie titles the rented in 2006. Sort result by customer last name.
SELECT a.first_name, a.last_name, d.title
FROM customer AS a
LEFT JOIN rental AS b ON a.customer_id = b.customer_id
LEFT JOIN inventory AS c ON b.inventory_id = c.inventory_id
LEFT JOIN film AS d ON c.film_id = d.film_id
WHERE YEAR(b.rental_date) = "2006"
ORDER BY a.last_name;
-- ## unsure

-- 2. How many films are in each category? List the category name in a column called "Category Name" and number of films in the category 
-- in a column called "Number of Films". Sort by number of films in descending order
SELECT (b.name) AS CategoryName, COUNT(a.film_id) AS NumberOfFilms
FROM film_category AS a
LEFT JOIN category AS b ON a.category_id = b.category_id
GROUP BY a.category_id
ORDER BY NumberOfFilms DESC;


-- 3. Calculate each customer's total payments and display the top 15 customers in terms of total payments in descending order. Display the customer 
-- first and last name and total payment amount in a column called "Total Payments".
SELECT a.first_name, a.last_name, SUM(b.amount) AS TotalPayments
FROM customer AS a
LEFT JOIN payment AS b ON a.customer_id = b.customer_id
GROUP BY a.customer_id
ORDER BY TotalPayments DESC
LIMIT 15;

-- 4. Calculate the total payments for each store. Display store id and total payments in a Column called Total Payments. Display results in 
-- descending order by total payments
SELECT b.store_id, SUM(c.amount) AS TotalPayments
FROM staff AS a
LEFT JOIN store AS b ON a.store_id = b.store_id
LEFT JOIN payment AS c ON a.staff_id = c.staff_id
GROUP BY b.store_id
ORDER BY TotalPayments DESC;

-- 5. Which films are rented the most? Display the Film name and the total rentals in a column called "Total Rentals". Display results in descending 
-- order by total rentals.
SELECT c.title, COUNT(a.rental_id) AS TotalRentals
FROM rental AS a
LEFT JOIN inventory AS b ON a.inventory_id = b.inventory_id
LEFT JOIN film AS c ON b.film_id = c.film_id
GROUP BY c.film_id
ORDER BY TotalRentals DESC;


-- 6. Which Film categories are rented the most? Display the category name and the total rentals in a column called "Total Rentals". Display results 
-- in descending order by total rentals.
SELECT e.name, COUNT(a.rental_id) AS TotalRentals
FROM rental AS a
LEFT JOIN inventory AS b ON a.inventory_id = b.inventory_id
LEFT JOIN film AS c ON b.film_id = c.film_id
LEFT JOIN film_category AS d ON c.film_id = d.film_id
LEFT JOIN category AS e ON d.category_id = e.category_id
GROUP BY e.category_id
ORDER BY TotalRentals DESC;


-- 7. Display the inventory list of movie titles for store number 1. Display the film title and quantity in stock in a column named "In Stock". Display 
-- results in alphabetical order of the titles 
SELECT b.title, COUNT(a.film_id) AS InStock
FROM inventory AS a
LEFT JOIN film_text AS b ON a.film_id = b.film_id
WHERE a.store_id = 1
GROUP BY b.title
ORDER BY b.title ASC;

-- 8. Which actors have acted in the most movies? List the actor first and last name and the number of movies in a column named "Number of Movies". 
-- Display results in descending order by number of movies.
SELECT c.first_name, c.last_name, COUNT(a.film_id) AS NumberOfMovies
FROM film AS a
LEFT JOIN film_actor as b ON a.film_id = b.film_id
LEFT JOIN actor as c ON b.actor_id = c.actor_id
GROUP BY c.actor_id
ORDER BY NumberOfMovies DESC;