

# Women's E-Commerce Clothing Reviews

[Data Source](https://www.kaggle.com/datasets/nicapotato/womens-ecommerce-clothing-reviews)

## About the columns

- *Clothing ID*: Integer Categorical variable that refers to the specific piece being reviewed.
- *Age*: Positive Integer variable of the reviewers age.
- *Title*: String variable for the title of the review.
- *Review Text*: String variable for the review body.
- *Rating*: Positive Ordinal Integer variable for the product score granted by the customer from 1 Worst, to 5 Best.
- *Recommended IND*: Binary variable stating where the customer recommends the product where 1 is recommended, 0 is not recommended.
- *Positive Feedback Count*: Positive Integer documenting the number of other customers who found this review positive.
- *Division Name*: Categorical name of the product high level division.
- *Department Name*: Categorical name of the product department name.
- *Class Name*: Categorical name of the product class name.

We have 23,486 rows and 11 columns.

**How many department names?**

```sql{cmd=true output="markdown"}

SELECT distinct("Department Name"),count("id") FROM reviews
group by distinct("Department Name")
```

**Results:**

| Department Name | count |
|-----------------|-------|
| Bottoms         | 3799  |
| Dresses         | 6319  |
| Intimate        | 1744  |
| Jackets         | 1032  |
| Tops            | 10468 |
| Trend           | 119   |
| NULL            | 14     |

We have 6 department names, 14 null rows.

There are some null classes, let's look at them.
```sql{cmd=true output="markdown"}
select * from reviews where "Class Name" is null
order by "Clothing ID"
```

**Results:**

| id                                                                                                     | Clothing ID | Age | Title                                 | Review Text                                                                                                                                                                                                                                                                                         | Rating | Recommended IND | Positive Feedback Count | Division Name | Department Name | Class Name |
|--------------------------------------------------------------------------------------------------------|-------------|-----|---------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|-------------------------|---------------|-----------------|------------|
| 9444                                                                                                   | 72          | 25  | My favorite socks!!!                  | "I never write reviews, but these socks are so worth it! they are incredibly soft, stretchy, and hug your feet just tight enough where you don't even realize you're wearing socks, but they aren't too tight.i wash them straight away after wearing so i can wear them again. you won't regret it. true to color!" | 5           | 1   | 0                                     | null                                                                                                                                                                                                                                                                                                | null   | null            |
| 13767                                                                                                  | 492         | 23  | So soft!                              | I just love this hoodie! it is so soft and comfortable. i am usually an extra small and that size fit me great. i wish it didn't have the brand on the back of it but i can get over that. this is a very cozy piece that i will wear many times.                                                   | 5      | 1               | 1                       | null          | null            | null       |
| 13768                                                                                                  | 492         | 49  | Wardrobe staple                       | Love this hoodie. so soft and goes with everything. highly recommend for comfort and style. great company.                                                                                                                                                                                          | 5      | 1               | 0                       | null          | null            | null       |
| 13787                                                                                                  | 492         | 48  | null                                  | null                                                                                                                                                                                                                                                                                                | 5      | 1               | 0                       | null          | null            | null       |
| 16216                                                                                                  | 152         | 36  | Warm and cozy                         | Just what i was looking for. soft, cozy and warm.                                                                                                                                                                                                                                                   | 5      | 1               | 0                       | null          | null            | null       |
| 16221                                                                                                  | 152         | 37  | Love!                                 | I am loving these. they are quite long but are prefect to wear with pj shorts or leggings. very soft and cozy.                                                                                                                                                                                      | 5      | 1               | 0                       | null          | null            | null       |
| 16223                                                                                                  | 152         | 39  | """long and warm"""                   | These leg warmers are perfect for me. they are long enough and thick and warm enough to keep me from freezing in cold weather. great for people with large calves.                                                                                                                                  | 5      | 1               | 0                       | null          | null            | null       |
| 18626                                                                                                  | 184         | 34  | Nubby footless tights                 | "These are amazing quality. i agree, size up to not have such a sheer effect. i would not wear them as just leggings without a long shirt covering the butt.they are warm. i wore them under some ski stuff. kept me warm.i also washed them on handwash cycle. seemed to be ok."                                                | 5           | 1   | 5                                     | null                                                                                                                                                                                                                                                                                                | null   | null            |
| 18671                                                                                                  | 184         | 54  | New workhorse                         | These tights are amazing! if i care for them well, i know they will last me seasons upon seasons.                                                                                                                                                                                                   | 5      | 1               | 0                       | null          | null            | null       |
| 20088                                                                                                  | 772         | 50  | Comfy sweatshirt!                     | This sweatshirt is really nice!  it's oversized so best worn with leggings or skinny jeans. it's very warm, without being too thick. it looks almost exactly like the picture.   the quality seems pretty good, but we'll see how it holds up after it's washed.                                    | 5      | 1               | 0                       | null          | null            | null       |
| 21532                                                                                                  | 665         | 43  | So worth it!                          | "Got these on sale...absolutely love eberjey! fabric is super soft and easy to wash. more ""normal"" than other eberjey styles (not lingerie). i'm 5'6"", 125 lbs and small fit well. i am small busted and there is definitely extra room but doesn't make it fit weird at all. highly recommend!" | 5      | 1               | 0                       | null          | null            | null       |
| 22997                                                                                                  | 136         | 47  | Charcoal, pale gray, a bit of silver! | These socks are soft and comfortable, and they are very short so they'll be good with booties. i couldn't tell from the pictures but the pale gray dots are surrounded by a border of subtle silver thread. they're adorable!                                                                       | 5      | 1               | 1                       | null          | null            | null       |
| 23006                                                                                                  | 136         | 33  | Cute itsy socks                       | Love polkadots, love sparkle. these little socks are perfect for booties.                                                                                                                                                                                                                           | 5      | 1               | 0                       | null          | null            | null       |
| 23011                                                                                                  | 136         | 36  | Super socks                           | I love these little socks ? and the dots sparkle. i wear them with my heels and leggings or jump suit pants when i don't want a higher sock or knee-high stockings.                                                                                                                                 | 5      | 1               | 0                       | null          | null            | null       |


**Can we find null class names in review text?**

We can find null values from the reviews. For example, clothing id:
72 and 136 are socks
152 is leg warmer
184 is tight
492 is hoodie
772 is sweatshirt
For only 665 we have no idea.

```sql{cmd=true output="markdown"}
update reviews set 
"Class Name" = 'Legwear',
"Division Name" = 'Initmates', 
"Department Name" = 'Intimate'
where "Clothing ID" in (72,136,152,184)
```
We updated null classes except 665.

**What's average rating?**
```sql{cmd=true output="markdown"}
select avg("Rating") as "Average Rating"
from reviews
```

**Results:**

| Average Rating     |
|--------------------|
| 4.1960316784467342 |

**What's most rating class?**
```sql{cmd=true output="markdown"}
select "Class Name",avg("Rating") as "average rating",count("id") as "rating count"
from reviews 
where "Class Name" is not NULL
group by "Class Name" 
order by avg("Rating") desc
```

**Results:**

| Class Name     | average rating     | rating count |
|----------------|--------------------|--------------|
| Casual bottoms | 4.5000000000000000 | 2            |
| Layering       | 4.3767123287671233 | 146          |
| Jeans          | 4.3609415867480384 | 1147         |
| Legwear        | 4.3160919540229885 | 174          |
| Lounge         | 4.3010130246020260 | 691          |
| Jackets        | 4.2954545454545455 | 704          |
| Sleep          | 4.2850877192982456 | 228          |
| Intimates      | 4.2792207792207792 | 154          |
| Pants          | 4.2658501440922190 | 1388         |
| Fine gauge     | 4.2609090909090909 | 1100         |
| Shorts         | 4.2555205047318612 | 317          |
| Skirts         | 4.2455026455026455 | 945          |
| Outerwear      | 4.1981707317073171 | 328          |
| Swim           | 4.1971428571428571 | 350          |
| Sweaters       | 4.1792717086834734 | 1428         |
| Knits          | 4.1616766467065868 | 4843         |
| Blouses        | 4.1540200193735873 | 3097         |
| Dresses        | 4.1508150023737933 | 6319         |
| Chemises       | 4.0000000000000000 | 1            |
| Trend          | 3.8151260504201681 | 119          |

**What's most 10 recommended products?**
```sql{cmd=true output="markdown"}
select "Class Name","Clothing ID",count("Recommended IND") from reviews 
where "Recommended IND" = '1'
group by "Class Name","Clothing ID"
order by count("Recommended IND") desc
limit 10
```

**Results:**

| Class Name | Clothing ID | count |
|------------|-------------|-------|
| Dresses    | 1078        | 841   |
| Knits      | 862         | 661   |
| Dresses    | 1094        | 621   |
| Dresses    | 1081        | 494   |
| Knits      | 872         | 478   |
| Blouses    | 829         | 436   |
| Dresses    | 1110        | 403   |
| Fine gauge | 895         | 341   |
| Knits      | 868         | 325   |
| Sweaters   | 936         | 294   |

**What's least 10 recommended products?**
```sql{cmd=true output="markdown"}
select "Class Name","Clothing ID",count("Recommended IND") from reviews 
where "Recommended IND" = '0'
group by "Class Name","Clothing ID"
order by count("Recommended IND") desc
limit 10
```

**Results:**

| Class Name | Clothing ID | count |
|------------|-------------|-------|
| Dresses    | 1078        | 183   |
| Knits      | 862         | 145   |
| Dresses    | 1094        | 135   |
| Knits      | 868         | 105   |
| Blouses    | 829         | 91    |
| Dresses    | 1081        | 88    |
| Dresses    | 1110        | 77    |
| Dresses    | 1095        | 68    |
| Knits      | 872         | 67    |
| Knits      | 867         | 66    |

**Do people find these reviews useful?**
```sql{cmd=true output="markdown"}
select "Class Name",count("id") as "review count",sum("Positive Feedback Count") as "positive feedback count",sum("Positive Feedback Count")/count("id") as "feedback rate"
from reviews 
where "Class Name" is not NULL
group by "Class Name"
order by sum("Positive Feedback Count")/count("id") desc
```

**Results:**

| Class Name     | review count | positive feedback count | feedback rate |
|----------------|--------------|-------------------------|---------------|
| Trend          | 119          | 401                     | 3             |
| Dresses        | 6319         | 19510                   | 3             |
| Skirts         | 945          | 2167                    | 2             |
| Knits          | 4843         | 11598                   | 2             |
| Fine gauge     | 1100         | 2215                    | 2             |
| Lounge         | 691          | 1604                    | 2             |
| Blouses        | 3097         | 8440                    | 2             |
| Outerwear      | 328          | 926                     | 2             |
| Jackets        | 704          | 1990                    | 2             |
| Sweaters       | 1428         | 3154                    | 2             |
| Pants          | 1388         | 3327                    | 2             |
| Swim           | 350          | 750                     | 2             |
| Jeans          | 1147         | 2018                    | 1             |
| Layering       | 146          | 192                     | 1             |
| Sleep          | 228          | 399                     | 1             |
| Legwear        | 174          | 216                     | 1             |
| Shorts         | 317          | 531                     | 1             |
| Casual bottoms | 2            | 0                       | 0             |
| Intimates      | 154          | 120                     | 0             |
| Chemises       | 1            | 0                       | 0             |

According to the feedback rate, the reviews in Trend and Dresses classes are found most useful.