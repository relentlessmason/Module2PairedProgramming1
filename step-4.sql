-- select the park name, campground name, open_from_mm, open_to_mm & daily_fee ordered by park name and then campground name
select park.name, c.name, c.open_from_mm, c.open_to_mm, c.daily_fee
from campground c
join park using (park_id);
-- select the park name and the total number of campgrounds for each park ordered by park name
select park.name, count(campground_id)
from campground
join park using (park_id)
group by park.name
order by park.name;

-- select the park name, campground name, site number, max occupancy, accessible, max rv length, utilities where the campground name is 'Blackwoods'
select park.name, c.name, s.site_number, s.max_occupancy, s.accessible, s.max_rv_length, utilities
from site s
join campground c using (campground_id)
join park using (park_id)
where c.name = 'Blackwoods';
/*
  select park name, campground, total number of sites (column alias 'number_of_sites') ordered by park
  -------------------------------------------------
    Acadia	Blackwoods	276
    Acadia	Seawall	198
    Acadia	Schoodic Woods	92
    Arches	"Devil's Garden"	49
    Arches	Canyon Wren Group Site	1
    Arches	Juniper Group Site	1
    Cuyahoga Valley	The Unnamed Primitive Campsites	5
  -------------------------------------------------
*/
select park.name, c.name, count(site_id) as number_of_sites
from site
join campground c using (campground_id)
join park using (park_id)
group by park.name, c.name
order by park.name asc, c.name asc;
-- select site number, reservation name, reservation from and to date ordered by reservation from date
select site_id, name, from_date, to_date
from reservation
order by from_date;

/*
  select campground name, total number of reservations for each campground ordered by total reservations desc
  -------------------------------------------------
    Seawall	13
    Blackwoods	9
    "Devil's Garden"	7
    Schoodic Woods	7
    The Unnamed Primitive Campsites	5
    Canyon Wren Group Site	4
    Juniper Group Site	4
  -------------------------------------------------
*/
select c.name, count(reservation_id) as total_reservations
from campground c
join site using (campground_id)
join reservation using (site_id)
group by c.name
order by total_reservations desc;



