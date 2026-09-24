/* Medium Level
1) Calculate the average danceability of tracks in each album.
2) Find the top 5 tracks with the highest energy values.
3) List all tracks along with their views and likes where official_video = TRUE.
4) For each album, calculate the total views of all associated tracks.
5) Retrieve the track names that have been streamed on Spotify more than YouTube.
*/

-- 1) Calculate the average danceability of tracks in each album.

Select album, AVG(danceability) as average_danceability
from spotify
group by album
order by  average_danceability desc;
;

-- 2) Find the top 5 tracks with the highest energy values.

Select track, MAX(energy)
from spotify
group by track
order by MAX(energy) DESC
LIMIT 5;

-- 3) List all tracks along with their views and likes where official_video = TRUE.

Select track,
	   sum(views) as total_views,
	   sum(likes) as total_likes
from spotify
where official_video='true'
group by track
order by total_views DESC;

-- 4) For each album, calculate the total views of all associated tracks.

select album,
		track,
		sum(views) as total_views
from spotify
group by album, track
order by total_views desc
limit 5;

-- 5) Retrieve the track names that have been streamed on Spotify more than YouTube.
-- select * from spotify

select * FROM
(
select track,
		COALESCE(SUM(case when most_played_on='Youtube'THEN stream END)) as streamed_on_youtube,
		COALESCE(SUM(case when most_played_on='Spotify'THEN stream END)) as streamed_on_spotify
from spotify
group by track
) as spotify_stream_type
where streamed_on_youtube < streamed_on_spotify 
AND	streamed_on_youtube <> 0
order by streamed_on_spotify DESC;

