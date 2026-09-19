select genre,
count(title) as movie_count,
round(avg(rating),2) as avg_rating,
round(sum(revenue_millions))as total_revenue
from movies
group by genre
having count(title)>=5 and avg(rating) >6.5
order by avg(rating) desc
