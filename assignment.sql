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