-- shows players, how many games they have played and for what teams

select player, tm, g
	from nbashootingsplits
	order by g desc -- mikal bridges is an outlier playing 83 games in this season
	
-- shows mikal bridges played 56 games for the Phoenix Suns and 27 games from the Brooklyn Nets	

select * from nbashootingsplits
	where player = 'Mikal Bridges'
	
-- shows percent of mikal bridges total points came from 3's with each team he played for this season
	
select player, tm, g, ThreeP * 3 as ThreePoints, pts, 
	cast(ThreeP as float) / cast(pts as float) * 300 as TotalPointsPerGameAsThrees
	from nbashootingsplits 
		where player = 'Mikal Bridges'
		and tm != 'TOT'
			order by TotalPointsPerGameAsThrees desc
			
-- same as query above except with 2's
			
select player, tm, g, TwoP * 2 as TwoPoints, pts,
	cast(TwoP as float) / cast(pts as float) * 200 as TotalPointsPerGameAsTwos
	from nbashootingsplits 
		where player = 'Mikal Bridges'
		and tm != 'TOT'
			order by TotalPointsPerGameAsTwos desc
			
-- same as query above exept with ft's
			
select player, tm, g, ft, pts, 
	cast(ft as float) / cast(pts as float) * 100 as TotalPointsPerGameAsFreeThrows
	from nbashootingsplits 
		where player = 'Mikal Bridges'
		and tm != 'TOT'
			order by TotalPointsPerGameAsFreeThrows desc

-- shows minutes played and each game played as a percent to indicate if they player was contributing			

select player, tm, mp, g,
	cast(mp as float) / cast(g as float) * 100 as ContributingPlayerPercent
	from nbashootingsplits
		order by ContributingPlayerPercent desc -- this query is poorly optimized to show players who actual contributed
		
-- shows more effectively players who contributed to their team the most during a majority of the season
		
select player, tm, mp, g, pts,
	cast(mp as float) / cast(g as float) * 100 as ContributingPlayerPercent
	from nbashootingsplits
	where pts > '10.0'
	and g > '42'
		order by ContributingPlayerPercent desc
		
-- shows role players who could be considered role players by how much the contribute during the season
		
select player, tm, mp, g, pts,
	cast(mp as float) / cast(g as float) * 100 as ContributingPlayerPercent
	from nbashootingsplits
		where pts > '10.0'
		and pts < '20.0'
		and g > '42'
			order by ContributingPlayerPercent desc
			
-- shows role players who contributed for a the majoriy of the season by percent of 3's made per total points per game
		
select player, pos, tm, mp, g, ThreePP * 3 as ThreePoints, pts,
	cast(ThreeP as float) / cast(pts as float) * 200 as TotalPointsPerGameAsThree,
	cast(mp as float) / cast(g as float) * 100 as ContributingPlayerPercent
	from nbashootingsplits
		where pts > '10.0'
		and pts <'20.0'
		and g > '42'
		and tm != 'TOT'
			order by TotalPointsPerGameAsThrees desc limit 0, 50
			
-- shows star players who contributed for the majority of the season by percent of 3's made per total points per game
			
select player, tm, mp, g, ThreeP * 3 as ThreePoints, pts,
	cast(ThreeP as float) / cast(pts as float) * 300 as TotalPointsPerGameAsThrees,
	cast(mp as float) / cast(g as float) * 100 as ContributingPlayerPercent
	from nbashootingsplits
		where pts > '20.0'
		and g > '42'
		and tm != 'TOT'
			order by TotalPointsPerGameAsThrees desc
			
-- shows role players who contributed for the majority of the season by percent of 2's made per total points per game
			
select player, pos, tm, mp, g, TwoP * 2 as TwoPoints, pts,
	cast(TwoP as float) / cast(pts as float) * 200 as TotalPointsPerGameAsTwos,
	cast(mp as float) / cast(g as float) * 100 as ContributingPlayerPercent
	from nbashootingsplits
		where pts > '10.0'
		and pts <'20.0'
		and g > '42'
		and tm != 'TOT'
			order by TotalPointsPerGameAsTwos desc limit 0, 50
			
-- shows star players who contributed for the majoruty of the season by percent of 2's made per total points per game

select player, pos, tm, mp, g, TwoP * 2 as TwoPoints, pts,
	cast(TwoP as float) / cast(pts as float) * 200 as TotalPointsPerGameAsTwos,
	cast(mp as float) / cast(g as float) * 100 as ContributingPlayerPercent
	from nbashootingsplits
		where pts > '20.0'
		and g > '42'
		and tm != 'TOT'
			order by TotalPointsPerGameAsTwos desc limit 0, 50
			
-- shows the best contributing point guards by highest field goal percent
			
select player, pos,  tm, mp, g, FGA, PTS,  FG_Percent * 100 as FGP,
	cast(mp as float) / cast(g as float) * 100 as ContributingPlayerPercent
	from nbashootingsplits
		where g > '42'
		and pos = 'PG'
			order by FG_Percent desc limit 0, 50
-- contrasted with FG_Percent and ContributingPlayerPercent			
select player, pos,  tm, mp, g, FGA, PTS,  FG_Percent * 100 as FGP,
	cast(mp as float) / cast(g as float) * 100 as ContributingPlayerPercent
	from nbashootingsplits
		where g > '42'
		and pos = 'PG'
			order by ContributingPlayerPercent desc limit 0, 50
			
-- shows the best contributing shooting guards by highest field goal percent
			
select player, pos,  tm, mp, g, FGA, PTS, FG_Percent * 100 as FGP,
	cast(mp as float) / cast(g as float) * 100 as ContributingPlayerPercent
	from nbashootingsplits
		where g > '42'
		and pos = 'SG'
			order by FG_Percent desc limit 0, 50
-- contrasted with FG_Percent and ContributingPlayerPercent			
select player, pos,  tm, mp, g,FGA, PTS,  FG_Percent * 100 as FGP,
	cast(mp as float) / cast(g as float) * 100 as ContributingPlayerPercent
	from nbashootingsplits
		where g > '42'
		and pos = 'SG'
			order by ContributingPlayerPercent desc limit 0, 50
			
-- shows the best contributing small fowards by highest field goal percent
			
select player, pos,  tm, mp, g, FG_Percent * 100 as FGP,
	cast(mp as float) / cast(g as float) * 100 as ContributingPlayerPercent
	from nbashootingsplits
		where g > '42'
		and pos = 'SF'
			order by FG_Percent desc limit 0, 50
-- contrasted with FG_Percent and ContributingPlayerPercent			
select player, pos,  tm, mp, g, FG_Percent * 100 as FGP,
	cast(mp as float) / cast(g as float) * 100 as ContributingPlayerPercent
	from nbashootingsplits
		where g > '42'
		and pos = 'SF'
			order by ContributingPlayerPercent desc limit 0, 50
			
-- shows the best contributing poward fowards by highest field goal percent
			
select player, pos,  tm, mp, g, FG_Percent * 100 as FGP,
	cast(mp as float) / cast(g as float) * 100 as ContributingPlayerPercent
	from nbashootingsplits
		where g > '42'
		and pos = 'PF'
			order by FG_Percent desc limit 0, 50
-- contrasted with FG_Percent and ContributingPlayerPercent	
select player, pos,  tm, mp, g, FG_Percent * 100 as FGP,
	cast(mp as float) / cast(g as float) * 100 as ContributingPlayerPercent
	from nbashootingsplits
		where g > '42'
		and pos = 'PF'
			order by ContributingPlayerPercent desc limit 0, 50
			
-- shows the best contributing centers by highest field goal percent
			
select player, pos,  tm, mp, g, FG_Percent * 100 as FGP,
	cast(mp as float) / cast(g as float) * 100 as ContributingPlayerPercent
	from nbashootingsplits
		where g > '42'
		and pos = 'C'
			order by FG_Percent desc limit 0, 50
-- contrasted with FG_Percent and ContributingPlayerPercent			
select player, pos,  tm, mp, g, FG_Percent * 100 as FGP,
	cast(mp as float) / cast(g as float) * 100 as ContributingPlayerPercent
	from nbashootingsplits
		where g > '42'
		and pos = 'C'
			order by ContributingPlayerPercent desc limit 0, 50
			
-- shows quality players by contributing to their team via 3 pointers made
			
select player, tm, mp,  g, pts, ThreeP_Percent * 100 as ThreePointPercent,
	cast(mp as float) / cast(g as float) * 100 as ContributingPlayerPercent
	from nbashootingsplits
		where g > 42
		and pts > 12
		and ContributingPlayerPercent > 50.0
			order by ThreePointPercent desc limit 0, 50
			
-- shows quality players by contributing to their team via 2 pointers made
			
select player, tm, mp,  g, pts, TwoP_Percent * 100 as TwoPointPercent,
	cast(mp as float) / cast(g as float) * 100 as ContributingPlayerPercent
	from nbashootingsplits
		where g > 42
		and pts > 12
		and ContributingPlayerPercent > 50.0
			order by TwoPointPercent desc limit 0, 50
			
-- shows players who accounted for the most points in each game played
			
select player, tm, ast * 2.5 as AssistedPoints, pts,
	cast(ast as float) * 2.5 + cast(pts as float) as PointsAccountedFor
	from nbashootingsplits
	where tm != 'TOT'
		order by PointsAccountedFor desc limit 0, 50

-- shows overall points accounted for included turnovers could lead to points for the oppising teams

select player, tm, mp, g,  ast * 2.5 as AssistedPoints, pts, tov * 2.5 as TurnoversAsPoints,
	cast(ast as float) * 2.5 + cast(pts as float) - (tov * 2.5) as PointsAccountedFor
	from nbashootingsplits
		where mp > 20
		and g > 42
		and tm != 'TOT'
			order by PointsAccountedFor desc limit 0, 50
			
-- shows players with the best assist to turnover ratio
			
select pos, player, tm, mp, g, ast, tov,
	cast(ast as float) / cast(tov as float) as AstTovRatio,
	cast(mp as float) / cast(g as float) * 100 as ContributingPlayerPercent
	from nbashootingsplits
		where g > '42'
		and mp > '20'
		and ast > '3'
		and tm != 'TOT'
			order by AstTovRatio desc limit 0, 50