/* Advanced
1) Find the top 3 most-viewed tracks for each artist using window functions.
2) Write a query to find tracks where the liveness score is above the average.
3) Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album.
4) Find tracks where the energy-to-liveness ratio is greater than 1.2.
5) Calculate the cumulative sum of likes for tracks ordered by the number of views, using window functions.
*/

-- 1) Find the top 3 most-viewed tracks for each artist using window functions.
-- Select * from spotify;
--each artist and total views for each track
--top 3
--ctes
with ranking_artist as
(
select artist,
		track,
		sum(views) as total_views,
		dense_rank() over(PARTITION BY artist ORDER BY sum(views) DESC) as rank
from spotify
group by 1,2
order by 1,3 Desc
)

Select * from ranking_artist
where rank<=3;

-- 2) Write a query to find tracks where the liveness score is above the average.

--select * from spotify;

--Select avg(liveness) from spotify; -- 0.19

SELECT track, artist, liveness
FROM spotify
where liveness > (Select avg(liveness) from spotify);

-- 3) Use a WITH clause to calculate the difference between 
--the highest and lowest energy values for tracks in each album.
--with
--difference betn highest & lowest energy values for tracks
-- with each album

-- select * from spotify;

WITH cal_energy as
(
SELECT
	track,
	album,
	MAX(energy) as highest_energy,
	MIN(energy) as lowest_energy
from spotify
GROUP BY  track, album
)
SELECT
	track,
	album,
	highest_energy - lowest_energy AS calculated_difference
FROM cal_energy
ORDER BY calculated_difference DESC;

-- 4) Find tracks where the energy-to-liveness ratio is greater than 1.2.

--SELECT * FROM spotify

select 
	track,
	energy/liveness as ratio_enli
from spotify
where energy/liveness > 1.2
order by 2;

-- 5) Calculate the cumulative sum of likes for tracks ordered 
-- by the number of views, using window functions.

-- SELECT * FROM spotify

SELECT
	track,
	views,
	likes,
	sum(likes) over (order by views DESC)as cumalative_sum_likes
FROM spotify
GROUP BY track, views, likes
Order by views DESC;