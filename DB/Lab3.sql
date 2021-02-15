--3-1 Вивести всю інформацію за видом роботи «Покраска» - Вибірка 

SELECT * FROM TypeOfWork
where TitleOfWork = 'Покраска'

--3-2 Вивести всю інформацію за посадою: «Механик»	- Вибірка

SELECT * FROM Position
where PositionName like '%Механік%'

--3-3 Вивести ПІБ Співробітників -	Проекція (без дубликатов кортежей)

SELECT DISTINCT
	EmplName,
	EmplMiddlename,
	EmplSurname
FROM [Employee]
order by 
	EmplName,
	EmplMiddlename,
	EmplSurname

--3-4	Вивести державний №, рік виробництва автомобілю та ідентифікатор власника якому він належить.
-- Впорядкувати отриманий результат	- Проекція (без дубликатов)

SELECT DISTINCT OwnerCarId, CarStateNum, CarYearOfProd	
FROM Car 
order by OwnerCarId

--3-5 Вивести всю множину записів, яка може бути для таблиць Співробітник та Посада, по іменах -	
 -- Декартів добуток (каждая строка из первой таблицы соединяется с каждой строкой второй таблицы)
SELECT 
	Employee.EmplName, 
	Position.PositionName 
FROM Employee 
	CROSS JOIN Position

--3-6  Вивести всю множину записів, яка може бути для таблиць Автомобіль та Власник, 
--по іменах	Декартів добуток (каждая строка из первой таблицы соединяется с каждой строкой второй таблицы)

SELECT 
	Car.CarId,
	OwnerCar.OwnerName 
FROM Car 
	CROSS JOIN OwnerCar

--3-6.1 Вивести всю множину записів, яка може бути для таблиць Автомобіль та Власник, по іменах
--з використанням псевдонімів 

SELECT 
	Car.CarId as CarId,
	OwnerCar.OwnerName as OwnerName
FROM Car 
	CROSS JOIN OwnerCar


--3-07 Об’єднання за рівністю.
--Вивести ПІБ Співробітників та назву посад:
-- -Неявний синтаксис з’єднання (старий стиль синтаксису з’єднання), без псевдонимов;

SELECT (Employee.EmplName+' '+isnull(Employee.EmplMiddlename, '')+' '+Employee.EmplSurname +' - '+ Position.PositionName) as EmplName_Pos1
FROM  Employee, Position
where Employee.PositionId=Position.PositionId

-- -Неявний синтаксис з використанням псевдонімів;
SELECT (e.EmplName+' '+isnull(e.EmplMiddlename, '')+' '+e.EmplSurname +' - '+ p.PositionName) as EmplName_Pos2
FROM  Employee e, Position p
where e.PositionId=p.PositionId

-- -Явний синтаксис з’єднання (SQL ANSI:1992 синтаксис з’єднання);
SELECT   (Employee.EmplName+' '+isnull(Employee.EmplMiddlename, '')+' '+Employee.EmplSurname +' - '+ Position.PositionName) as EmplName_Pos3
FROM Employee  
	 join  Position on Employee.PositionId=Position.PositionId
order by EmplName_Pos3

-- -Явний синтаксис з використанням псевдонімів.
SELECT   (e.EmplName+' '+isnull(e.EmplMiddlename, '')+' '+e.EmplSurname +' - '+ p.PositionName) as EmplName_Pos4
FROM Employee as e 
	 join  Position as p on e.PositionId=p.PositionId
order by EmplName_Pos4


--3-08--Вивести всі ПІБ власників, які мають автомобілі білого кольору:
--Неявний синтаксис з’єднання (старий стиль синтаксису з’єднання);
SELECT (OwnerCar.OwnerName+' '+isnull(OwnerCar.OwnerMiddlename, '')+' '+OwnerCar.OwnerSurname +' має авто кольору: '+ Car.CarColor) as OwnerName_CarColor1
FROM  OwnerCar, Car
where OwnerCar.OwnerCarId=Car.OwnerCarId
 and Car.CarColor like 'Білий'

--Неявний синтаксис з використанням псевдонімів;
SELECT (o.OwnerName+' '+isnull(o.OwnerMiddlename, '')+' '+o.OwnerSurname +' має авто кольору: '+ c.CarColor) as OwnerName_CarColor2
FROM  OwnerCar o, Car c
where o.OwnerCarId=c.OwnerCarId
 and c.CarColor like 'Білий'

--Явний синтаксис з’єднання (SQL ANSI:1992 синтаксис з’єднання);
SELECT (OwnerCar.OwnerName+' '+isnull(OwnerCar.OwnerMiddlename, '')+' '+OwnerCar.OwnerSurname +' має авто кольору: '+ Car.CarColor) as OwnerName_CarColor3
FROM  OwnerCar 
  join Car on OwnerCar.OwnerCarId=Car.OwnerCarId
 and Car.CarColor like 'Білий'

--Явний синтаксис з використанням псевдонімів.
SELECT (o.OwnerName+' '+isnull(o.OwnerMiddlename, '')+' '+o.OwnerSurname +' має авто кольору: '+ c.CarColor) as OwnerName_CarColor4
FROM  OwnerCar as o
  join Car as c on o.OwnerCarId=c.OwnerCarId
 and c.CarColor like 'Білий'


  --3-09-- Команда JOIN в пропозиції FROM --Внутрішнє з’єднання
 --Inner join -- получения только тех строк, для которых существует соответствие записей главной таблицы и присоединяемой.

--3-10 Вивести ПІБ, Державний № автомобіля, № водійського посвідчення, телефон для власників,
-- які мають автомобіль кольору або «Красный» або  «Синий». Сортувати за прізвищем 

select 
	o.OwnerName+' '+ isnull(o.OwnerMiddlename, '')+' '+o.OwnerSurname  as FIO,
	c.CarColor, c.CarStateNum, o.OwnerDriverlicNum, o.OwnerPhoneNum
from Car c 
	inner join OwnerCar o on c.OwnerCarId=o.OwnerCarId
where c.CarColor like 'Синій' 
	or c.CarColor like 'Красний'
order by FIO 



  --Команда JOIN в пропозиції FROM --Внутрішнє з’єднання
 --Inner join -- получения только тех строк, для которых существует соответствие записей главной таблицы и присоединяемой.

--3-10--Вивести ПІБ, Назву посади, місто народження, дату народження для співробітників, 
--які отримують надбавку в діапазоні 620-800 грн. та які не отримують надбавку 
--Сортувати за прізвищем та надбавкою

select 
	e.EmplName+ ' ' + isnull(e.EmplMiddlename, '')+' '+e.EmplSurname as FIO,
	p.PositionName, e.EmplBirthplace, e.EmplBirthDay, e.EmplSalary,
	isnull(e.EmplSurcharge, 0) as  EmplSurcharge	
from Employee e 
	inner join Position p on e.PositionId =p.PositionId
where EmplSurcharge between '620' and '800' 
	  or e.EmplSurcharge is null
order by FIO, EmplSurcharge


--Команда JOIN в пропозиції FROM --Внутрішнє з’єднання
 --Inner join -- получения только тех строк, для которых существует соответствие записей главной таблицы и присоединяемой.

--3-11 Вивести ПІБ власників, Державний № автомобіля, Марку автомобіля, Вид роботи та ціну за роботу в сервісі.
-- Сортувати за прізвищем

select 
	o.OwnerName+' '+ isnull(o.OwnerMiddlename, '')+' '+o.OwnerSurname  as FIO,
	 cm.CarModelName, c.CarStateNum, tw.TitleOfWork, s.ServicePrice
from OwnerCar o 
    inner join Car c on o.OwnerCarId =c.OwnerCarId	
	inner join Service s on s.CarId=c.CarId
	inner join CarModel cm on cm.CarModelId =c.CarModelId
	inner join TypeOfWork tw on tw.TypeOfWorkId=s.TypeOfWorkId
	order by FIO


--Команда JOIN в пропозиції FROM --Внутрішнє з’єднання
 --Inner join -- получения только тех строк, для которых существует соответствие записей главной таблицы и присоединяемой.

--3-12 Вивести ПІБ власників, Державний № автомобіля, дату прийняття в сервіс з ціною 
--більше 3400 в період з 2019-01-01 по 2019-04-01

select 
o.OwnerName+' '+ isnull(o.OwnerMiddlename, '')+' '+o.OwnerSurname  as FIO,
c.CarStateNum, s.ServiceDateStart, s.ServicePrice

from OwnerCar o 
    inner join Car c on o.OwnerCarId =c.OwnerCarId	
	inner join Service s on s.CarId=c.CarId

where s.ServicePrice>3400  
	  and s.ServiceDateStart between '2019-01-01' and '2019-04-01'
order by FIO 



--Команда JOIN в пропозиції FROM --Внутрішнє з’єднання
 --Inner join -- получения только тех строк, для которых существует соответствие записей главной таблицы и присоединяемой.

--3-13 Вивести ПІБ власників, Державний № автомобілів, Марку автомобілів, 
--які не вироблені в «Японія» та «Німеччина». Сортувати за прізвищем

select 
o.OwnerName+' '+ isnull(o.OwnerMiddlename, '')+' '+o.OwnerSurname  as FIO,
cm.CarModelName, c.CarStateNum, cm.CarCountryProd
from OwnerCar o 
	inner join Car c on o.OwnerCarId =c.OwnerCarId		
	inner join CarModel cm on cm.CarModelId =c.CarModelId
where cm.CarCountryProd not in ('Японія','Німеччина')
order by FIO



--Команда JOIN в пропозиції FROM --Внутрішнє з’єднання
 --Inner join -- получения только тех строк, для которых существует соответствие записей главной таблицы и присоединяемой.

--Вивести ПІБ власників, Марку автомобіля, Вид роботи та ПІБ, Назву посади співробітників,
-- які проводили сервіс. Сортувати за маркою

select distinct 
	o.OwnerName+' '+ isnull(o.OwnerMiddlename, '')+' '+o.OwnerSurname  as FIO_owner,	
	cm.CarModelName, tw.TitleOfWork, p.PositionName,
	e.EmplName+ ' ' + isnull(e.EmplMiddlename, '')+' '+e.EmplSurname as FIO_employee

from OwnerCar o 
    inner join Car c on o.OwnerCarId =c.OwnerCarId	
	inner join Service s on s.CarId=c.CarId
	inner join CarModel cm on cm.CarModelId =c.CarModelId
	inner join TypeOfWork tw on tw.TypeOfWorkId=s.TypeOfWorkId
	inner join Employee e on e.EmployeeId=s.EmployeeId
	inner join Position p on p.PositionId = e.PositionId
order by cm.CarModelName
-- o cm tw p e -- s c



--Команда JOIN в пропозиції FROM --Внутрішнє з’єднання
 --Inner join -- получения только тех строк, для которых существует соответствие записей главной таблицы и присоединяемой.

--3-15 Вивести кількість автомобілів марки (назву марки)


select 
	cm.CarModelName,
	count (cm.CarModelId) as 'NumOfCarSuchModel'
from Car c 
inner join CarModel cm on c.CarModelId = cm.CarModelId
group by cm.CarModelName


--Команда JOIN в пропозиції FROM --Внутрішнє з’єднання
 --Inner join -- получения только тех строк, для которых существует соответствие записей главной таблицы и присоединяемой.

 --3-16 Вивести кількість автомобілів марки (назву марки), ціна сервісу яких 900.

select 
	cm.CarModelName,
	count (cm.CarModelId) as 'NumCarModelWithServis900'
from Car c 
inner join CarModel cm on c.CarModelId = cm.CarModelId
inner join Service s on c.CarId = s.CarId

group by cm.CarModelName, s.ServicePrice
having s.ServicePrice=900



--Команда JOIN в пропозиції FROM --Внутрішнє з’єднання
 --Inner join -- получения только тех строк, для которых существует соответствие записей главной таблицы и присоединяемой.

 --3-17 Вивести для власників, які мають в № водійського посвідчення цифру «300»: ПІБ власників, 
 --Марку автомобіля, ПІБ, Назву посади співробітників, які проводили сервіс та кількість проведених Видів робіт

 select distinct 
	o.OwnerName+' '+ isnull(o.OwnerMiddlename, '')+' '+o.OwnerSurname  as FIO_owner, o.OwnerDriverlicNum,	
	cm.CarModelName,	tw.TitleOfWork,	 p.PositionName,
	e.EmplName+ ' ' + isnull(e.EmplMiddlename, '')+' '+e.EmplSurname as FIO_employee,
	COUNT(ServiceId)as ServNum
from OwnerCar o 
    inner join Car c on o.OwnerCarId =c.OwnerCarId	
	inner join Service s on s.CarId=c.CarId
	inner join CarModel cm on cm.CarModelId =c.CarModelId
	inner join TypeOfWork tw on tw.TypeOfWorkId=s.TypeOfWorkId
	inner join Employee e on e.EmployeeId=s.EmployeeId
	inner join Position p on p.PositionId = e.PositionId	
group by
 	o.OwnerName+' '+ isnull(o.OwnerMiddlename, '')+' '+o.OwnerSurname, o.OwnerDriverlicNum,	
	cm.CarModelName,	tw.TitleOfWork,	 p.PositionName,
	e.EmplName+ ' ' + isnull(e.EmplMiddlename, '')+' '+e.EmplSurname        
having o.OwnerDriverlicNum like '%300%'

--Команда JOIN в пропозиції FROM --Внутрішнє з’єднання
 --Inner join -- получения только тех строк, для которых существует соответствие записей главной таблицы и присоединяемой.

--3-18 Вивести список робіт  автомобілів, які були прийняті в період з 01 по 07 квітня:
-- Назву виду роботи, ПІБ співробітника, ціна. Відсортувати за видом роботи, прізвищем


 select distinct 
    tw.TitleOfWork,
	e.EmplName+ ' ' + isnull(e.EmplMiddlename, '')+' '+e.EmplSurname as FIO_employee,
	s.ServicePrice,s.ServiceDateStart
from Service s  	
	inner join TypeOfWork tw on tw.TypeOfWorkId=s.TypeOfWorkId
	inner join Employee e on e.EmployeeId=s.EmployeeId	
where s.ServiceDateStart between '2019-01-01' and '2019-04-07'			
group by 
    tw.TitleOfWork,
	e.EmplName+ ' ' + isnull(e.EmplMiddlename, '')+' '+e.EmplSurname,
	s.ServicePrice, s.ServiceDateStart	
order by  	   
    tw.TitleOfWork,
	e.EmplName+ ' ' + isnull(e.EmplMiddlename, '')+' '+e.EmplSurname 


--Зовнішнє з’єднання ( left join- из главной таблицы будут выбраны все записи, даже если в присоединяемой таблице нет совпадений
--Right join отображает все строки удовлетворяющие правой части условия, даже если они не имеют соответствия в главной (левой) таблице

--3-19 Вивести всі марки автомобілів та як доповнення – колір автомобілю цієї марки,
-- але наявність автомобілю цієї марки не є обов’язковою умовою


select  
	CarModel.CarModelName, isnull(Car.CarColor, '') as CarColor

from Car Car    
	 left join CarModel CarModel  on CarModel.CarModelId = Car.CarModelId
	
order by CarModel.CarModelName


--Зовнішнє з’єднання ( left join- из главной таблицы будут выбраны все записи, даже если в присоединяемой таблице нет совпадений
--Right join отображает все строки удовлетворяющие правой части условия, даже если они не имеют соответствия в главной (левой) таблице


--3-20 Вивести всі посади та ПІБ співробітників, які їх займають (якщо такі маються).

select 
	p.PositionName, 
	isnull(e.EmplName+ ' ' + isnull(e.EmplMiddlename, '')+' '+e.EmplSurname, '') as FIO	
from Position p  
	left join Employee e on e.PositionId =p.PositionId
order by p.PositionName,FIO
