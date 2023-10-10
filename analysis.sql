-- CREATE DATABASE maven_airlinesDB;

-- USE maven_airlinesDB;




SELECT
	*
FROM
	dbo.airline_passenger_satisfaction;



-- What is the average age of passengers?
SELECT
	ROUND(AVG(Age),2) 'Average Age'
FROM
	dbo.airline_passenger_satisfaction;

-- How many customers are of each gender?

SELECT
	Gender
	,COUNT(*) 'Total Customers'
FROM
	dbo.airline_passenger_satisfaction
GROUP BY
	Gender;

-- What is the most common customer type (loyal or disloyal)?

SELECT DISTINCT
	[Customer Type] 'Type of Customers'
FROM
	dbo.airline_passenger_satisfaction;

SELECT 
	[Customer Type] 'Type of Customers'
	,COUNT(*) 'Total Customers'
FROM
	dbo.airline_passenger_satisfaction
GROUP BY
	[Customer Type];

-- What is the average flight distance for each class of travel?
SELECT 
	Class 'Travelling Class'
	,ROUND(AVG([Flight Distance]),2) 'Flight Distance'
FROM
	dbo.airline_passenger_satisfaction
GROUP BY
	Class;

-- What is the total satisfaction rating for each type of travel?
SELECT
	[Type of Travel] 'Travelling Type'
	,COUNT(
		CASE
			WHEN Satisfaction = 'Satisfied' THEN 1 ELSE NULL
		END) AS Satisfied
	,COUNT(
			CASE
			WHEN Satisfaction = 'Neutral or Dissatisfied' THEN 1 ELSE NULL
		END 
		) AS Dissatisfied
FROM
	dbo.airline_passenger_satisfaction
GROUP BY
	[Type of Travel];

-- Total Customers by Customer Type

SELECT 
	[Customer Type]
	,COUNT(*) 'Total Customers'
FROM
	dbo.airline_passenger_satisfaction
GROUP BY
	[Customer Type];

-- Customer Type by Gender

SELECT
	[Customer Type]
	,SUM(
		CASE 
			WHEN Gender = 'Male' THEN 1 ELSE NULL
		END) 'Male Customers'
	,SUM(
		CASE
			WHEN Gender = 'Female' THEN 1 ELSE NULL
		END) 'Female Customers'
FROM
	dbo.airline_passenger_satisfaction
GROUP BY
	[Customer Type];


-- For each gender, find the average age of passengers who rated food and drink satisfaction above 3 (on a scale of 1 to 5).
SELECT 
	Gender
	,ROUND(AVG(Age),2) 'Average Age'
FROM
	dbo.airline_passenger_satisfaction
WHERE
	[Food and Drink] > 3
GROUP BY
	Gender;
