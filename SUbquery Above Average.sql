select
name,
department,
salary,
round(salary - (select avg(salary) from employees),1) as above_avg_by
from employees
where salary > (select avg(salary) from employees)
order by salary desc, name
