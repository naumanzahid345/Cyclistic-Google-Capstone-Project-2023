--Analysis Phase--

use CYCLISTIC_BIKE_SHARE

--checking total number of member and casual riders--
SELECT 
COUNT (ride_id) AS "num_of_riders",
member_casual
FROM cyclistic_data
GROUP BY member_casual


--checking preffered rideable_type for member_casual--
SELECT 
COUNT (ride_id) AS "num_of_riders",
member_casual,
rideable_type
FROM cyclistic_data
GROUP BY 
member_casual,
rideable_type
ORDER BY
COUNT(ride_id) DESC;


--creating data of users per day--
SELECT 
COUNT(CASE WHEN member_casual = 'member' THEN 1 ELSE NULL END) AS num_of_members,
COUNT(CASE WHEN member_casual = 'casual' THEN 1 ELSE NULL END) AS num_of_casual,
COUNT(*) AS num_of_users,
day
FROM cyclistic_data
GROUP BY 
day


--Creating data for (AVG,MAX,MIN) ride_length--
SELECT (member_casual) AS "user_type",
AVG(ride_length) AS "avg_ride_length",
MAX(ride_length) AS "max_ride_length",
MIN(ride_length) AS "min_ride_length"
FROM cyclistic_data
GROUP BY member_casual


--creating seprate table for both casual and member users--
CREATE TABLE member_table (
ride_id nvarchar(50),
rideable_type nvarchar(50),
member_casual nvarchar(50),
ride_length int,
day nvarchar(50),
month nvarchar(50),
year int )

INSERT INTO member_table (ride_id, rideable_type, member_casual, ride_length, day, month, year)
Select ride_id, rideable_type, member_casual, ride_length, day, month, year
FROM cyclistic_data
WHERE member_casual = 'member'


CREATE TABLE casual_table (
ride_id nvarchar(50),
rideable_type nvarchar(50),
member_casual nvarchar(50),
ride_length int,
day nvarchar(50),
month nvarchar(50),
year int )

INSERT INTO member_table (ride_id, rideable_type, member_casual, ride_length, day, month, year)
Select ride_id, rideable_type, member_casual, ride_length, day, month, year
FROM cyclistic_data
WHERE member_casual = 'casual'


-- Calculating User Traffic Every Month--
SELECT month_num AS Month_Number,
month AS Month_Name, 
year AS Year_Y,
COUNT(CASE WHEN member_casual = 'member' THEN 1 ELSE NULL END) AS num_of_member,
COUNT(CASE WHEN member_casual = 'casual' THEN 1 ELSE NULL END) AS num_of_casual,
COUNT(member_casual) AS total_num_of_users
FROM cyclistic_data
Group BY year, month_num, month
ORDER BY year, month_num, month


--calculating daily user traffic--
ALTER TABLE cyclistic_data
ADD date_yyyy_mm_dd DATE

--Casting datetime format to date--
UPDATE cyclistic_data                          
SET date_yyyy_mm_dd = CAST(started_at AS date)

SELECT 
COUNT(CASE WHEN member_casual = 'member' THEN 1 ELSE NULL END) AS num_of_member,
COUNT(CASE WHEN member_casual = 'casual' THEN 1 ELSE NULL END) AS num_of_casual,
COUNT(*) AS num_of_users,
date_yyyy_mm_dd AS date_dd
FROM cyclistic_data
GROUP BY date_yyyy_mm_dd
ORDER BY date_yyyy_mm_dd


--calculating hourly user traffic--
ALTER TABLE cyclistic_data
ADD hour_of_day int

UPDATE cyclistic_data                          
SET hour_of_day = DATEPART(hour, started_at)

SELECT 
COUNT(CASE WHEN member_casual = 'member' THEN 1 ELSE NULL END) AS num_of_member,
COUNT(CASE WHEN member_casual = 'casual' THEN 1 ELSE NULL END) AS num_of_casual,
COUNT(*) AS num_of_users,
hour_of_day AS hr_of_day
FROM cyclistic_data
GROUP BY hour_of_day
ORDER BY hour_of_day


--executing the most popular stations among casual members--
SELECT 
TOP 10 start_station_name AS station_name,
COUNT(CASE WHEN member_casual = 'casual' THEN 1 ELSE NULL END) AS num_of_casual
FROM cyclistic_data
GROUP BY start_station_name
ORDER BY num_of_casual DESC



