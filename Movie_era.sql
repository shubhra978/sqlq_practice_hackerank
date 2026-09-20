select 
case
when year < 2000 then 'Classic'
when year between 2000 and 2009 then 'Modern'
when year >= 2010 then 'Recent'
else 'unknown'
end as era,
round(count(title),2) as movie_count,
round(avg(rating),2) as avg_rating,
round(avg(revenue_millions),2)
from movies
group by era
order by era
