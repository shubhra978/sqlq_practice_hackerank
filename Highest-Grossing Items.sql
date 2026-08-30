/* creating cte for sum of product category */
with total_spend_category as (
Select category,
product,
spend, 
extract('year' from transaction_date) as spending_year,
sum(spend)over(partition by product order by spend desc) as total_spend /* adding as per product category */
from product_spend
where extract('year' from transaction_date)=2022
), 


/* ranking all the product category sum */
product_rank as(
select category,
product,
total_spend,
rank() over(partition by category order by total_spend desc) as product_rank_category /* ranking as per product category */
from total_spend_category
) 

select category,
product,
total_spend from product_rank
where product_rank_category in (1,2)
