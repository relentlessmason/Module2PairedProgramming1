-- CAMPGROUND TABLE
-----------------------------------------------

-- select name and daily fee of all campgrounds
select distinct name, daily_fee
from campground;

-- select name and daily fee of all campgrounds ordered by campground name
select  name, daily_fee
from campground
order by name;
-- select name, open from month, open to month, and daily fee of the campgrounds where daily fee is less than $100
select name, open_from_mm, open_to_mm, daily_fee
from campground
where daily_fee < '100.00';
-- select name and daily fee of the campgrounds where the campground is open all year long
select name, daily_fee
from campground
where open_from_mm = '01' and open_to_mm = '12';

-- PARK TABLE
-----------------------------------------------

-- select name and description of all parks order by established date in descending order
select name, description
from park
order by establish_date desc;
-- select name and description of all parks in Ohio
select name, description
from park
where location = 'Ohio';
-- select name and description of all parks NOT in Ohio
select name, description
from park
where location !='Ohio';
-- select the total number of visitors for all parks
select visitors
from park;
-- select the average number of visitors for all parks
select AVG(visitors) as avg_num_visitors
from park;

-- SITE TABLE
-----------------------------------------------

-- select all columns from site where utilities is true and order by max RV length with the largest coming first
select *
from site
where utilities
order by max_rv_length desc;
-- select total number of sites that have utilities hook up
select Count(utilities)
from site;

-- RESERVATION TABLE
-----------------------------------------------

-- select reservation id, site id, name, from date, to date of the reservations where the checkin date is between the first and last day of the current month (hard coded month is ok)
select reservation_id, site_id, name, from_date, to_date
from reservation
where from_date between '2022-05-01' and '2022-05-31';
-- select all columns from reservation where name includes 'Reservation'
select *
from reservation
where name like '%Reservation%';
-- select the total number of reservations in the reservation table
select count(reservation) as num_of_reservations
from reservation;
-- select reservation id, site id, name of the reservations where site id is in the list 9, 20, 24, 45, 46
select reservation_id, site_id, name
from reservation
where site_id in ('9', '20', '24', '45', '46');
-- select the date and number of reservations for each date orderd by from_date in ascending order
select from_date, count(reservation_id) as num_of_reservations
from reservation
group by from_date
order by from_date asc;