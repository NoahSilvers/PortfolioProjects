select * from coviddeaths
	where continent is not NULL
	order by location, date

-- Select data we are going to be using

select location, date, total_cases, new_cases, total_deaths, population
	from coviddeaths
where continent is not NULL
order by 1,2

-- Looking at Total Cases vs Total Deaths
-- Shows likelihood of dying if you contract covid in your country

select location, date, total_cases, total_deaths, cast(total_deaths as float) / cast
	(total_cases as float) * 100 as DeathPercentage
	from coviddeaths
where location like &#39;%states%&#39;
and continent is not null
order by 1,2 and date

-- Looking at the Total Cases vs Population
-- Shows what percentage of the population got covid with in your country

select location, date, total_cases, population, cast(total_cases as float) / cast
	(population as float) * 100 as PercentPopulationInfected
	from coviddeaths
where continent is not NULL
--where location like &#39;%states%&#39;
order by 1,2

-- Looking at countries with the highest infection rate compared to the population

select location, population, max(total_cases) as HighestInfectionCount, cast
	(max(total_cases) as float) / cast (population as float) * 100 as
	PercentPopulationInfected
	from coviddeaths
where continent is not NULL
--where location like &#39;%states%&#39;
group by location, population
order by PercentPopulationInfected desc

-- Showing countries with the highest death counts per population

select location, max(total_deaths) as TotalDeathCount
	from coviddeaths
	where continent is not NULL
	--where location like &#39;%states%&#39;
group by location
order by TotalDeathCount desc

-- Breaking down by continent
-- Showing continents with the highest death counts per population

select continent, max(total_deaths) as TotalDeathCount
from coviddeaths
	where continent is not null
	--where location like &#39;%states%&#39;
group by continent
order by TotalDeathCount desc

-- Global numbers

select date , sum(new_cases) as totalcases, sum(new_deaths) as totaldeaths,
	sum(cast(new_deaths as float)) / sum(cast(new_cases as float)) * 100 as
	DeathPercentage
	from coviddeaths
	-- where location is like &#39;%states%&#39;
	where continent is not NULL	
group by date
order by 1,2

-- Looking at total populaation vs vaccinations
-- Use CTE
with popvsvac (continent, location, date, population, new_vaccinations,
RollingPeopleVaccinated)
as
(
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
	, sum(cast(vac.new_vaccinations as int)) over (partition by dea.location order by
	dea.location, dea.date) as RollingPeopleVaccinated
	--, (RollingPeopleVaccinate/population) * 100
	from coviddeaths dea
	join covidvaccinations vac
		on dea.location = vac.location
		and dea.date = vac.date
	where dea.continent is not null
	--order by dea.continent asc, dea.location asc, dea.date asc
)
select * , cast(RollingPeopleVaccinated as float) / cast(population as float) * 100 as filler
from popvsvac

-- Temp table

drop table if exists percentpopulationvaccinated
create table percentpopulationvaccinated
	(
		continent nvarchar(255),
		location nvarchar(255),
		date datetime,
		population numeric,
		new_vaccinations numeric,
		rollingpeoplevaccinated numeric
	)
INSERT into percentpopulationvaccinated
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
	, sum(cast(vac.new_vaccinations as int)) over (partition by dea.location order by
	dea.location, dea.date) as RollingPeopleVaccinated
	--, (RollingPeopleVaccinate/population) * 100
	from coviddeaths dea
	join covidvaccinations vac
		on dea.location = vac.location
		and dea.date = vac.date
	--where dea.continent is not null
	--order by dea.continent asc, dea.location asc, dea.date asc
select * , cast(RollingPeopleVaccinated as float) / cast(population as float) * 100 as filler
from percentpopulationvaccinated

-- Creating view to store data for later visualizations

create view percentpopulationvaccinated 
as
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
	, sum(cast(vac.new_vaccinations as int)) over (partition by dea.location order by
	dea.location, dea.date) as RollingPeopleVaccinated
	--, (RollingPeopleVaccinate/population) * 100
	from coviddeaths dea
	join covidvaccinations vac
		on dea.location = vac.location
		and dea.date = vac.date
	where dea.continent is not null
	--order by dea.continent asc, dea.location asc, dea.date asc
	
select * from percentpopulationvaccinated
