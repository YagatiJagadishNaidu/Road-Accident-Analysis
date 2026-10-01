-- Road Accident Analysis Project
-- Tools: Excel, MySQL, Power BI
-- Database: road_accident_cp1
-- Table: road_accident_cleaned

CREATE DATABASE IF NOT EXISTS road_accident_cp1;
USE road_accident_cp1;

-- 1. BASIC DATA CHECKS
SELECT COUNT(*) AS total_records FROM road_accident_cleaned;

SELECT COUNT(*) AS missing_accident_index
FROM road_accident_cleaned
WHERE Accident_Index IS NULL;

SELECT COUNT(*) AS missing_accident_severity
FROM road_accident_cleaned
WHERE Accident_Severity IS NULL;

SELECT COUNT(*) AS missing_casualties
FROM road_accident_cleaned
WHERE Number_of_Casualties IS NULL;

SELECT COUNT(*) AS missing_vehicles
FROM road_accident_cleaned
WHERE Number_of_Vehicles IS NULL;


-- 2. ACCIDENT SEVERITY
SELECT Accident_Severity, COUNT(*) AS Total_Accidents
FROM road_accident_cleaned
GROUP BY Accident_Severity
ORDER BY Total_Accidents DESC;

SELECT Accident_Severity, COUNT(*) AS Total_Accidents,
       ROUND(COUNT(*) * 100.0 /
       (SELECT COUNT(*) FROM road_accident_cleaned), 2) AS Percentage
FROM road_accident_cleaned
GROUP BY Accident_Severity
ORDER BY Total_Accidents DESC;


-- 3. MONTHLY ACCIDENT TREND
SELECT Month, COUNT(*) AS Total_Accidents
FROM road_accident_cleaned
GROUP BY Month_Number, Month
ORDER BY Month_Number;


-- 4. CASUALTIES BY SEVERITY
SELECT Accident_Severity,
       SUM(Number_of_Casualties) AS Total_Casualties,
       ROUND(AVG(Number_of_Casualties), 2) AS Avg_Casualties_Per_Accident
FROM road_accident_cleaned
GROUP BY Accident_Severity
ORDER BY Total_Casualties DESC;


-- 5. ROAD TYPE
SELECT Road_Type, COUNT(*) AS Total_Accidents
FROM road_accident_cleaned
GROUP BY Road_Type
ORDER BY Total_Accidents DESC;


-- 6. WEATHER CONDITIONS
SELECT Weather_Conditions, COUNT(*) AS Total_Accidents
FROM road_accident_cleaned
GROUP BY Weather_Conditions
ORDER BY Total_Accidents DESC;


-- 7. VEHICLE TYPE
SELECT Vehicle_Type, COUNT(*) AS Total_Accidents
FROM road_accident_cleaned
GROUP BY Vehicle_Type
ORDER BY Total_Accidents DESC;


-- 8. URBAN / RURAL AREA
SELECT Urban_or_Rural_Area, COUNT(*) AS Total_Accidents
FROM road_accident_cleaned
GROUP BY Urban_or_Rural_Area
ORDER BY Total_Accidents DESC;


-- 9. DAY OF WEEK
SELECT Day_of_Week, COUNT(*) AS Total_Accidents
FROM road_accident_cleaned
GROUP BY Day_of_Week
ORDER BY Total_Accidents DESC;


-- 10. ROAD SURFACE CONDITIONS
SELECT Road_Surface_Conditions, COUNT(*) AS Total_Accidents
FROM road_accident_cleaned
GROUP BY Road_Surface_Conditions
ORDER BY Total_Accidents DESC;


-- 11. ROAD TYPE + CASUALTIES
SELECT Road_Type,
       COUNT(*) AS Total_Accidents,
       SUM(Number_of_Casualties) AS Total_Casualties,
       ROUND(AVG(Number_of_Casualties), 2) AS Avg_Casualties
FROM road_accident_cleaned
GROUP BY Road_Type
ORDER BY Total_Casualties DESC;


-- 12. POWER BI KPI QUERIES
SELECT COUNT(*) AS Total_Accidents
FROM road_accident_cleaned;

SELECT SUM(Number_of_Casualties) AS Total_Casualties
FROM road_accident_cleaned;

SELECT COUNT(*) AS Fatal_Accidents
FROM road_accident_cleaned
WHERE Accident_Severity = 'Fatal';

SELECT COUNT(*) AS Serious_Accidents
FROM road_accident_cleaned
WHERE Accident_Severity = 'Serious';

SELECT ROUND(AVG(Number_of_Casualties), 2) AS Avg_Casualties
FROM road_accident_cleaned;

-- END
