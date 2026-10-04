select name,
department_id,
salary,
dense_rank()OVER(partition by department_id order by salary desc) as salary_rank
 from employees
