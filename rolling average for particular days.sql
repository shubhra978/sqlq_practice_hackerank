select
user_id,
tweet_date,
round(avg(tweet_count)
  over (partition by user_id
  order by tweet_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW),2)  /* ROWS BETWEEN 2 PRECEDING AND CURRENT ROW used for 3 days */
as rolling_avg_3d
from tweets
