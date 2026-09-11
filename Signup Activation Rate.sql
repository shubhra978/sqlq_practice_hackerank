SELECT round(count(signup_action)*1.0/count(*),2) 
FROM emails e LEFT JOIN texts t ON 
e.email_id = t.email_id AND signup_action = 'Confirmed'
