with employee_cte as (
select count(id) as employee_count,department_id
 from employees
group by department_id
)

select department_id, employee_count from employee_cte
where employee_count > 1
