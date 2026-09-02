with second_highest as (SELECT salary
FROM employee
where salary <
(select  /* finding max salary and comparing with it*/
max(salary) 
from employee)
order by salary desc)

select * from second_highest
limit 1
