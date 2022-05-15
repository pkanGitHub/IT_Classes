--1. Display the customer first name, last name, and movie titles the rented in 2006. Sort result by customer last name.
SELECT c.first_name, c.last_name, f.title
FROM customer c, rental r, inventory i, film f
WHERE c.customer_id = r.customer_id 
    AND r.inventory_id = i.inventory_id
    AND i.film_id = f.film_id
    AND YEAR(r.rental_date) = 2006
ORDER BY c.last_name;

--2. How many films are in each category? List the category name in a column called "Category Name" 
--and number of films in the category in a column called "Number of Films". Sort by number
--of films in descending order
SELECT c.name AS "Category Name", COUNT(fc.film_id) AS "Number of Films"
FROM category c, film_category fc
WHERE fc.category_id = c.category_id
GROUP BY fc.category_id
ORDER BY COUNT(fc.film_id) DESC;

--3. Calculate each customer's total payments and display the top 15 customers in terms of total payments in descending order.
--Display the customer first and last name and total payment amount in a column called "Total Payments".
SELECT c.first_name, c.last_name, SUM(p.amount) AS "Total Payments"
FROM customer c, payment p
WHERE c.customer_id = p.customer_id
GROUP BY p.customer_id
ORDER BY SUM(p.amount) DESC
LIMIT 15;

--4.Calculate the total payments for each store. Display store id and total payments in a Column called Total Payments.
--Display results in descending order by total payments
SELECT s.store_id, SUM(p.amount) AS "Total Payments"
FROM store s, staff st, payment p
WHERE s.store_id = st.store_id AND st.staff_id = p.staff_id
GROUP BY s.store_id
ORDER BY SUM(p.amount) DESC;

--5. Which films are rented the most? Display the Film name and the total rentals in a column called "Total Rentals"
-- Display results in descending order by total rentals.
SELECT f.title, COUNT(i.film_id) AS "Total Rentals"
FROM film f, inventory i, rental r
WHERE f.film_id = i.film_id AND i.inventory_id = r.inventory_id
GROUP BY f.film_id
ORDER By COUNT(i.film_id) DESC;

--6. Which Film categories are rented the most? Display the category name and the total rentals in a column called "Total Rentals"
-- Display results in descending order by total rentals.
SELECT c.name, COUNT(c.category_id) AS "Total Rentals"
FROM category c, film_category fc, film f, inventory i, rental r
WHERE c.category_id = fc.category_id
    AND fc.film_id = f.film_id
    AND f.film_id = i.film_id
    AND i.inventory_id = r.inventory_id
GROUP BY c.category_id
ORDER BY COUNT(c.category_id) DESC; 

--7. Display the inventory list of movie titles for store number 1. Display the film title and qunatity in stock in a column named "In Stock"
--Display results in alphabetical order of the titles 
SELECT f.title, COUNT(f.title) AS "In Stock"
FROM film f, inventory i, store s
WHERE f.film_id = i.film_id
    AND i.store_id = s.store_id
    AND s.store_id = 1
GROUP BY f.title
ORDER BY f.title;

--8. Which actors have acted in the most movies? 
--List the actor first and last name and the number of movies in a column named "Number of Movies"
--Display results in descending order by number of movies.
SELECT a.first_name, a.last_name, COUNT(a.actor_id) AS "Number of Movies"
FROM actor a, film_actor fa
WHERE a.actor_id = fa.actor_id
GROUP By a.actor_id
ORDER By COUNT(a.actor_id) DESC;


