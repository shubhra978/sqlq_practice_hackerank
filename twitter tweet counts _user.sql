select count_of_tweet_per_user as tweet_bucket,
count(USER_ID) 
from (
SELECT 
USER_ID,
COUNT(tweet_id) as count_of_tweet_per_user
from tweets
where tweet_date between '2022-01-01' and '2022-12-31'
group by USER_ID) as users_num
group by tweet_bucket
