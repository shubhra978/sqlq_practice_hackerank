select
c.name,
c.membership,
count(o.order_id) as order_count,
round(coalesce(sum(o.total),0),2) as total_spent,
case when o.status is null then 'inactive' else 'active' end as status 
from customers c
left join
orders o
on c.customer_id = o.customer_id
group by c.name,c.membership
order by count(o.order_id) desc, name
