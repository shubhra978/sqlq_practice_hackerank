with user_day_diff as (select 
user_id,
extract (day from max(post_date)-min(post_date)) as day_diff
from posts
WHERE DATE_PART('year', post_date) = 2021
group by user_id)

select * from user_day_diff
where day_diff !=0
