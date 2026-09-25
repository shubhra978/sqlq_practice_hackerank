SELECT 
    e.name,
    e.department,
    e.salary,
    CAST(ROUND(dept_summary.dept_avg) AS INTEGER) AS dept_avg,
    CAST(ROUND(e.salary - dept_summary.dept_avg) AS INTEGER) AS above_avg_by
FROM employees e
INNER JOIN (
    SELECT 
        department,
        AVG(salary) AS dept_avg
    FROM employees
    GROUP BY department
) dept_summary 
ON e.department = dept_summary.department
WHERE e.salary > dept_summary.dept_avg
ORDER BY above_avg_by DESC;
