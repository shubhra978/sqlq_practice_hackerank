SELECT
e.user_id
FROM emails e 
left JOIN
texts t
on e.email_id = t.email_id
where extract('day' from action_date) - extract('day' from signup_date) = 1
order by user_id, action_date;
