#1.Write a SQL query to count the number of characters except for the spaces for each actor. 
#Return the first 10 actors' name lengths along with their names.

use mavenmovies;

#FUll Actor names:
SELECT LENGTH(REPLACE(CONCAT(first_name, last_name), ' ', '')) AS Actor_name_length,
CONCAT(first_name, ' ', last_name) AS actor_name 
FROM actor 
LIMIT 10;

#first_name:
Select length(replace(first_name,' ','')) as Actor_name_length,first_name from actor
 limit 10;
 
#2.List all Oscar awardees(Actors who received the Oscar award) with their full names and the length of their names.

Select concat(first_name," ",last_name)as Actor_name, awards,length(Replace(concat(first_name,last_name),' ','')) as Name_length
from actor_award
where awards like '%Oscar%'; 

#3.Find the actors who have acted in the film ‘Frost Head.’

Select concat (first_name," " ,last_name) as Frost_head_cast from film
inner join film_actor
on film.film_id=film_actor.film_id
inner join actor
on actor.actor_id=film_actor.actor_id
where title='Frost Head';

#4.Pull all the films acted by the actor ‘Will Wilson.’

Select title as Will_wilson_movies from film
inner join film_actor
on film.film_id=film_actor.film_id
inner join actor
on actor.actor_id=film_actor.actor_id
where First_name='Will' and last_name= 'Wilson';

#5.Pull all the films which were rented and return them in the month of May.

Select distinct title as May_movies_rent_return,rental_date,return_date  from film
inner join inventory
on film.film_id=inventory.film_id
inner join rental
on rental.inventory_id=inventory.inventory_id
where month(rental_date)=5 and month(return_date)=5;

#6.Pull all the films with ‘Comedy’ category.

Select title as Comedy_films,name as movie_category from film
inner join film_category
on film.film_id=film_category.film_id
inner join category
on category.category_id=film_category.category_id
where name ='Comedy';

select city from city 
inner join country
on city.country_id=country.country_id
where country='France';

Select title from film
where title like 'a%a';

select first_name from actor
where first_name =reverse(first_name);


#Extras:
#will wilson and karl berry movies:

SELECT f.title AS Wilson_and_Berry_movies
FROM film f
INNER JOIN film_actor fa1 
ON f.film_id = fa1.film_id
INNER JOIN actor a1
 ON fa1.actor_id = a1.actor_id
INNER JOIN film_actor fa2 
ON f.film_id = fa2.film_id
INNER JOIN actor a2
 ON fa2.actor_id = a2.actor_id
WHERE a1.first_name = 'Will' AND a1.last_name = 'Wilson';

#find all actors who received more than one award

Select concat(first_name,"",last_name)
as full_name,length(concat(first_name,last_name)),
awards from actor_award
where awards like '%,%';

# first_name=last_name:

select first_name,last_name from actor
where length(first_name)=length(last_name);

# a and e vowel:
select concat(first_name,"  " ,last_name) as actor_name from actor
where first_name like '%a%' and first_name like '%e%' and last_name like '%a%' and last_name like '%e%';

#Three awards:
Select concat(first_name,"",last_name)
as full_name,length(concat(first_name,last_name)),
awards from actor_award
where awards like '%,%,%';

# rental month and year same:
Select distinct title as May_movies_rent_return,rental_date,return_date  from film
inner join inventory
on film.film_id=inventory.film_id
inner join rental
on rental.inventory_id=inventory.inventory_id
where month(rental_date)=5 and month(return_date)=5 and year(rental_date)=year(return_date);

# first character as 'a' and 2nd last as 'n'
select first_name from actor
where first_name like '_a%n_%';