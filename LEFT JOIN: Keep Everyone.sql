select 
c.name,
c.membership,
count(order_id) as order_count,
round(COALESCE(SUM(o.total), 0),2) AS total_spent
from customers c
left join
orders o
on c.customer_id = o.customer_id
group by 
c.name,
c.membership
order by 
round(COALESCE(SUM(o.total), 0),2) desc,
c.name
