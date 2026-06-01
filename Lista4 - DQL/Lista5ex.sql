use sakila;
UNLOCK TABLES;

#A)

select c.first_name, c.last_name from customer c
left join actor a
on c.first_name = a.first_name and C.last_name = a.last_name;

#B)
select a.first_name, a.last_name, c.first_name, c.last_name from actor a
right join customer c
on a.first_name = c.first_name and a.last_name = c.last_name;

#C)
select a.first_name, a.last_name, c.first_name, c.last_name from actor a
join customer c
on a.last_name = c.last_name;

#D)
select c.city, co.country from  city c
left join country co
on co.country_id = c.country_id;

#E)
select f.title, f.description, f.release_year, l.name as language from film f
left join language l
on f.language_id = l.language_id;

#F)
select s.first_name, s.last_name, a.address, c.city, a.district, a.postal_code from staff s
left join address a 
on s.address_id = a.address_id
left join city c
on a.city_id = c.city_id;