--Prepare Phase--

USE "CYCLISTIC_BIKE_SHARE"
GO

--Combining data in cyclistic_data table--

INSERT INTO "cyclistic_data"
SELECT *
FROM "202302"

INSERT INTO "cyclistic_data"
SELECT *
FROM "202303"

INSERT INTO "cyclistic_data"
SELECT *
FROM "202304"

INSERT INTO "cyclistic_data"
SELECT *
FROM "202305"

INSERT INTO "cyclistic_data"
SELECT *
FROM "202306"

INSERT INTO "cyclistic_data"
SELECT *
FROM "202307"

INSERT INTO "cyclistic_data"
SELECT *
FROM "202308"

INSERT INTO "cyclistic_data"
SELECT *
FROM "202309"

INSERT INTO "cyclistic_data"
SELECT *
FROM "202310"

INSERT INTO "cyclistic_data"
SELECT *
FROM "202311"

INSERT INTO "cyclistic_data"
SELECT *
FROM "202312"

SELECT COUNT (*) 
FROM"cyclistic_data"