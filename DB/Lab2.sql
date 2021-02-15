--2-1 Вивести ВСЮ інформацію про:
--•	Марки;
--•	Власників;
--•	Посади.


use SQLDB;

select * from CarModel;
select * from OwnerCar;
select * from Position;



--2-2  Ввивести ПІБ, оклад співробітника
--Перевірити, щоб не було повторів даних


SELECT DISTINCT EmplName, EmplMiddlename, EmplSurname, EmplSalary FROM Employee;


--2-3  Вивести інформацію про співробітників (ПІБ, Оклад, Ідентифікатор співробітника), у яких Надбавка <100

SELECT EmployeeId, EmplName, EmplMiddlename, EmplSurname, EmplSalary, EmplSurcharge  
FROM Employee
WHERE EmplSurcharge < 100;

--2-4  Вивести інформацію про власників (ПІБ, Телефон, Ідентифікатор власника, Місто),
-- у яких Телефон починається на «050» і при цьому їх Місто Народження не «Киев»


SELECT OwnerCarId,OwnerName, OwnerMiddlename, OwnerSurname, OwnerBirthplace, OwnerPhoneNum  
FROM OwnerCar
WHERE OwnerPhoneNum LIKE '050%' AND OwnerBirthplace != 'Київ';


--2-5  Вивести інформацію про співробітників (ПІБ, Оклад, Ідентифікатор співробітника, Місто), які отримують надбавку =300 і 
--народились в «Киев», а також співробітників із міста  «Черкассы»


SELECT EmployeeId, EmplName, EmplMiddlename, EmplSurname, EmplSalary, EmplSurcharge,EmplBirthplace  
FROM Employee
WHERE (EmplSurcharge = 300 AND EmplBirthplace = 'Київ') OR EmplBirthplace = 'Черкаси';


--2-6  Вивести інформацію про співробітників (ПІБ, Оклад, Ідентифікатор співробітника, Місто), 
--які отримують надбавку =500 та народились в «Киев» або в «Суммы»

SELECT EmployeeId, EmplName, EmplMiddlename, EmplSurname, EmplSalary, EmplSurcharge,EmplBirthplace  
FROM Employee
WHERE EmplSurcharge = 500 AND (EmplBirthplace IN ('Київ', 'Суми'));

--2-7 Вивести інформацію про власників (ПІБ, Дата народження, Ідентифікатор власника), 
--у яких дата народження попадає в період: 1989-01-01 и 1990-12-31

SELECT OwnerCarId,OwnerName, OwnerMiddlename, OwnerSurname, OwnerBirthDay  
FROM OwnerCar
WHERE OwnerBirthDay BETWEEN '1989-01-01' AND '1990-12-31';

--2-8 Вивести Відомість по автомобілях з Id власника 1 або 4 або 3 з Id марки 1 або 3 або 5

SELECT OwnerCarId,CarModelId, CarStateNum, CarColor, CarYearOfProd,CarSpec  
FROM Car
WHERE OwnerCarId  IN(1, 4, 3) AND (CarModelId IN (1, 3, 5));


--2-9  Вивести повну інформацію про всіх Співробітників, прізвище яких починається на «Пет»

SELECT * 
FROM Employee
WHERE EmplSurname like 'Пет%'

--2-10 Вивести повну інформацію про всіх Співробітників 1966 року народження

SELECT *  
FROM Employee
WHERE  DATEPART(YEAR, EmplBirthDay) = 1966; 

--2-11 Вивести повну інформацію про Співробітників, яки мають  по-батькові та їх надбавка не дорівнює 800

SELECT *  
FROM Employee
WHERE EmplSurcharge != 800 AND EmplMiddlename IS NOT NULL;

--2-12  Вивести повну інформацію про Власників, які не мають по-батькові.

SELECT *  
FROM OwnerCar
WHERE  OwnerMiddlename IS NULL;


--2-13 Вивести список автомобілів, впорядкований по Кольору та Державному № від більшого значення до меншого.
 --Перевірити на повтори.

SELECT DISTINCT * 
FROM Car
ORDER BY CarColor DESC, CarStateNum DESC 

--2-14 Вивести загальну кількість автомобілів

Select COUNT(Car.CarId)from  Car;

--2-15 Вивести кількість Імен Власників.

Select COUNT (OwnerCar.OwnerName) from  OwnerCar;

--2-16 Вивести кількість По-батькові Власників

Select COUNT (OwnerCar.OwnerMiddlename) from  OwnerCar;

--2-17 Вивести кількість співробітників, мінімальний, максимальний, середній оклади.

Select COUNT(Employee.EmployeeId) as EmplNum,MIN(Employee.EmplSalary) as MinEmplSalary,MAX(Employee.EmplSalary) as MaxEmpSalary,
 AVG(Employee.EmplSalary) as AvgEmpSalary From Employee;

 --2-18 Вивести інформацію про всі посади Співробітників: загальну кількість співробітників на посадах,
-- мінімальні, максимальні, середні виплати по посадам з урахуванням дати виплати окладів.


Select D.PositionName, COUNT(E.EmployeeId) as EmplNum,
 MIN(E.EmplSalary+EmplSurcharge) as MinEmplMoney,
 MAX(EmplSalary+EmplSurcharge) as MaxEmpMoney,
 AVG(EmplSalary+EmplSurcharge) as AvgEmpMoney,
 EmplPaymentDate
 FROM Employee E JOIN Position D ON E.PositionId = D.PositionId
 Group By D.PositionName, E.EmplPaymentDate

 --можно без букв D/E в Select/Group By

 --2-19 Вивести кількість неповторюючихся прізвищ Власників

SELECT COUNT(DISTINCT OwnerSurname) AS DistinctSurname FROM OwnerCar

--2-20 Вивести кількість зустрічаємих імен Власників на літеру К.

select COUNT (OwnerName) as OwnerNameK 
from OwnerCar
where OwnerName LIKE 'К%'


--2-21 Вивести кількість співробітників в кожному місті. Упорядкувати записи по місту. 
--Поля виводу повинні бути такими, що читаються, для цього  використовувати псевдоніми для імен стовпчиків.


select EmplBirthplace, Count(EmployeeId) as Count_Employee
from Employee
Group By EmplBirthplace
Order By EmplBirthplace

--2-22 Вивести результати сервісу по цінах: кількість автомобілів, які відремонтовано за дану ціну,
--та кількість видів робот по яким були отримані дані ціни.
--Поля виводу – повинні бути такими, що читаються, для цього  використовувати псевдоніми для імен стовпчиків. 



Select ServicePrice, Count(CarId)as Count_Car,Count(TypeOfWorkId)as Count_TypeOfWorkId 
from Service
Group By ServicePrice


--2-23 Вивести перелік видів робот та кількість автомобілів, які оплатили «5000» по даним видам робіт.  
--Поля виводу – повинні бути такими, що читаються, для цього  використовувати псевдоніми для імен стовпчиків.

Select TypeOfWork.TitleOfWork, Count(Service.CarId)as Count_Car from Service,TypeOfWork
Where ServicePrice=5000 and TypeOfWork.TypeOfWorkId=Service.TypeOfWorkId
Group By TypeOfWork.TitleOfWork


--2-24 Вивести кількість прийнятих замовлень в день.
--Впорядкувати записи по даті.


Select ServiceDateStart as DateStart, COUNT(ServiceId)as NumberServ from Service
Group By ServiceDateStart
Order By ServiceDateStart



--2-25 Скільки сервісних робіт прийнято в день, і в який день було прийнято більше 2 сервісних робіт. 
--Впорядкувати записи по даті.


Select ServiceDateStart as StartDate, COUNT(ServiceId)as ServNum from Service
Group By ServiceDateStart
Having COUNT(ServiceId)>2
Order By ServiceDateStart

--2-26 Вивести середню виплату по містах для співробітників, дата народження 
--яких потрапляє в період: 1945-01-01 та 1965-12-31

SELECT EmplBirthplace, AVG(EmplSalary+EmplSurcharge)as AvgMoney
FROM Employee 
WHERE EmplBirthDay BETWEEN '1945-01-01' AND '1965-12-31' 
Group By EmplBirthplace


--2-27 Отримати інформацію про кількість По-батькові
SELECT COUNT (*)  AS Employee_Middlename_Total
 FROM (
     SELECT  EmplMiddlename FROM Employee
	  ) AS Employee_Middlename


--Отримати інформацію про кількість неповторюючихся По-батькові
SELECT COUNT (*)  AS Employee_Middlename_DISTINCT
 FROM (
     SELECT DISTINCT EmplMiddlename FROM Employee WHERE  EmplMiddlename IS not NULL
	  ) AS Employee_Middlename


--Отримати інформацію про кількість власників, у яких відсутнє По-батькові
SELECT COUNT (*)  AS Employee_Middlename_Null
 FROM (
     SELECT  EmplMiddlename FROM Employee WHERE  EmplMiddlename IS NULL
	  ) AS Employee_Middlename

--2-28 Вивести автомобіль, у якого середня ціна сервісу більше 3000

SELECT CarId, AVG(ServicePrice) as AvgServPrice 
FROM  Service  
GROUP BY  CarId
HAVING AVG(Service.ServicePrice)>3000

--2-29  Вивести середні виплати по посадах, які більше >4500.

SELECT PositionId, AVG(EmplSalary+EmplSurcharge) As AvgMoney 
FROM Employee 
 GROUP BY PositionId 
 HAVING AVG(EmplSalary+EmplSurcharge)> 4500