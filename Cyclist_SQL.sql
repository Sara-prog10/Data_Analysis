USE cyclistic_DB
--Cyclistic Data Analysis
--Creating a new Table to Store the complete 2019 dataset

CREATE TABLE Trips_2019 (
    trip_id int NOT NULL,
    start_time datetime2(7) NOT NULL,
    end_time datetime2(7) NOT NULL,
    bikeid smallint NOT NULL,
    tripduration float NOT NULL,
    from_station_id smallint NOT NULL,
    from_station_name nvarchar(50) NOT NULL,
    to_station_id smallint NOT NULL,
    to_station_name nvarchar(50) NOT NULL,
    usertype nvarchar(50) NOT NULL,
    gender nvarchar(50) NULL,
    birthyear smallint NULL
);

INSERT INTO Trips_2019(trip_id, start_time, end_time, bikeid, tripduration, from_station_id, from_station_name, to_station_id, to_station_name, usertype, gender, birthyear)
SELECT trip_id, start_time, end_time, bikeid, tripduration, from_station_id, from_station_name, to_station_id, to_station_name, usertype, gender, birthyear
FROM Trips_2019_Q1
UNION ALL
SELECT trip_id, start_time, end_time, bikeid, tripduration, from_station_id, from_station_name, to_station_id, to_station_name, usertype, gender, birthyear
FROM Trips_2019_Q2
UNION ALL
SELECT trip_id, start_time, end_time, bikeid, tripduration, from_station_id, from_station_name, to_station_id, to_station_name, usertype, gender, birthyear
FROM Trips_2019_Q3
UNION ALL
SELECT trip_id, start_time, end_time, bikeid, tripduration, from_station_id, from_station_name, to_station_id, to_station_name, usertype, gender, birthyear
FROM Trips_2019_Q4;

SELECT *
FROM Trips_2019

--Data Cleaning

SELECT DISTINCT trip_id,from_station_id, from_station_name, to_station_id, to_station_name, usertype, gender
FROM Trips_2019

SELECT *
FROM Trips_2019
WHERE trip_id IN (
    SELECT trip_id
    FROM Trips_2019
    GROUP BY trip_id
    HAVING COUNT(trip_id) > 1
)

--calculating the length of each trip in minutes, 
--the month the trip took place
--the day of the week the trip took place (1 = Sunday, 7 = Saturday).

SELECT trip_id,
       usertype,
       start_time,
       end_time,
       ROUND(DATEDIFF(second, start_time, end_time) / 60.0, 1) AS trip_length_minutes,
       DATEPART(WEEKDAY, start_time) AS day_of_week,
       MONTH(start_time) AS month,
       from_station_name,
       from_station_id,
       to_station_name,
       to_station_id,
       usertype
FROM Trips_2019;

--Calculating Trip Length based on AVG, MIN, MAX, Subscriber, Client, Month, WeekDay

SELECT AVG(ROUND(DATEDIFF(second, start_time, end_time) / 60.0, 1) ) AS avg_trip_length_minutes,
            MIN(ROUND(DATEDIFF(second, start_time, end_time) / 60.0, 1)) AS min_trip_length_minutes,
            MAX(ROUND(DATEDIFF(second, start_time, end_time) / 60.0, 1)) AS max_trip_length_minutes
FROM Trips_2019

SELECT COUNT(*) as negative_trip_lengths
FROM Trips_2019
WHERE  ROUND(DATEDIFF(second, start_time, end_time) / 60.0, 1) < 0

SELECT COUNT(*) AS trips_longer_than_24h
FROM Trips_2019
WHERE ROUND(DATEDIFF(second, start_time, end_time) / 60.0, 1) > 1440

SELECT AVG(ROUND(DATEDIFF(second, start_time, end_time) / 60.0, 1) ) AS avg_trip_length_minutes,
            MIN(ROUND(DATEDIFF(second, start_time, end_time) / 60.0, 1)) AS min_trip_length_minutes,
            MAX(ROUND(DATEDIFF(second, start_time, end_time) / 60.0, 1)) AS max_trip_length_minutes
FROM Trips_2019
WHERE ROUND(DATEDIFF(second, start_time, end_time) / 60.0, 1) > 0
            AND ROUND(DATEDIFF(second, start_time, end_time) / 60.0, 1) < 1440

SELECT AVG(ROUND(DATEDIFF(second, start_time, end_time) / 60.0, 1)) AS Avg_Sub_Trip_len
FROM Trips_2019
WHERE ROUND(DATEDIFF(second, start_time, end_time) / 60.0, 1) > 0
            AND ROUND(DATEDIFF(second, start_time, end_time) / 60.0, 1) < 1440
            AND usertype = 'Subscriber'

SELECT AVG(ROUND(DATEDIFF(second, start_time, end_time) / 60.0, 1)) AS Avg_Cust_Trip_len
FROM Trips_2019
WHERE ROUND(DATEDIFF(second, start_time, end_time) / 60.0, 1) > 0
            AND ROUND(DATEDIFF(second, start_time, end_time) / 60.0, 1) < 1440
            AND usertype = 'Customer'

SELECT DATEPART(WEEKDAY, start_time),
            AVG(ROUND(DATEDIFF(second, start_time, end_time) / 60.0, 1)) AS member_avg_ride_length
FROM Trips_2019
WHERE usertype= 'Subscriber'
            AND ROUND(DATEDIFF(second, start_time, end_time) / 60.0, 1) > 0
            AND ROUND(DATEDIFF(second, start_time, end_time) / 60.0, 1) < 1440
GROUP BY DATEPART(WEEKDAY, start_time)
ORDER BY DATEPART(WEEKDAY, start_time)

SELECT DATEPART(WEEKDAY, start_time),
            AVG(ROUND(DATEDIFF(second, start_time, end_time) / 60.0, 1)) AS member_avg_ride_length
FROM Trips_2019
WHERE usertype= 'Customer'
            AND ROUND(DATEDIFF(second, start_time, end_time) / 60.0, 1) > 0
            AND ROUND(DATEDIFF(second, start_time, end_time) / 60.0, 1) < 1440
GROUP BY DATEPART(WEEKDAY, start_time)
ORDER BY DATEPART(WEEKDAY, start_time)

SELECT 
    DATEPART(MONTH, start_time) AS month,
    AVG(ROUND(DATEDIFF(second, start_time, end_time) / 60.0, 1)) AS average_ride_length_minutes
FROM 
    Trips_2019
WHERE 
    usertype = 'Subscriber'
    AND ROUND(DATEDIFF(second, start_time, end_time) / 60.0, 1) > 0
    AND ROUND(DATEDIFF(second, start_time, end_time) / 60.0, 1) < 1440
GROUP BY 
    DATEPART(MONTH, start_time)
ORDER BY 
    DATEPART(MONTH, start_time)

SELECT 
    DATEPART(MONTH, start_time) AS month,
    AVG(ROUND(DATEDIFF(second, start_time, end_time) / 60.0, 1)) AS average_ride_length_minutes
FROM 
    Trips_2019
WHERE 
    usertype = 'Customer'
    AND ROUND(DATEDIFF(second, start_time, end_time) / 60.0, 1) > 0
    AND ROUND(DATEDIFF(second, start_time, end_time) / 60.0, 1) < 1440
GROUP BY 
    DATEPART(MONTH, start_time)
ORDER BY 
    DATEPART(MONTH, start_time);

SELECT 
    usertype,
    COUNT(*) AS ride_count
FROM 
    Trips_2019
GROUP BY 
    usertype;

SELECT 
    usertype,
    DATEPART(WEEKDAY, start_time) AS day_of_week,
    COUNT(*) AS ride_count
FROM 
    Trips_2019
GROUP BY 
    usertype,
    DATEPART(WEEKDAY, start_time)
ORDER BY 
    usertype,
    DATEPART(WEEKDAY, start_time);

SELECT 
    usertype,
    DATEPART(MONTH, start_time) AS day_of_week,
    COUNT(*) AS ride_count
FROM 
    Trips_2019
GROUP BY 
    usertype,
    DATEPART(MONTH, start_time)
ORDER BY 
    usertype,
    DATEPART(MONTH, start_time);

SELECT 
    usertype,
    DATEPART(HOUR, start_time) AS hour_of_day,
    DATEPART(DAY, start_time) AS day_of_month,
    COUNT(*) AS ride_count
FROM 
    Trips_2019
GROUP BY 
    usertype,
    DATEPART(HOUR, start_time),
    DATEPART(DAY, start_time)
ORDER BY 
    usertype,
    DATEPART(DAY, start_time),
    DATEPART(HOUR, start_time);

--Popular Locations

SELECT 
    usertype,
    from_station_name,
    COUNT(*) AS ride_count
FROM 
    Trips_2019
GROUP BY 
    usertype,
    from_station_name
ORDER BY 
    usertype,
	ride_count DESC;

SELECT 
    usertype,
    to_station_name,
    COUNT(*) AS ride_count
FROM 
    Trips_2019
GROUP BY 
    usertype,
    to_station_name
ORDER BY 
    usertype,
	ride_count DESC;



