/*Customer Conversion & Zero-Transaction Visits*/

/*using cte*/
with customer_cte as (
select v.*,t.*
from visits v
left join transactions t
on v.visit_id = t.visit_id
)

select customer_id,
count(*) as no_of_null_transaction
from customer_cte
where transaction_id is null
group by customer_id
order by customer_id;

/* using join*/
select v.customer_id,
count(*) as no_of_null_transaction
from visits v
left join transactions t
on v.visit_id=t.visit_id
where t.transaction_id  is null
group by v.customer_id
order by v.customer_id desc

/*Identify visits that resulted in multiple transactions where the total spent during the visit exceeded 500. 
Return visit_id, the number of transactions,and the total amount spent, ordered by total spent in descending order.*/ 

/* using join*/
select v.customer_id,
count(t.transaction_id) as no_of_transactions,
sum(t.amount) as total_amount
from visits v
left join transactions t
on v.visit_id=t.visit_id
where t.visit_id is not null
group by v.customer_id
having sum(t.amount)>500
order by v.customer_id desc


/*using cte*/
with customer_cte as (
select v.*,t.*
from visits v
left join transactions t
on v.visit_id = t.visit_id
)

select customer_id,
count(transaction_id) as no_of_null_transaction,
sum(amount) as total_amount
from customer_cte
group by customer_id
having sum(amount) > 500
order by customer_id;
