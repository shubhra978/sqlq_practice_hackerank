SELECT
c.company_code,
c.founder,
COUNT(DISTINCT l.lead_manager_code),
COUNT(DISTINCT sm.senior_manager_code),
COUNT(DISTINCT m.manager_code),
COUNT(DISTINCT e.employee_code)
FROM Company c
INNER JOIN Lead_Manager l
ON c.company_code = l.company_code
INNER JOIN Senior_Manager sm
ON l.lead_manager_code = sm.lead_manager_code
INNER JOIN Manager m
ON sm.senior_manager_code = m.senior_manager_code
INNER JOIN Employee e
ON m.manager_code = e.manager_code
GROUP BY
c.company_code,
c.founder
ORDER BY
c.company_code;
