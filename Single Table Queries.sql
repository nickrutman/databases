use v_art;
-- 1. What would the insert statement look like that would run as the manager adds a new artist to the system? 
insert into artist (fname, mname, lname, dob, dod, country, local)
Values
	('Johannes', NULL, 'Vermeer', 1632, 1674, 'Netherlands', 'n');
    
-- 2. What query would allow all seven columns of values to show up on the screen alphabetically by the last name? 
select *
from artist
order by lname;

-- 3. What SQL statement will run in the background to accomplish this edit? (Don't forget a WHERE clause!)
update artist
set dod=1675
where artist_id = 10;

-- 4. What SQL statement will run in the code that would delete Johannes Vermeer from the database when the manager selects 'Confirm Deletion'? (Don't forget a WHERE clause!)
delete from artist
where artist_id = 10

-- 5. You need a list of their first and last names and phone numbers.
use bike;

select first_name, last_name, phone
from customer
where city = "Houston";

-- 6. You need to have a list showing the bike name, list price and discount price with an alias of 'Discount Price'. Sort the list showing the most expensive bike first. 
select product_name, list_price, ROUND(list_price - 500,2) as 'Discount Price'
from product
where list_price > 5000
order by list_price desc;

-- 7. You need a list of all the staff and their email who are not from your store.
select first_name, last_name, email
from staff
where store_id != 1;

-- 8. You need to list the name, model year, and list price of all the bikes with the word 'spider' somewhere in the name. 
select product_name, model_year, list_price
from product
where product_name like '%spider%';

-- 9. You need to list all bike names that have a range of prices from $500–$550 sorted with the lowest price first.
select product_name, list_price
from product
where list_price between 500 and 550
order by list_price asc;

-- 10. Show the customer's first_name, last_name, phone, street, city, state, zip_code who: have a phone number listed, and whose city has the letters 'ach' or 'och' somewhere in their name of the city, or whose last name is William. Limit the result set to the first five results.
select first_name, last_name, phone, street, city, state, zip_code
from customer
where (phone is not NULL and (city like '%ach%' or city like '%och%')) or last_name = 'William'
limit 5;

-- 11. We need a list of all the products without the year at the end of the product_name string. Notice that some have two years listed, make sure you take those off as well. Order your results by product_id and limit your results to the first 14.
select regexp_replace (product_name, '\\s*-?\\s*\\d{4}(\\/\\d{4})?\\s*$', '') as 'Product Name without Year'
from product
order by product_id
limit 14;

-- 12. List the product name and then take the 2019 model year bikes and divide the price into 3 equal payments. Display the payment with a dollar sign, comma at the thousands place and two decimal places.
select product_name, concat('$', FORMAT(list_price / 3, 2)) as 'One of 3 Payments'
from product
where model_year = 2019;

use magazine;

-- 13. List the magazine name and then take 3% off the magazine price and round to 2 decimal places. 
select magazineName, round(magazinePrice * .97, 2) as '3% off'
from magazine;

-- 14. Show the primary key of id from the subscriber table and using the date of 2020-12-20 as if it were today's date, how long in years, ROUNDED to the nearest year, has it been since their subscription started?
select subscriberKey, ROUND(datediff('2020-12-20', subscriptionStartDate) / 365) as 'Years since subscription'
from subscription;

-- 15.Show the subscriptionStartDate and subscriptionLength and add the  subscriptionLength to the subscriptionStartDate to see the date of how long their subscription will go. Format that date so it takes the format of Month name, number day with comma and then a 4 digit year.
select subscriptionStartDate, subscriptionLength,  date_format(date_add(subscriptionStartDate, interval subscriptionLength Month), '%M %e, %Y') as 'Subscription End'
from subscription;



