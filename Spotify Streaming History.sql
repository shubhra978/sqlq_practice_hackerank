DECLARE @enddate DATE = '2022-08-04';

SELECT
sh.user_id,
sh.song_id
FROM songs_history sh
INNER JOIN songs_weekly sw
ON sh.user_id = sw.user_id
WHERE sh.listen_time >= DATEADD(day, -29, @enddate)
AND sh.listen_time < DATEADD(day, 1, @enddate);
