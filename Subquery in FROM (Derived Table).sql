with order_detail as (
  select customer_id,
  count(order_id) as order_count 
  from orders 
  group by customer_id)
  
select name,
membership,
order_count,
case when order_count > avg(order_count) over() then 'Yes' else 'No' end as above_average 
from customers
inner join order_detail
on customers.customer_id = order_detail.customer_id
group by order_detail.customer_id
order by order_count desc, name

