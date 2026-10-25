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

/*
Problem: For each customer who made at least one purchase, calculate:

Total revenue generated (lifetime_spend)

Total number of transactions

Average amount spent per transaction (avg_transaction_amount), rounded to 2 decimal places
*/
/*using cte*/
with cust_cte as (
select v.*,t.*
from
visits v
left join
transactions t
on v.visit_id = t.visit_id
)

select customer_id,
sum(amount) as total_amt,
count(transaction_id) as no_of_transaction,
round(avg(amount) over(partition by customer_id),2) as avg_transaction_amount
from cust_cte
group by customer_id,amount
having count(transaction_id)>=1
order by customer_id
