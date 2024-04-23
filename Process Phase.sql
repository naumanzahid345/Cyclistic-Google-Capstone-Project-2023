--Process Phase--

USE CYCLISTIC_BIKE_SHARE

--Removed any duplicate ride_id by using DISTANT--
SELECT Count(DISTINCT(ride_id)) AS uniq,
Count(ride_id) AS total
FROM cyclistic_data

--Deleted rows containing NULL values--
DELETE FROM cyclistic_data
WHERE ride_id IS NULL OR
start_station_name IS NULL OR
end_station_name IS NULL OR
start_station_id IS NULL OR
end_station_id IS NULL OR
member_casual IS NULL

--Added a ride_length column and executed ride_length in minutes--
ALTER TABLE cyclistic_data
ADD ride_length int

UPDATE cyclistic_data
SET ride_length = DATEDIFF(Minute, started_at, ended_at)

--Deleted rows containing (ride_length = 0), (ride_length < 0) and ride_length greater than 24 hours--
DELETE FROM cyclistic_data
WHERE ride_length = 0 OR
ride_length < 0 OR
ride_length > 1440


--Added (day,month,year) columns and extracted data using DATENAME function on column started_at--
ALTER TABLE cyclistic_data
ADD day nvarchar(50),
month nvarchar(50),
year nvarchar(50)

UPDATE cyclistic_data
SET day = DATENAME (WEEKDAY, started_at),
month = DATENAME (MONTH, started_at),
year = DATENAME (YEAR, started_at)

--Added a column for month number--
ALTER TABLE cyclistic_data
ADD month_num int

UPDATE cyclistic_data
SET month_num = DATEPART(MONTH, started_at)


