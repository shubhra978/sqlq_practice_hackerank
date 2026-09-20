/*with join*/
select
name
from customers c
left join
orders o
on c.customer_id = o.customer_id
where order_id is null
order by name


/*with subquery*/

select
name
from customers c
left join
orders o
on c.customer_id = o.customer_id
where order_id is null
order by name
