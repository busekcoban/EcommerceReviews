
/*

Source: https://www.kaggle.com/datasets/nicapotato/womens-ecommerce-clothing-reviews

About the columns

Clothing ID: Integer Categorical variable that refers to the specific piece being reviewed.
Age: Positive Integer variable of the reviewers age.
Title: String variable for the title of the review.
Review Text: String variable for the review body.
Rating: Positive Ordinal Integer variable for the product score granted by the customer from 1 Worst, to 5 Best.
Recommended IND: Binary variable stating where the customer recommends the product where 1 is recommended, 0 is not recommended.
Positive Feedback Count: Positive Integer documenting the number of other customers who found this review positive.
Division Name: Categorical name of the product high level division.
Department Name: Categorical name of the product department name.
Class Name: Categorical name of the product class name.
*/

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

/*
we can find null values from the reviews. 
For example, clothing id 
72 and 136 are socks
152 is leg warmer
184 is tight
492 is hoodie
772 is sweatshirt
For only 665 we have no idea.
*/

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