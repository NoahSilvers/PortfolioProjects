-- shows top 50 songs of 2019

select song, artist, popularity, year
	from topsongs19_22
		where year like '2019%'
			order by popularity desc limit 50
			
-- shows the artists with highest danceability between 2019-2022
		
select artist, round(avg(danceability), 3) as avg_danceability
	from topsongs19_22
		group by artist
			order by avg_danceability desc limit 50
			
-- shows the artists with the highest average popularity between 2019-2022
			
select artist, round(avg(popularity), 3) as avg_popularity
	from topsongs19_22
		group by artist
			order by avg_popularity desc limit 50
			
-- shows the artists with the highest average popularity and average danceability
			
select artist, round(avg(popularity), 3) as avg_popularity, round(avg(danceability), 3) as avg_danceability
	from topsongs19_22
		group by artist
			order by avg_popularity desc limit 50
			
-- shows top 100 songs from 2021-2022
			
select artist, song, popularity, year
	from topsongs19_22
		where (year like '2020%'
						or year like '2021%')
				order by popularity desc limit 100
				
-- shows the most popular keys of song and their danceability
				
select key, round(avg(popularity), 3) as avg_popularity, round(avg(danceability), 3) as avg_danceability
	from topsongs19_22
		group by key
			order by avg_popularity desc
			
-- shows the most danceable keys and their popularity
			
select key, round(avg(popularity), 3) as avg_popularity, round(avg(danceability), 3) as avg_danceability
	from topsongs19_22
		group by key
			order by avg_danceability desc
			
-- shows the longest songs
			
select song, artist, time
	from topsongs19_22
		order by time desc
		
-- shows artists with the longest songs on average

select artist, round(avg(time), 3) as avg_time
	from topsongs19_22
		group by artist
			order by avg_time desc
			
-- shows the shortest songs
				
select song, artist, time
	from topsongs19_22
		order by time asc
		
-- shows artists with the shortest songs on average
		
select artist, round(avg(time), 3) as avg_time
	from topsongs19_22
		group by artist
			order by avg_time asc
			
-- shows the artists who have showed up with the most popular songs between 19-22			
			
select artist, count(artist) as popular_artist
	from topsongs19_22
		group by artist
			order by popular_artist desc
			
-- most popular songs from each year, average of 50 per year

select song, artist, popularity, year, SpotifyTrackId
	from topsongs19_22
			order by popularity desc limit 200
			
-- top 50 from 2019
			
select song, artist, popularity, year
	from topsongs19_22
		where year like '2019%'
			order by popularity desc limit 50
			
-- top 50 from 2020
			
select song, artist, popularity,  year
	from topsongs19_22
		where year like '2020%'
			order by popularity desc limit 50
			
-- top 50 from 2021
			
select song, artist, popularity, year
	from topsongs19_22
		where year like '2021%'
			order by popularity desc limit 50
			
-- top 50 from 2022
			
select song, artist, popularity, year
	from topsongs19_22
		where year like '2022%'
			order by popularity desc limit 50
			
-- shows artists who show up the most from 19-22
			
select artist, count(artist) as pop_artist, year, SpotifyTrackId
	from topsongs19_22
		group by artist
			order by pop_artist desc limit 50
			
-- shows the most popular genres from 19-22
			
select genres, count(genres) as pop_genre, year
	from topsongs19_22
		where (year like '2019%'
				  or year like '2020%'
				  or year like '2021%'
				  or year like '2022%')
		group by year
			order by pop_genre desc limit 50
			
select artist, sum(popularity) as popularity, year
	from topsongs19_22
		where (year like '2019%'
				  or year like '2020%'
				  or year like '2021%'
				  or year like '2022%')
		group by artist, year
			order by popularity desc limit 50

	
			

		
			

		
			

