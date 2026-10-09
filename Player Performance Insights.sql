Player Performance Insights

select
player_name,
score
from Players
where player_name in(select winner from Matches)
order by score desc
limit 3

Player Details
  
SELECT m.*,score
FROM matches m
inner join players on players.player_name=m.winner
order by m.match_date desc
limit 5
