select
pclass,
round(avg(age),1) as avg_age_raw,
round(avg(coalesce(age,(select avg(age)from passengers))),1) as avg_age_filled
from
passengers
group by pclass
order by pclass 
