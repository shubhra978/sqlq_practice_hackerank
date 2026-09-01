with uber_transaction_rank as( 
select user_id,
transaction_date, 
row_number()over(partition by user_id order by transaction_date) as transaction_no,
spend
from transactions)

select user_id,spend,transaction_date
from uber_transaction_rank
where transaction_no = 3
