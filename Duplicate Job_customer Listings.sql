with job_req as (select company_id,title,description, count(job_id) as job_count
from job_listings 
group by company_id,title,description)

select count(company_id) from job_req
where job_count >1

/* selecting only unique name*/
with unqiuename as (
  select *,
  row_number() over(partition by customer_id order by first_name) as distinct_name
  from Customers
)
select * from unqiuename
where distinct_name = 1

