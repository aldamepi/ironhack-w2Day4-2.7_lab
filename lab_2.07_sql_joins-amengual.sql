-- Lab 2.7 - SQL join I

use sakila;


--

-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.

select * from film;
select * from film_category;
select * from category;



select name, count(f.film_id) as counter  from film as f
join film_category as fc
on f.film_id = fc.film_id
join category as c
on fc.category_id = c.category_id
group by name
order by counter desc;


select category_id, count(film_id) from film_category
group by category_id
order by count(film_id) desc;

 
 
 
 
 --
 
 -- 2. Display the total amount rung up by each staff member in August of 2005.

select * from staff;
select * from payment;
 
-- p.staff_id s.staff_id
 
select first_name, sum(amount)
-- , payment_date 
from staff as s
join payment as p
on s.staff_id = p.staff_id
where month(payment_date) = 8
group by first_name;
 
 
 --
 
 -- 3. Which actor has appeared in the most films?

 select * from film_actor;
 select * from actor;
 
 -- fa.actor_id a.actor_id
 
select -- a.actor_id,
concat(first_name, ' ', last_name) as actor -- , film_id
, count(film_id) as films
from actor as a
join film_actor as fa
on a.actor_id = fa.actor_id
group by actor
order by films desc
limit 1;

-- Try to get just the first row

-- limit 1
/*
select -- a.actor_id,
concat(first_name, ' ', last_name) as actor 
-- , count(film_id) as films
, max(count(film_id)) as films
from actor as a
join film_actor as fa
on a.actor_id = fa.actor_id
group by actor;
-- order by films desc;
*/
 
 
 
 
 
--

-- 4. Most active customer (the customer that has rented the most number of films)

select * from customer;
select * from rental;

-- c.customer_id  r.customer_id


select concat(first_name, ' ', last_name) as customers, count(rental_id) as rentals
from customer as c
join rental as r
on c.customer_id = r.customer_id
group by customers
order by rentals desc
limit 1;



-- 4.2 The most rented film by the Most active customer (the customer that has rented the most number of films)
 
 select * from film;
 select * from inventory;
 select * from rental;
 select * from customer;
 
 
 
 
 
 
 
 
 
 
 
 
 -- 5. Display the first and last names, as well as the address, of each staff member.

select * from staff;
select * from address;

select first_name, last_name, address 
from staff s
join address a
on s.address_id = a.address_id;





--

-- 6. List each film and the number of actors who are listed for that film.

select * from film;
select * from film_actor;

select title, count(actor_id)
from film f
join film_actor fa
on f.film_id = fa.film_id
group by title;
 
 
 
 
 
 --
 
 -- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
 -- List the customers alphabetically by last name.

select * from customer;
select * from payment;
 
 select c.customer_id, last_name, first_name, sum(amount) as paid
 from customer c
 join payment p
 on c.customer_id = p.customer_id
 group by customer_id
 order by last_name;
 
 
 
 
 
 -- 8. List number of films per category.

select * from category;
select * from film_category;

select name as category, count(film_id)
from category c
join film_category fc
on c.category_id = fc.category_id
group by name;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 