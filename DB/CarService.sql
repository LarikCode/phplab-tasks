/* All about CarModels OwnerCars Positions Employees*/

USE CarService;

SELECT *
FROM CarModels;
SELECT *
FROM OwnerCars;
SELECT *
FROM Positions;
SELECT *
FROM Employees;

/* Enter the full name, salary of the employee. Check for duplicate data. */

SELECT DISTINCT EmplName, EmplMiddlename, EmplSurname, EmplSalary
FROM Employees;

/* Display information about employees (name, salary, employee ID), in which the allowance <1000 */

SELECT EmployeeId, EmplName, EmplMiddlename, EmplSurname, EmplSalary, EmplSurcharge
FROM Employees
WHERE EmplSurcharge < 1000;

/** Display information about owners (name, phone, owner ID, city),
 * in which the Phone starts at "050" and at the same time their City of Birth "Kiev"
 */

SELECT OwnerCarId, OwnerName, OwnerMiddlename, OwnerSurname, OwnerBirthplace, OwnerPhoneNum
FROM OwnerCars
WHERE OwnerPhoneNum LIKE '050%'
  AND OwnerBirthplace = 'Київ';

/** Display information about employees (name, salary, employee ID, city)
 * who receive an allowance = 300 and were born in "Kiev",
 * as well as employees from the city of "Cherkasy"
 */

SELECT EmployeeId, EmplName, EmplMiddlename, EmplSurname, EmplSalary, EmplSurcharge, EmplBirthplace
FROM Employees
WHERE (EmplSurcharge = 300 AND EmplBirthplace = 'Київ')
   OR EmplBirthplace = 'Черкаси';

/** Display information about employees (name, salary, employee ID, city)
 * who receive an allowance = 500 and were born in "Kiev" or in "Sumy"
 */

SELECT EmployeeId, EmplName, EmplMiddlename, EmplSurname, EmplSalary, EmplSurcharge, EmplBirthplace
FROM Employees
WHERE EmplSurcharge = 500
  AND (EmplBirthplace IN ('Київ', 'Суми'));

/** Print information about owners (name, date of birth, owner ID)
 * in which the date of birth falls in the period: 1989-01-01 and 1990-12-31
 */

SELECT OwnerCarId, OwnerName, OwnerMiddlename, OwnerSurname, OwnerBirthDay
FROM OwnerCars
WHERE OwnerBirthDay BETWEEN '1989-01-01' AND '1990-12-31';

/** Print the List of cars with the Id of the owner 1 or 4 or 3
 * with the Id of the brand 1 or 3 or 5
 */

SELECT OwnerCarId, CarModelId, CarStateNum, CarColor, CarYearOfProd, CarSpec
FROM Cars
WHERE OwnerCarId IN (1, 4, 3)
  AND (CarModelId IN (1, 3, 5));

/** Print full information about all Employees whose father's name starts with "Pet" */

SELECT *
FROM Employees
WHERE EmplMiddlename like 'Пет%';

/** Display complete information about all Employees born in 1966 */

SELECT *
FROM Employees
WHERE YEAR(EmplBirthDay) = 1966;

/** Print complete information about employees who have a parent
 * and their allowance is not equal to 800
 */

SELECT *
FROM Employees
WHERE EmplSurcharge != 800
  AND EmplMiddlename IS NOT NULL;

/** Print complete information about Owners who do not have a parent. */

SELECT *
FROM OwnerCars
WHERE OwnerMiddlename IS NULL;

/** Display a list of cars, sorted by Color and State №
 * from larger to smaller. Check for repetitions.
 */

SELECT DISTINCT *
FROM Cars
ORDER BY CarColor DESC, CarStateNum DESC;

/** Print the total number of cars */

SELECT COUNT(Cars.CarId)
FROM Cars;

/** Print the number of Owner Names. */

SELECT COUNT(OwnerCars.OwnerName)
FROM OwnerCars;

/** Print the number of Paternal Owners without repetitions */

SELECT COUNT(DISTINCT OwnerCars.OwnerMiddlename)
FROM OwnerCars;

/** Print the number of employees, minimum, maximum, average salaries. */

SELECT COUNT(Employees.EmployeeId) AS EmplNum,
       MIN(Employees.EmplSalary)   AS MinEmplSalary,
       MAX(Employees.EmplSalary)   AS MaxEmpSalary,
       AVG(Employees.EmplSalary)   AS AvgEmpSalary
FROM Employees;

/** Display information about all positions of Employees: the total number of employees in positions,
 * minimum, maximum, average payments by position, taking into account the date of payment of salaries.
 * (possible without letters D / E in SELECT / GROUP BY)
 */

SELECT D.PositionName,
       COUNT(E.EmployeeId)               AS EmplNum,
       MIN(E.EmplSalary + EmplSurcharge) AS MinEmplMoney,
       MAX(EmplSalary + EmplSurcharge)   AS MaxEmpMoney,
       AVG(EmplSalary + EmplSurcharge)   AS AvgEmpMoney,
       EmplPaymentDate
FROM Employees E
         JOIN Positions D ON E.PositionId = D.PositionId
GROUP BY D.PositionName, E.EmplPaymentDate;

/** Print the number of unique surnames of the Owners */

SELECT COUNT(DISTINCT OwnerSurname) AS DistinctSurname
FROM OwnerCars;

/** Print the number of found names of Owners on the letter M. */

SELECT COUNT(OwnerName) AS OwnerNameM
FROM OwnerCars
WHERE OwnerName LIKE 'М%';

/** Display the number of employees in each city.
 * Organize records by city. Output fields must be readable,
 * using aliases for column names.
 */

SELECT EmplBirthplace, COUNT(EmployeeId) AS Count_Employee
FROM Employees
GROUP BY EmplBirthplace
ORDER BY EmplBirthplace;

/** Display the results of the service by prices:
 * the number of cars that were repaired at a given price,
 * and the number of types of robots for which these prices
 * were obtained. Output fields - must be readable,
 * use aliases for column names.
 */

SELECT ServicePrice, COUNT(CarId) AS Count_Car, COUNT(TypeOfWorkId) AS Count_TypeOfWorkId
FROM Services
GROUP BY ServicePrice;

/** List the types of robots and the number of cars
 * that paid "5000" for these types of work.
 * Output fields - must be readable, use aliases for column names.
 */

SELECT TypeOfWorks.TitleOfWork, COUNT(Services.CarId) AS Count_Car
FROM Services,
     TypeOfWorks
WHERE ServicePrice = 5000
  AND TypeOfWorks.TypeOfWorkId = Services.TypeOfWorkId
GROUP BY TypeOfWorks.TitleOfWork;

/** Print the number of orders received per day.
 * Sort records by date.
 */

SELECT ServiceDateStart AS DateStart, COUNT(ServiceId) AS NumberServ
FROM Services
GROUP BY ServiceDateStart
ORDER BY ServiceDateStart;

/** How many service works were accepted per day,
 * and on which day more than 1 service works were accepted.
 * Sort records by date.
 */

SELECT ServiceDateStart AS StartDate, COUNT(ServiceId) AS ServNum
FROM Services
GROUP BY ServiceDateStart
HAVING COUNT(ServiceId) > 1
ORDER BY ServiceDateStart;

/** Print the average payment by city for employees
 * whose date of birth falls in the period:
 * 1945-01-01 and 1975-12-31
 */

SELECT EmplBirthplace, AVG(EmplSalary + EmplSurcharge) AS AvgMoney
FROM Employees
WHERE EmplBirthDay BETWEEN '1945-01-01' AND '1975-12-31'
ORDER BY EmplBirthplace;

/** Get information on the number of Parents without repetitions */

SELECT COUNT(*) AS Employee_Middlename_Total
FROM (SELECT DISTINCT EmplMiddlename FROM Employees) AS Employee_Middlename;

/** OR */

SELECT COUNT(DISTINCT EmplMiddlename) AS Employee_Middlename_Total
FROM Employees;

/** Get information about the number of owners who do not have a parent */

SELECT COUNT(EmplMiddlename) AS Employee_Middlename_Null
FROM Employees
WHERE EmplMiddlename IS NULL;

/** OR */

SELECT COUNT(*) AS Employee_Middlename_Null
FROM (SELECT EmplMiddlename FROM Employees WHERE EmplMiddlename IS NULL) AS Employee_Middlename;

/** To deduce the car at which the average price of service is more than 3000 */

SELECT CarId, AVG(ServicePrice) AS AvgServPrice
FROM Services
GROUP BY CarId
HAVING AVG(Services.ServicePrice) > 3000;

/** Print average payments for positions that are more than> 7100. */

SELECT PositionId, AVG(EmplSalary + EmplSurcharge) AS AvgMoney
FROM Employees
GROUP BY PositionId
HAVING AVG(EmplSalary + EmplSurcharge) > 7100;

/** Display all information by type of work "Wheel Replacement" - Sampling */

SELECT *
FROM TypeOfWorks
WHERE TitleOfWork = 'Заміна колеса';

/** Display all information by position: "Mechanic" - Sample */

SELECT *
FROM Positions
WHERE PositionName LIKE '%Механік%';

/** Display Employee Name - Projection (without duplicate tuples) */

SELECT DISTINCT EmplName,
                EmplMiddlename,
                EmplSurname
FROM Employees
ORDER BY EmplName,
         EmplMiddlename,
         EmplSurname;

/** Print the state №, the year of manufacture of the car
 * and the ID of the owner to whom it belongs. Arrange the result.
 * Projection (without duplicates)
 */

SELECT DISTINCT OwnerCarId, CarStateNum, CarYearOfProd
FROM Cars
ORDER BY OwnerCarId;

/** List the entire set of records that can be for the Employee
 * and Position tables by name. Cartesian product
 * (each row from the first table is connected to each row of the second table)
 */

SELECT Employees.EmplName,
       Positions.PositionName
FROM Employees
         CROSS JOIN Positions;

/** Print the entire set of records that can be for the Car and Owner tables by name.
 * Cartesian product
 * (each row from the first table is connected to each row of the second table)
 */

SELECT Cars.CarId,
       OwnerCars.OwnerName
FROM Cars
         CROSS JOIN OwnerCars;

/** Equality. Display Employee Name and Job Title:
 * Implicit connection syntax (old connection syntax style), no aliases
 */

SELECT CONCAT(Employees.EmplName, ' ', IFNULL(Employees.EmplMiddlename, ''), ' ', Employees.EmplSurname, ' - ',
              Positions.PositionName) AS EmplName_Pos1
FROM Employees,
     Positions
WHERE Employees.PositionId = Positions.PositionId;

/** Implicit syntax using aliases; */

SELECT CONCAT(e.EmplName, ' ', IFNULL(e.EmplMiddlename, ''), ' ', e.EmplSurname, ' - ', p.PositionName) AS EmplName_Pos2
FROM Employees e,
     Positions p
WHERE e.PositionId = p.PositionId;

/** Explicit connection syntax (SQL ANSI: 1992 connection syntax); */

SELECT CONCAT(Employees.EmplName, ' ', IFNULL(Employees.EmplMiddlename, ''), ' ', Employees.EmplSurname, ' - ',
              Positions.PositionName) AS EmplName_Pos3
FROM Employees
         JOIN Positions ON Employees.PositionId = Positions.PositionId
ORDER BY EmplName_Pos3;

/** Explicit syntax using aliases. */

SELECT CONCAT(e.EmplName, ' ', IFNULL(e.EmplMiddlename, ''), ' ', e.EmplSurname, ' - ', p.PositionName) as EmplName_Pos4
FROM Employees AS e
         JOIN Positions AS p ON e.PositionId = p.PositionId
ORDER BY EmplName_Pos4;

/** List all full names of owners who have white cars:
 * Implicit connection syntax (old connection syntax style)
 */

SELECT CONCAT(OwnerCars.OwnerName, ' ', IFNULL(OwnerCars.OwnerMiddlename, ''), ' ', OwnerCars.OwnerSurname,
              ' має авто кольору: ', Cars.CarColor) AS OwnerName_CarColor1
FROM OwnerCars,
     Cars
WHERE OwnerCars.OwnerCarId = Cars.OwnerCarId
  AND Cars.CarColor LIKE 'Білий';

/** Implicit syntax using aliases */

SELECT CONCAT(o.OwnerName, ' ', IFNULL(o.OwnerMiddlename, ''), ' ', o.OwnerSurname, ' має авто кольору: ',
              c.CarColor) AS OwnerName_CarColor2
FROM OwnerCars o,
     Cars c
where o.OwnerCarId = c.OwnerCarId
  and c.CarColor like 'Білий';

/** Explicit connection syntax (SQL ANSI: 1992 connection syntax) */

SELECT CONCAT(OwnerCars.OwnerName, ' ', IFNULL(OwnerCars.OwnerMiddlename, ''), ' ', OwnerCars.OwnerSurname,
              ' має авто кольору: ', Cars.CarColor) AS OwnerName_CarColor3
FROM OwnerCars
         JOIN Cars ON OwnerCars.OwnerCarId = Cars.OwnerCarId
    AND Cars.CarColor LIKE 'Білий';

/** Explicit syntax using aliases. */

SELECT CONCAT(o.OwnerName, ' ', IFNULL(o.OwnerMiddlename, ''), ' ', o.OwnerSurname, ' має авто кольору: ',
              c.CarColor) AS OwnerName_CarColor4
FROM OwnerCars AS o
         JOIN Cars AS c ON o.OwnerCarId = c.OwnerCarId
    AND c.CarColor LIKE 'Білий';

/** The JOIN command in the FROM clause Inner join retrieves only those rows for which
 * there is a match between the master table and the join table. Display name,
 * State № car, № driver's license, phone for owners who have a car color or "Red"
 * or "Blue". Sort by last name.
 */

SELECT CONCAT(o.OwnerName, ' ', IFNULL(o.OwnerMiddlename, ''), ' ', o.OwnerSurname) AS FIO,
       c.CarColor,
       c.CarStateNum,
       o.OwnerDriverlicNum,
       o.OwnerPhoneNum
FROM Cars c
         INNER JOIN OwnerCars o ON c.OwnerCarId = o.OwnerCarId
WHERE c.CarColor LIKE 'Синій'
   OR c.CarColor LIKE 'Красний'
ORDER BY FIO;

/** Print full name, job title, city of birth, date of birth for employees
  who receive an allowance in the range of 420-800 UAH. and who do not receive
  the allowance. Sort by last name and allowance.
 */

SELECT CONCAT(e.EmplName, ' ', IFNUll(e.EmplMiddlename, ''), ' ', e.EmplSurname) AS FIO,
       p.PositionName,
       e.EmplBirthplace,
       e.EmplBirthDay,
       e.EmplSalary,
       IFNUll(e.EmplSurcharge, 0)                                                AS EmplSurcharge
FROM Employees e
         INNER JOIN Positions p ON e.PositionId = p.PositionId
WHERE e.EmplSurcharge BETWEEN 420 AND 800
   OR e.EmplSurcharge IS NULL
ORDER BY FIO, EmplSurcharge;

/** Display the full name of the owners, State № car, Car brand,
  Type of work and price for work in the service. Sort by last name.
 */

SELECT CONCAT(o.OwnerName, ' ', IFNULL(o.OwnerMiddlename, ''), ' ', o.OwnerSurname) AS FIO,
       cm.CarModelName,
       c.CarStateNum,
       tw.TitleOfWork,
       s.ServicePrice
FROM OwnerCars o
         INNER JOIN Cars c ON o.OwnerCarId = c.OwnerCarId
         INNER JOIN Services s ON s.CarId = c.CarId
         INNER JOIN CarModels cm ON cm.CarModelId = c.CarModelId
         INNER JOIN TypeOfWorks tw ON tw.TypeOfWorkId = s.TypeOfWorkId
ORDER BY FIO;

/** Withdraw the name of the owners, State № car, date of acceptance into service
  with a price of more than 3400 in the period from 2019-01-01 to 2019-04-01
 */

SELECT CONCAT(o.OwnerName, ' ', IFNULL(o.OwnerMiddlename, ''), ' ', o.OwnerSurname) AS FIO,
       c.CarStateNum,
       s.ServiceDateStart,
       s.ServicePrice
FROM OwnerCars o
         INNER JOIN Cars c ON o.OwnerCarId = c.OwnerCarId
         INNER JOIN Services s ON s.CarId = c.CarId
WHERE s.ServicePrice > 3400
  AND s.ServiceDateStart BETWEEN '2019-01-01' AND '2019-04-01'
ORDER BY FIO;

/** Withdraw the name of the owners, State № cars, Brand of
  cars that are not manufactured in "Japan" and "Germany".
  Sort by last name
 */

SELECT CONCAT(o.OwnerName, ' ', IFNULL(o.OwnerMiddlename, ''), ' ', o.OwnerSurname) AS FIO,
       cm.CarModelName,
       c.CarStateNum,
       cm.CarCountryProd
FROM OwnerCars o
         INNER JOIN Cars c ON o.OwnerCarId = c.OwnerCarId
         INNER JOIN CarModels cm ON cm.CarModelId = c.CarModelId
WHERE cm.CarCountryProd NOT IN ('Японія', 'Німеччина')
ORDER BY FIO;

/** Print the name of the owners, make of the car, type of work and name,
  job title of the employees who conducted the service. Sort by brand
 */

SELECT DISTINCT CONCAT(o.OwnerName, ' ', IFNULL(o.OwnerMiddlename, ''), ' ', o.OwnerSurname) AS FIO_owner,
                cm.CarModelName,
                tw.TitleOfWork,
                p.PositionName,
                CONCAT(e.EmplName, ' ', IFNULL(e.EmplMiddlename, ''), ' ', e.EmplSurname)    AS FIO_employee
FROM OwnerCars o
         INNER JOIN Cars c ON o.OwnerCarId = c.OwnerCarId
         INNER JOIN Services s ON s.CarId = c.CarId
         INNER JOIN CarModels cm ON cm.CarModelId = c.CarModelId
         INNER JOIN TypeOfWorks tw ON tw.TypeOfWorkId = s.TypeOfWorkId
         INNER JOIN Employees e ON e.EmployeeId = s.EmployeeId
         INNER JOIN Positions p ON p.PositionId = e.PositionId
ORDER BY cm.CarModelName;

/** Print the number of cars of the brand (brand name) */

SELECT cm.CarModelName, COUNT(cm.CarModelId) AS 'NumOfCarSuchModel'
FROM Cars c
         INNER JOIN CarModels cm ON c.CarModelId = cm.CarModelId
GROUP BY cm.CarModelName;

/** List all car brands and, in addition, the color of the car of this brand,
  but the presence of a car of this brand is not a prerequisite
 */

SELECT CarModel.CarModelName, IFNULL(Car.CarColor, '') AS CarColor
FROM Cars Car
         LEFT JOIN CarModels CarModel ON CarModel.CarModelId = Car.CarModelId
ORDER BY CarModel.CarModelName;

/** List all positions and full names of employees who hold them (if any). */

SELECT p.PositionName,
       CONCAT(e.EmplName, ' ', IFNULL(e.EmplMiddlename, ''), ' ', e.EmplSurname, '') AS FIO
FROM Positions p
         LEFT JOIN Employees e ON e.PositionId = p.PositionId
ORDER BY p.PositionName, FIO;

/** Identify a list of employees who have serviced cars. Check for repetitions, sort alphabetically. */

SELECT CONCAT(e.EmplName, ' ', IFNULL(e.EmplMiddlename, ''), ' ', e.EmplSurname) AS FIO_employee,
       COUNT(s.ServiceId)                                                        AS NumOfService
FROM Employees e
         LEFT JOIN Services s ON s.EmployeeId = e.EmployeeId
WHERE s.ServiceId in (1, 2, 3, 4, 5, 6, 7, 8, 9)
GROUP BY FIO_employee
ORDER BY FIO_employee;

/** Identify a list of employees who have not serviced cars.
  Check for repetitions, sort alphabetically.
 */

SELECT CONCAT(e.EmplName, ' ', IFNULL(e.EmplMiddlename, ''), ' ', e.EmplSurname) AS FIO_employee,
       COUNT(s.ServiceId)                                                        AS NumOfService
FROM Employees e
         LEFT JOIN Services s ON s.EmployeeId = e.EmployeeId
GROUP BY FIO_employee, e.EmployeeId
HAVING COUNT(s.ServiceId) = 0
   AND e.EmployeeId IN (1, 2, 3, 4, 5, 6, 7)
ORDER BY FIO_employee;

/** Withdraw employees who did the service by type of work.
  "Wheel replacement" and "Windshield replacement".
 */

SELECT sub.TypeOfWorkId, sub.TitleOfWork, s.EmployeeId, e.EmplSurname
FROM (
         SELECT TypeOfWorkId, TitleOfWork
         FROM TypeOfWorks
         WHERE TitleOfWork LIKE 'Заміна колеса'
            OR TitleOfWork LIKE 'Заміна лобового скла'
     ) sub
         INNER JOIN Services s ON s.TypeOfWorkId = sub.TypeOfWorkId
         INNER JOIN Employees e ON s.EmployeeId = e.EmployeeId
ORDER BY sub.TypeOfWorkId, e.EmployeeId;

/** Additional operations UNION, EXCEPT, INTERSECT.
  UNION - unions of SELECT queries (each SELECT inside a UNION must have
  the same number of columns and types)
 */

/** Get ALL full name, place of birth, date of birth for car owners and employees. */

SELECT CONCAT(EmplName, ' ', IFNULL(EmplMiddlename, ''), ' ', EmplSurname) AS FIO,
       EmplBirthplace                                                      AS Birthplace,
       EmplBirthDay                                                        AS BirthDay
FROM Employees
UNION ALL
select CONCAT(OwnerName, ' ', IFNULL(OwnerMiddlename, ''), ' ', OwnerSurname) AS FIO,
       OwnerBirthplace                                                        AS Birthplace,
       OwnerBirthDay                                                          AS BirthDay
from OwnerCars;

/** Get full name, place of birth, date of birth for car owners
  and employees, excluding duplicates.
 */

SELECT CONCAT(EmplName, ' ', IFNULL(EmplMiddlename, ''), ' ', EmplSurname) AS FIO,
       EmplBirthplace                                                      AS Birthplace,
       EmplBirthDay                                                        AS BirthDay
FROM Employees
UNION
SELECT CONCAT(OwnerName, ' ', IFNULL(OwnerMiddlename, ''), ' ', OwnerSurname) AS FIO,
       OwnerBirthplace                                                        AS Birthplace,
       OwnerBirthDay                                                          AS BirthDay
FROM OwnerCars;

/** Get all the cities where Employees were born but Car Owners were not born. */

SELECT EmplBirthplace AS Birthplace
FROM Employees
    EXCEPT
SELECT OwnerBirthplace AS Birthplace
FROM OwnerCars;

/** Get all the different cities where both Car Owners and Employees were born. */

SELECT EmplBirthplace AS Birthplace
FROM Employees
    INTERSECT
SELECT OwnerBirthplace AS Birthplace
FROM OwnerCars;

/** Increase the minimum salary by 0.7 (Subquery for min salary) */

UPDATE Employees
SET EmplSalary = EmplSalary * 1.7
WHERE EmployeeId IN
      (
          SELECT EmployeeId
          FROM Employees
          WHERE EmplSalary = (SELECT MIN(EmplSalary) FROM Employees)
      );

/** Create a Model column in the Car Table. */

ALTER TABLE Cars
    ADD Model varchar(50) NULL;

/** Delete entries from the table "Service", in which CarId>= 13 and in which CarId <=14. */

DELETE
FROM Services
WHERE CarId in (13, 14);