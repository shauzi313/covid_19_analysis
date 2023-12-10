-- Shows likelihood of a person would be died in case of she has been infected?
SELECT location, SUM(dead), SUM(infected), (sum(dead)*100.0)/sum(infected) AS dead_infected_likelihood
FROM covid
GROUP BY location
ORDER BY dead_infected_likelihood desc;

-- Shows likelihood of a person would be died in case of she has been vaccinated?
SELECT location, SUM(dead), SUM(vaccinated), (sum(dead)*100.0)/sum(vaccinated) AS dead_vaccinated_likelihood
FROM covid
GROUP BY location
ORDER BY 4 desc;

-- Shows likelihood of a person would be infected in case of she has been vaccinated?
select location, sum(infected) as infed, sum(vaccinated) as vaccined, (sum(infected)*100.0)/sum(vaccinated) as inf_vacc_likelihood
from covid
group by 1
order by 4 desc

-- Which country does have the highest death rate compare to population?
select location, population, sum(dead), (sum(dead)*100.0)/population as death_rate
from covid
group by 1,2
order by 4 desc

--What is the total population for each continent?
select location, population
from covid
group by 1,2
order by 2 desc

--What is the average infection rate (infected per population) for each location?
select location, population, avg(infected), (avg(infected)*100.0)/population as avg_inf_rate
from covid
group by 1,2
order by 3 desc

--What percentage of the population is vaccinated in each location?
select location, population, sum(vaccinated), (sum(vaccinated)*100.0)/population as vaccinated_per
from covid
group by 1,2
order by 4 desc

--What is the average vaccination rate (vaccinated per population) for each continent?
select continent, location, population, avg(vaccinated), (avg(vaccinated)*100)/population as avg_pop_rate
from covid
group by 1,2,3
order by 4 desc

--Which locations have the highest infection rates?
select location, sum(infected) as infected
from covid
group by 1
order by 2 desc

--Calculate the cumulative sum of vaccinated individuals over time for a specific location.
SELECT
    location,
    date,
    SUM(vaccinated) OVER (PARTITION BY location ORDER BY date) AS cumulative_vaccinated
FROM
    covid
WHERE
    location = 'Australia'
ORDER BY
    date;



 



