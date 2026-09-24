/*
Easy Level
1) Retrieve the names of all tracks that have more than 1 billion streams.
2) List all albums along with their respective artists.
3) Get the total number of comments for tracks where licensed = TRUE.
4) Find all tracks that belong to the album type single.
5) Count the total number of tracks by each artist.
*/

select * from spotify
limit 100;

-- !) Retrieve the names of all tracks that have more than 1 billion streams.

select track from spotify
where stream > 1000000000;

-- 2) List all albums along with their respective artists.

select distinct album, artist from spotify;

-- 3) Get the total number of comments for tracks where licensed = TRUE.

select sum(comments) as total_comments
from spotify
where licensed = 'true';

-- 4) Find all tracks that belong to the album type single.

Select * from spotify
 where album_type='single';

-- 5) Count the total number of tracks by each artist.

Select artist, Count(*) as total_no_of_songs
from spotify
group by artist
order by 2 Desc;
