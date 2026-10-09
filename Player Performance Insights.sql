select
player_name,
score
from Players
where player_name in(select winner from Matches)
order by score desc
limit 3
