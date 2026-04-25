use v_art;
-- 1. When you visit the Virtual Art Gallery Database and you search by Period/Style and you choose Impressionism, you get two resulting images ("Woman in the Garden" and "Irises"). What query would be used in the code here to allow the user to see these images? No join is needed. 
select artfile
from artwork
where period = 'Impressionism';

-- 2. When you visit the Virtual Art Gallery Database, search by Subject and type in the word flower, you get three images. What query would have allowed the user to get those results (remember, the keyword might have been 'flowers' but they typed 'flower') .
select ar.artfile
from artwork ar
join artwork_keyword ak
on ar.artwork_id = ak.artwork_id
join keyword k
on ak.keyword_id = k.keyword_id
where k.keyword like '%flower%';

-- 3. List all the artists from the artist table, but only the related artwork from the artwork table. We need the first name, last name, and artwork title. 
select a.fname, a.lname, title
from artist a
left join artwork ar
on a.artist_id = ar.artist_id;

-- 4. List all subscriptions with the magazine name, last name, first name, and sort alphabetically by magazine name. 
use magazine;

select m.magazineName, su.subscriberLastName, su.subscriberFirstName
from magazine m
join subscription s
on m.magazineKey = s.magazineKey
join subscriber su
on s.subscriberKey = su.subscriberKey
order by m.magazineName;

-- 5. List all the magazines that Samantha Sanders subscribes to. 
select m.magazineName
from magazine m
join subscription s
on m.magazineKey = s.magazineKey
join subscriber su
on s.subscriberKey = su.subscriberKey
where su.subscriberLastName = 'Sanders' and su.subscriberFirstName = 'Samantha';

-- 6.  List the first five employees from the Customer Service Department. Put them in alphabetical order by last name.
use employees;

select e.first_name, e.last_name
from employees e
join dept_emp de
on e.emp_no = de.emp_no
join departments d
on de.dept_no = d.dept_no
where d.dept_name = 'Customer Service'
order by e.last_name
limit 5;

-- 7. Find out the current salary and department of Berni Genin. You can use the ORDER BY and LIMIT to get just the most recent salary.
select e.first_name, e.last_name, d.dept_name, s.salary, s.from_date
from employees e
join dept_emp de
on e.emp_no = de.emp_no
join departments d
on de.dept_no = d.dept_no
join salaries s
on e.emp_no = s.emp_no
where e.first_name = 'Berni' and e.last_name = 'Genin'
order by from_date desc
limit 1;

-- 8. Get the average quantity that we have in all our bike stocks. Round to the nearest whole number. 
use bike;

select round(avg(quantity)) as 'Stock Average'
from stock;

-- 9. Show each bike that needs to be reordered. Filter the results to only the lowest quantity of zero. Order by product_name The image below show the first 12 of 24 rows total. You don't need to use a LIMIT.  (Hint for this one: Two different stores have the same bike that needs to be reordered. You only need it to show up once.)
select distinct product_name
from product p
join stock s
on p.product_id = s.product_id
where s.quantity = 0
order by p.product_name;

-- 10. How many of each category of bikes do we have in stock (inventory) at our "Baldwin Bikes" store, which has the store_id of 2. We need to see the name of the category as well as the number of bikes we have in inventory in the category. Sort by lowest inventory items first. 
select distinct c.category_name, sum(s.quantity) as instock
from category c
join product p
on c.category_id = p.category_id
join stock s
on p.product_id = s.product_id
join store st
on s.store_id = st.store_id
where s.quantity > 0 and st.store_id = 2
group by c.category_name
order by instock;

-- 11. How many employees do we have?
use employees;

select count(first_name) as 'Number of Employees'
from employees;

-- 12. Get the average salaries in each department. We only need those departments that have average salaries that are below 60,000. Format the salary to 2 decimal places and a comma in the thousands place. 
select d.dept_name, format(avg(s.salary), 2) as average_salary
from departments d
join dept_emp de
on d.dept_no = de.dept_no
join salaries s
on de.emp_no = s.emp_no
group by d.dept_name
having avg(s.salary) < 60000;

-- 13. Find out how many females work in each department. Sort by department name.
select d.dept_name, count(e.gender) as 'Number of Females'
from departments d
join dept_emp de
on d.dept_no = de.dept_no
join employees e
on de.emp_no = e.emp_no
where e.gender = 'F'
group by d.dept_name
order by d.dept_name;
