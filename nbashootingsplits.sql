-- show made 3's, 2's, and ft's mader per game by player
	-- ThreeP = 3's made, TwoP = 2's made, and FT = free throws made

select player, ThreeP, TwoP, ft
	from nbashootingsplits

-- show players with most 3's made per game

select player, ThreeP, TwoP, ft
	from nbashootingsplits
		order by 2 desc
		
-- show players with most 2's made per game

select player, ThreeP, TwoP, ft
	from nbashootingsplits
		order by 3 desc
		
-- shows players with most ft's made per game

select player, ThreeP, TwoP, ft
	from nbashootingsplits
		order by 4 desc
		
-- shows players with most points per game

select player, pts
	from nbashootingsplits
		order by pts desc
	
-- shows what percent of 3's make up a players total points per game
	
select ThreeP, pts,  cast(ThreeP as float) / cast(pts as float) * 100 as TotalPointsPercentThree
	from nbashootingsplits
		order by TotalPointsPercentThree desc
		
select player, ThreeP, pts,  cast(ThreeP as float) / cast(pts as float) * 100 as TotalPointsPercentThree
	from nbashootingsplits
		order by TotalPointsPercentThree desc
		
-- shows players with highest percent of 3's made per total points per game with scoring over 10 points per game
		
select player, tm,  ThreeP, pts,  cast(ThreeP as float) / cast(pts as float) * 100 as TotalPointsPercentThree
	from nbashootingsplits
		where pts > '10.0'
		order by TotalPointsPercentThree desc
			
select player, mp, g, cast(mp as float) / cast (g as float) * 100 as ContributingPlayerPercent
	from nbashootingsplits
		where g > '42'
		order by ContributingPlayerPercent desc