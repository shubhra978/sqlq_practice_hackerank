SELECT 
age_bucket, 
Round(sum(CASE WHEN activity_type = 'send' then time_spent end)*100/
(sum(CASE WHEN activity_type = 'send' then time_spent end)+
sum(CASE WHEN activity_type = 'open' then time_spent end)),2) as send_perc,

Round(sum(CASE WHEN activity_type = 'open' then time_spent end)*100/
(sum(CASE WHEN activity_type = 'send' then time_spent end)+
sum(CASE WHEN activity_type = 'open' then time_spent end)),2) as open_perc 
FROM activities
inner JOIN
age_breakdown
on activities.user_id = age_breakdown.user_id
group by age_bucket
