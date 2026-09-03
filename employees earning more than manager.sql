select e.employee_id,
e.name as employee_name
from employee e
where e.salary >
 (select salary from employee where employee_id = e.manager_id)
