
SELECT * FROM reviews
--we have 23486 rows and 11 columns.

/*
There are some questions we need to ask:

What's average rating?
What's most rating class?
What's most recommended products?
What's least recommended products?
Which product has the most comments?
How is the age distribution of the customers making the reviews?
Do people find these reviews useful?

*/

SELECT distinct("Department Name"),count("id") FROM reviews
group by distinct("Department Name")
--3 division categories, 14 null rows.

--What's average rating?
select avg("Rating")
from reviews
--It's 4.19


-- there are some null classes, lets look at them.
select * from reviews where "Class Name" is null
order by "Clothing ID"

select *
from reviews WHERE "Class Name" in ('Legwear')

update reviews set "Class Name" = 'Legwear',
"Division Name" = 'Initmates', "Department Name" = 'Intimate'
where "Clothing ID" in (72,136,152,184)

--What's most rating class?
select "Class Name",avg("Rating") as "average rating",count("id") as "rating count"
from reviews 
where "Class Name" is not NULL
group by "Class Name" order by avg("Rating") desc


--What's most recommended products?
select "Class Name","Clothing ID",count("Recommended IND") from reviews 
where "Recommended IND" = '1'
group by "Class Name","Clothing ID"
order by count("Recommended IND") desc
limit 10

--What's least recommended products?
select "Class Name","Clothing ID",count("Recommended IND") from reviews 
where "Recommended IND" = '0'
group by "Class Name","Clothing ID"
order by count("Recommended IND") desc
limit 10

--Do people find these reviews useful?
select "Class Name",count("id") as "review count",sum("Positive Feedback Count") as "positive feedback count",sum("Positive Feedback Count")/count("id") as "feedback rate"
from reviews 
where "Class Name" is not NULL
group by "Class Name"
order by sum("Positive Feedback Count")/count("id") desc