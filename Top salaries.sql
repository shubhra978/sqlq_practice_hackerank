with employee_details as (select e.name,
d.department_name, 
e.salary,
rank() over ( partition by department_name order by salary asc) as emp_rank
from employee e
left JOIN
department d
on e.department_id = d.department_id
order by e.salary desc)

select name,department_name, salary from employee_details
ORDER BY emp_rank, department_name ASC, salary DESC;
