SELECT COUNT(*) AS 'Total' FROM USFlightsSchema.flights;

SELECT Origin, AVG (ArrDelay) AS ‘prom_arribades’, AVG (DepDelay) AS ‘prom_sortides’ 
FROM USFlightsSchema.flights 
GROUP BY Origin 
ORDER BY Origin;

SELECT Origin, colYear, colMonth, AVG (ArrDelay) AS prom_arribades 
FROM USFlightsSchema.flights 
GROUP BY Origin, colYear, colMonth 
ORDER BY Origin, colYear, colMonth;

SELECT airports.city, colYear, colMonth, AVG (ArrDelay) AS prom_arribades
FROM USFlightsSchema.flights
INNER JOIN airports
ON flights.Origin = airports.iata
GROUP BY airports.city, colYear, colMonth
ORDER BY airports.city, colYear, colMonth;

SELECT UniqueCarrier, colYear, colMonth,
COUNT(Cancelled) AS total_cancelled
FROM USFlightsSchema.flights
GROUP BY UniqueCarrier, colYear, colMonth
ORDER BY COUNT(Cancelled) DESC, UniqueCarrier;

SELECT TailNum, SUM(Distance) AS totalDistance
FROM USFlightsSchema.flights
GROUP BY TailNum, Distance
ORDER BY SUM(Distance) DESC;

SELECT UniqueCarrier, AVG (ArrDelay) AS avgDelay
FROM USFlightsSchema.flights 
GROUP BY UniqueCarrier
HAVING AVG(ArrDelay) > 10
ORDER BY AVG(ArrDelay) DESC;
