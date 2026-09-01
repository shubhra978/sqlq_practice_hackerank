with grouped_month_avg_rev as 
(SELECT 
extract('month' from submit_date) as mth,
product_id,
round(avg(stars),2) 
FROM reviews
group by extract('month' from submit_date), product_id)

select * from grouped_month_avg_rev
