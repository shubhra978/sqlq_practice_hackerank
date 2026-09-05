with job_req as (select company_id,title,description, count(job_id) as job_count
from job_listings 
group by company_id,title,description)

select count(company_id) from job_req
where job_count >1
