with employee_rank_cte as (
select 
employee_id,
name,
salary,
dense_rank()over(partition by department_id order by salary desc) as salary_rank,
department_id
from employee)

select name,salary, department_name from employee_rank_cte
INNER JOIN
department 
on employee_rank_cte.department_id = department.department_id
where salary_rank = 1
order by department_name,salary desc
