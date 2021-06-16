--CREATE TABLE EmployeeDemographics
--(EmployeeID int,
--FirstName varchar(50),
--LastName varchar(50),
--Age int,
--Gender varchar(50)
--)

--CREATE TABLE WareHouseEmployeeDemographics
--(EmployeeID int,
--FirstName varchar(50),
--LastName varchar(50),
--Age int,
--Gender varchar(50)
--)

CREATE TABLE EmployeeSalary
(EmployeeID int,
JobTitle varchar(50),
Salary int)


--INSERT INTO EmployeeDemographics VALUES
----(1002, 'Pam', 'Beasley', 30, 'Female'),
----(1003, 'Dwight', 'Schrute', 29, 'Male'),
----(1004, 'Angela', 'Martin', 31, 'Female'),
----(1005, 'Toby', 'Flenderson', 32, 'Male'),
----(1006, 'Michael', 'Scott', 35, 'Male'),
----(1007, 'Meredith', 'Palmer', 32, 'Female'),
----(1008, 'Stanley', 'Hudson', 38, 'Male'),
----(1009, 'Kevin', 'Malone', 31, 'Male'),
--(1011, 'Ryan', 'Howard', 26, 'Male'),
--(NULL, 'Holly', 'Flax', Null, ''),
--(1013, 'Darryl', 'Philbin', NULL, 'Male'),
--(NULL, 'NULL', 'NULL', NULL, 'NULL'),
--(NULL, 'NULL', 'NULL', NULL, 'NULL'),
--(NULL, 'NULL', 'NULL', NULL, 'NULL')

--INSERT INTO EmployeeSalary VALUES
--(1001, 'Salesman', 45000),
--(1002, 'Receptionist', 36000),
--(1003, 'Salesman', 63000),
--(1004, 'Accountant', 47000),
--(1005, 'HR', 50000),
--(1006, 'Regional Manager', 65000),
--(1007, 'Supplier Relations', 41000),
--(1008, 'Salesman', 48000),
--(1009, 'Accountant', 42000)

--INSERT INTO WareHouseEmployeeDemographics VALUES
--(1013, 'Darryl', 'Philbin', NULL, 'Male'),
--(1015, 'Roy', 'Anderson', 31, 'Male'),
--(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
--(1052, 'Oba', 'Shola', 31, 'Female')

/*
Select Statement
*, Top, Distinct, Count, As, Max, Min, Avg
*/


--SELECT *
--FROM EmployeeSalary

/*
Where Statement
=, <>, <, >, And, Or Like, Null, Not Null, In
*/

--SELECT *
--FROM EmployeeDemographics
--WHERE FirstName IN ('Jim', 'Michael')

/*
Group By, Order By
*/

SELECT *
FROM EmployeeDEmographics
ORDER BY Age, Gender DESC

SELECT Gender, Age, COUNT(Gender)
FROM EmployeeDEmographics
GROUP BY Gender, Age

--SELECT Gender, COUNT(Gender) AS CountGender
--FROM EmployeeDemographics
--WHERE Age > 31
--GROUP BY Gender
--ORDER BY CountGender 


/*
Inner Joins, Full/Left/Right Outer Joins
*/

--Select *
--FROM [SQL Tutorial].dbo.EmployeeDemographics



--Select *
--FROM [SQL Tutorial].dbo.EmployeeSalary


--SElect *
--FROM [SQL Tutorial].dbo.EmployeeDemographics
--Inner Join [SQL Tutorial].dbo.EmployeeSalary
--	On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


--SElect *
--FROM [SQL Tutorial].dbo.EmployeeDemographics
--Full Outer Join [SQL Tutorial].dbo.EmployeeSalary
--	On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--SElect EmployeeSalary.EmployeeID, FirstName, LastName, Salary
--FROM [SQL Tutorial].dbo.EmployeeDemographics
--Full Outer Join [SQL Tutorial].dbo.EmployeeSalary
--	On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--WHERE FirstName <> 'Michael'
--ORDER BY Salary DESC


--SElect JobTitle, AVG(Salary)
--FROM [SQL Tutorial].dbo.EmployeeDemographics
--Inner Join [SQL Tutorial].dbo.EmployeeSalary
--	On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--WHERE JobTitle = 'Salesman'
--GROUP By JobTitle


--/* 
--Union Operator
--*/


--SElect *
--FROM [SQL Tutorial].dbo.EmployeeDemographics
--UNION
--SElect *
--FROM [SQL Tutorial].dbo.WareHouseEmployeeDemographics
--ORDER BY EmployeeID





--SElect EmployeeID, FirstName, Age
--FROM [SQL Tutorial].dbo.EmployeeDemographics
--UNION
--SElect EmployeeID, JobTitle, Salary
--FROM [SQL Tutorial].dbo.EmployeeSalary
--ORDER BY EmployeeID




--SElect *
--FROM [SQL Tutorial].dbo.EmployeeDemographics
--Full Outer Join [SQL Tutorial].dbo.WareHouseEmployeeDemographics
--	On EmployeeDemographics.EmployeeID = WareHouseEmployeeDemographics.EmployeeID

	/*
	Today's Topic: CAse Statement
	*/

--Select FirstName, LastName, Age,
--CASE
--	WHEN Age > 30 THEN 'Old'
--	WHEN Age BETWEEN 27 AND 30 THEN 'Young'
--	ELSE 'Baby'
--END
--FROM [SQL Tutorial].dbo.EmployeeDemographics
--WHERE Age is NOT NULL
--ORDER BY Age

SELECT FirstName, LastName, JobTitle, Salary,
CASE
	WHEN JobTitle = 'Saleman' THEN Salary + (Salary * .10)
	WHEN JobTitle = 'Accountant' THEN Salary + (Salary * .05)
	WHEN JobTitle = 'HR' THEN Salary + (Salary * .000001)
	ELSE Salary + (Salary * .03)
END AS SalaryAfterRaise
FROM [SQL Tutorial].dbo.EmployeeDemographics
JOIN [SQL Tutorial].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


	/*
	Today's Topic: Having Clause
	*/

SELECT JobTitle, COUNT(JobTitle)
FROM [SQL Tutorial].dbo.EmployeeDemographics
JOIN [SQL Tutorial].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROup BY JobTitle
HAVING COUNT(JobTitle) > 1


--SELECT JobTitle, AVG(Salary)
--FROM [SQL Tutorial].dbo.EmployeeDemographics
--JOIN [SQL Tutorial].dbo.EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--GROup BY JobTitle
--HAVING AVG(Salary) > 45000
--ORDER BY AVG(Salary)


/*
Today's Topic: Updating / Delecting Data
*/


SELECT *
FROM [SQL Tutorial].dbo.EmployeeDemographics

UPDATE [SQL Tutorial].dbo.EmployeeDemographics
SET FirstName = 'Bose', LastName = 'Bucky'
WHERE Age = 31


SELECT *
DELETE FROM [SQL Tutorial].dbo.EmployeeDEmographics
WHERE EmployeeID = NULL AND Age = NULL


/*
Today's Topic: Updating / Aliasing
*/

SELECT FirstName + ' ' + LAstName AS FullName
FROM [SQL Tutorial].dbo.EmployeeDemographics

SELECT Avg(Age) AS AvgAge
FROM [SQL Tutorial].dbo.EmployeeDemographics

SELECT Demo.EmployeeID, Sal.Salary
FROM [SQL Tutorial].dbo.EmployeeDemographics AS Demo
JOIN [SQL Tutorial].dbo.EmployeeSalary AS Sal
	ON Demo.EmployeeID = Sal.EmployeeID


SELECT a.EMployeeID, a.FirstName, a.FirstNAme, b.JobTitle, c.Age
FROM [SQL Tutorial].dbo.EmployeeDemographics a
LEFT JOIN [SQL Tutorial].dbo.EMployeeSalary b
	ON a.EmployeeID = b.EmployeeID
LEFT JOIN [SQL Tutorial].dbo.WareHouseEmployeeDemographics c
	ON a.EmployeeID = c.EmployeeID


/*
Today's Topic: PArtition By
*/


SELECT FirstName, LastName, Gender, Salary,
COUNT(Gender) OVER (PARTITION BY Gender) as TotalGender
FROM [SQL Tutorial].dbo.EmployeeDemographics dem
JOIN [SQL Tutorial].dbo.EmployeeSalary sal
	ON dem.EmployeeID = sal.EmployeeID



SELECT FirstName, LastName, Gender, Salary, COUNT(Gender)
FROM [SQL Tutorial].dbo.EmployeeDemographics dem
JOIN [SQL Tutorial].dbo.EmployeeSalary sal
	ON dem.EmployeeID = sal.EmployeeID
GROUP BY FirstName, LastName, Gender, Salary