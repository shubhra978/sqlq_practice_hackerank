with employee_rank_cte as (
select 
employee_id,
name,
salary,
dense_rank()over(partition by department_id order by salary desc) as salary_rank,
department_id
from employee)

select department_name,name,salary  from employee_rank_cte
INNER JOIN
department 
on employee_rank_cte.department_id = department.department_id
where salary_rank in (1,2,3)
order by department_name,salary desc
