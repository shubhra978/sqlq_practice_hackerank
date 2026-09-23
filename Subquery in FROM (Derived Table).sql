with order_CTE as (
  select customer_id,
  count(order_id) as order_count
  from orders group by customer_id)

select name,
membership,
order_count,
case when order_count > (select avg(order_count)from order_CTE) then 'Yes' else 'No' end as above_average
from order_CTE
inner join
customers on order_CTE.customer_id  = customers.customer_id
group by customers.customer_id
order by order_count desc, name
