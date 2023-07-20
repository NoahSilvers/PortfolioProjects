-- shows weekly sales for each store and each week in 2010
	-- we will repeat this for ever year

select store, date, Weekly_Sales
	from Walmart
		where date like '%2010'
			order by Weekly_Sales asc
			
select store, date, Weekly_Sales
	from Walmart
		where date like '%2011'
			order by Weekly_Sales asc
			
select store, date, Weekly_Sales
	from Walmart
		where date like '%2012'
			order by Weekly_Sales asc
			
-- shows the holidays that produce the highest weekly sales
	-- we see the weeks surronding thanksgiving garner the highest sales
		
select store, date, Weekly_Sales, Holiday_Flag
	from Walmart
		where Holiday_Flag = '1'
			order by Weekly_Sales desc
			
-- shows the total sales for thanksgiving  per year (2012 isn't accounted for in the data set)
			
select strftime('%Y' , date) as SalesYear, strftime('%m' , date) as Thanksgiving, SUM(Weekly_Sales) AS TotalSales
    from Walmart
		where Thanksgiving = '11'
			group by SalesYear, Thanksgiving
			
-- shows the total sales for christmas per year (2012 isn't accounted for in the data set)
			
select strftime('%Y' , date) as SalesYear, strftime('%m' , date) as Christmas, SUM(Weekly_Sales) AS TotalSales
    from Walmart
		where Christmas = '12'
			group by SalesYear, Christmas
			
-- shows total sales per year and sum of total sales

	select strftime('%Y', date) as SalesYear, sum(Weekly_Sales) as TotalSales
		from Walmart
			where SalesYear like '%10'
union	
	select strftime('%Y', date) as SalesYear, sum(Weekly_Sales) as TotalSales
		from Walmart
			where SalesYear like '%11'
union
	select strftime('%Y', date) as SalesYear, sum(Weekly_Sales) as TotalSales
		from Walmart
			where SalesYear like '%12'
union
	select strftime('Total' , date) as SalesYear, sum(weekly_sales) as TotalSales
		from Walmart
order by SalesYear asc
		
-- shows weekly moving average

select store, date, Weekly_Sales, 
round(avg(weekly_sales) over (partition by store order by cast(strftime('%Y', date) as float) rows between 1 PRECEDING and CURRENT row), 3) as WMA
from Walmart
		order by store, date
		
-- shows monthly moving average

select store, date, Weekly_Sales, 
round(avg(weekly_sales) over (partition by store order by cast(strftime('%Y', date) as float) rows between 3 PRECEDING and CURRENT row), 3) as MMA
from Walmart
		order by store, date
		
-- create a view to quickly pull up the average temperature of each store

create view AvgStoreTemp As			
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '1'
UNION
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '2'
UNION
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '3'
UNION
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '4'
UNION
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '5'
UNION
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '6'
UNION
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '7'
UNION
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '8'
UNION
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '9'
UNION
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '10'
UNION
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '11'
UNION
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '12'
UNION
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '13'
UNION
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '14'
UNION
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '15'
UNION
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '16'
UNION
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '17'
UNION
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '18'
UNION
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '19'
UNION
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '20'
UNION
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '21'
UNION
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '22'
UNION
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '23'
UNION
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '24'
UNION
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '25'
UNION
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '26'
UNION
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '27'
UNION
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '28'
UNION
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '29'
UNION
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '30'
UNION
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '31'
UNION
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '32'
UNION
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '33'
UNION
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '34'
UNION
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '35'
UNION
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '36'
UNION
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '37'
UNION
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '38'
UNION
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '39'
UNION
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '40'
UNION
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '41'
UNION
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '42'
UNION
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '43'
UNION
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '44'
UNION
select store, round(avg(temperature), 0) as avgtemp
	from Walmart
		where store = '45'
		
-- taking stores 1-15 and labeling them as AStores
		
create view AStores as
select store, date, Weekly_Sales
	from Walmart
		where
		(store = '1'
		 or store = '2'
		 or store = '3'
		 or store = '4'
		 or store = '5'
		 or store = '6'
		 or store = '7'
		 or store = '8'
		 or store = '9'
		 or store = '10'
		 or store = '11'
		 or store = '12'
		 or store = '13'
		 or store = '14'
		 or store = '15')
		 
-- taking stores 16-30 and labeling them as BStores
		 
create view BStores as
select store, date, Weekly_Sales
	from Walmart
		where
		(store = '16'
		 or store = '17'
		 or store = '18'
		 or store = '19'
		 or store = '20'
		 or store = '21'
		 or store = '22'
		 or store = '23'
		 or store = '24'
		 or store = '25'
		 or store = '26'
		 or store = '27'
		 or store = '28'
		 or store = '29'
		 or store = '30')
		
-- taking stores 31-45 and labeling them CStores
		 
create view CStores as
select store, date, Weekly_Sales
	from Walmart
		where
		(store = '31'
		 or store = '32'
		 or store = '33'
		 or store = '34'
		 or store = '35'
		 or store = '36'
		 or store = '37'
		 or store = '38'
		 or store = '39'
		 or store = '40'
		 or store = '41'
		 or store = '42'
		 or store = '43'
		 or store = '44'
		 or store = '45')
	
		 
		 


	
	


			
