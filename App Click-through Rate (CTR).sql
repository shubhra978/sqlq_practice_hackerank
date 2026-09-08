SELECT 
app_id,
round(
100.0* 
count(case when event_type = 'click' then event_type end)/
count(case when event_type = 'impression' then event_type end),2) as  CTR_rate
FROM events
where extract('year' from timestamp) = 2022
group by app_id;
