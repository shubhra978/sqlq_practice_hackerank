select
name,
department,
hire_date,
(CAST(strftime('%Y', '2024-06-01') AS INTEGER))
-(CAST(strftime('%Y', hire_date) AS INTEGER)) AS years_worked,
(CAST(strftime('%m', '2024-06-01') AS INTEGER))
+(CAST(strftime('%m', hire_date) AS INTEGER)) as months_worked
from employees
order by 2024-(CAST(strftime('%Y', hire_date) AS INTEGER)) desc, name
