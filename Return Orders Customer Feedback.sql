select o.customer_name,
round(count(case when r.return_date is not null then o.order_id end)*100/
count(o.order_id)) as percentage_of_return_orders
from orders o
left join
returns r
on o.order_id = r.order_id
group by o.customer_name
having
round(count(case when r.return_date is not null then o.order_id end)*100/
count(o.order_id)) > 50
order by o.customer_name



