--Операції за допомогою UNION, EXCEPT, INTERSECT
-- UNION - объединения запросов SELECT(каждый SELECT внутри UNION должен иметь одинаковое число столбцов и типы)


--5.1-1 Отримати ВСІ ПІБ, місце народження, дату народження для власників автомобілів та співробітників.

select EmplName+' '+isnull(EmplMiddlename, '')+' '+EmplSurname  as FIO,
       EmplBirthplace as Birthplace, EmplBirthDay as BirthDay
from Employee

union all   

select OwnerName+' '+ isnull(OwnerMiddlename, '')+' '+OwnerSurname  as FIO,
        OwnerBirthplace as Birthplace, OwnerBirthDay as BirthDay
     
from OwnerCar

--Операції за допомогою UNION, EXCEPT, INTERSECT
-- UNION - объединения запросов SELECT(каждый SELECT внутри UNION должен иметь одинаковое число столбцов и типы)


--5.1-2 Отримати ПІБ, місце народження, дату народження для власників автомобілів та співробітників, виключивши дублікати.

select EmplName+' '+isnull(EmplMiddlename, '')+' '+EmplSurname  as FIO,
       EmplBirthplace as Birthplace, EmplBirthDay as BirthDay
from Employee

union    

select OwnerName+' '+ isnull(OwnerMiddlename, '')+' '+OwnerSurname  as FIO,
        OwnerBirthplace as Birthplace, OwnerBirthDay as BirthDay
     
from OwnerCar

--Операції за допомогою UNION, EXCEPT, INTERSECT
-- UNION - объединения запросов SELECT(каждый SELECT внутри UNION должен иметь одинаковое число столбцов и типы)


--5.1-3 Отримати всі міста, в яких народжувалися Співробітники, але не народжувалися Власники автомобілів.

select EmplBirthplace as Birthplace
 from Employee

except 

select OwnerBirthplace as Birthplace
 from OwnerCar

 --Операції за допомогою UNION, EXCEPT, INTERSECT
-- UNION - объединения запросов SELECT(каждый SELECT внутри UNION должен иметь одинаковое число столбцов и типы)


--5.1-4 Отримати всі різні міста, в яких народжувалися і Власники автомобілів і Співробітники.

select EmplBirthplace as Birthplace
 from Employee

INTERSECT 

select OwnerBirthplace as Birthplace
 from OwnerCar

 

--5.1-5 Вивести співробітників, які робили сервіс для автомобілів кольору «Синий» ТА «Красный».
--Без допомоги підзапитів.

select ca.CarColor, se.EmployeeId
from Car ca
 inner join Service se on  ca.CarId=se.CarId 
 where ca.CarColor in ('Синій', 'Красний')
 group by se.EmployeeId, ca.CarColor

 --Додавання даних до Таблиці INSERT
--5_2-1

--1 Створити БД zkMyCopy_додатковий_символ (надалі zkMyCopy)

create database zkMyCopy_carserv; 

--1.2 Створити таблиці в БД zkMyCopy :
--ВидРоботиCopyA – структура аналогічна -ВидРоботи-

create table TypeOfWorkCopyA
(
	TypeOfWorkId int identity(1,1) not null PRIMARY KEY,
	TitleOfWork varchar(250) not null,
	DescriptOfWork varchar(1000) not null			  
);

----ВидРоботиCopyB – внести додаткове поле: Аббревиатура 

create table TypeOfWorkCopyB
(
	TypeOfWorkId int identity(1,1) not null PRIMARY KEY,
	TitleOfWork varchar(250) not null,
	DescriptOfWork varchar(1000) not null,
	Abbreviation varchar(250)  null				  
);

--ВидРоботиCopyC – структура аналогічна -ВидРоботи-
create table TypeOfWorkCopyC
(
	TypeOfWorkId int identity(1,1) not null PRIMARY KEY,
	TitleOfWork varchar(250) not null,
	DescriptOfWork varchar(1000) not null			  
);

--1.3. Вставити дані з ВидРоботи в створені таблиці ВидРоботиCopyA та ВидРоботиCopyB.

--SET IDENTITY_INSERT TypeOfWorkCopyA OFF; 
--SET IDENTITY_INSERT TypeOfWorkCopyB ON; 

INSERT INTO TypeOfWorkCopyA (TypeOfWorkId, TitleOfWork, DescriptOfWork)
SELECT TypeOfWorkId, TitleOfWork, DescriptOfWork
FROM SQLDB.dbo.TypeOfWork


INSERT INTO TypeOfWorkCopyB (TypeOfWorkId, TitleOfWork, DescriptOfWork)
SELECT TypeOfWorkId, TitleOfWork, DescriptOfWork
FROM SQLDB.dbo.TypeOfWork


--2.1 Із таблиці ВидРоботи вставити дані в таблицю ВидРоботиCopyC тільки для записів,
-- у яких ВидРоботиId>5


SET IDENTITY_INSERT TypeOfWorkCopyC ON; 


INSERT INTO TypeOfWorkCopyC (TypeOfWorkId, TitleOfWork, DescriptOfWork)
SELECT TypeOfWorkId, TitleOfWork, DescriptOfWork
FROM SQLDB.dbo.TypeOfWork
where TypeOfWorkId>5

----5_2-3 
--Створити таблицю в БД zkMyCopy:
--МаркаCopy – структура аналогічна Марка

create table CarModelCopy
(
	CarModelId int identity(1,1) not null PRIMARY KEY,
	CarModelName varchar(50) not null,
	CarCountryProd varchar(50) not null,
	CarDescript varchar(1000) not null	  
);

--3.2. Скопіювати з Марка дані, у яких Id>3 та <5 в МаркаCopy 

SET IDENTITY_INSERT CarModelCopy ON; 


INSERT INTO CarModelCopy (CarModelId, CarModelName, CarCountryProd,CarDescript)
SELECT CarModelId, CarModelName, CarCountryProd,CarDescript
FROM SQLDB.dbo.CarModel
where CarModelId>3 and CarModelId<5


--Оновлення даних в Таблиці UPDATE

--5_2-6 В таблиці «Власник» для власника «Сидоров»:  Номер змінити на «АА1233АВ»

    UPDATE OwnerCar 
    SET OwnerDriverlicNum = 'АА1233АВ' 
    WHERE OwnerSurname = 'Сидоров'

--Оновлення даних в Таблиці UPDATE

--5_2-7 В таблиці «Власник» для власників з ідентифікаторами від 7 до 8 змінити місто на «Прага»

    UPDATE OwnerCar 
    SET OwnerBirthplace = 'Прага' 
    WHERE OwnerCarId in(7,8)

--Оновлення даних в Таблиці UPDATE
--5_2-8 Збільшити оклад для посад механік та зварювальник на 25%

    UPDATE Employee 
    SET EmplSalary =  EmplSalary*1.25
    WHERE PositionId in 
		(
		select PositionId 
		from Position 
		where PositionName in('Механік', 'Зварювальник')
		)

--Оновлення даних в Таблиці UPDATE
--5_2-9 Збільшити мінімальний оклад на 0,7 (Підзапит для min окладу)

    UPDATE Employee 
    SET EmplSalary =  EmplSalary*1.7
    WHERE EmployeeId in 
		(
		select EmployeeId  
		from Employee 	
		where EmplSalary = (select min(EmplSalary) from Employee)
		)


--Оновлення даних в Таблиці UPDATE

-- 5_2-10 Збільшити максимальний оклад в 2 рази

 UPDATE Employee 
    SET EmplSalary =  EmplSalary*2
    WHERE EmployeeId in 
		(
		select EmployeeId  
		from Employee 	
		where EmplSalary = (select max(EmplSalary) from Employee)
		)

--UPDATE

--5_2-11 1. Створити стовбець Модель в Таблиці Автомобіль.

ALTER TABLE Car ADD Model varchar(50)  null


--UPDATE
--5_2-11_2

--2. Для всіх марок внести модель – «X3».
UPDATE Car 
    SET Model =  'XЗ'

--UPDATE

--5_2-11_3
--3. Для марки автомобілю «FIAT Albea» змінити модель на «Q50».

 UPDATE Car 
    SET Model =  'Q50'
    WHERE CarModelId in 
		(
		select CarModelId  
		from CarModel 	
		where CarModelName = 'FIAT Albea'
		)

--Видалення даних із Таблиці

--5_2-12 Видалити записи з таблиці «Сервіс», у яких АвтомобільId>13 та у яких  АвтомобільId<14.


DELETE	FROM
   Service
	WHERE CarId in (13,14)


--Видалення даних із Таблиці

--5_2-13 Видалити з таблиці «Сервіс» записи про "Бежеві" автомобілі.


DELETE	FROM
   Service
	WHERE CarId in (select CarId from Car where CarColor like 'Беж')

--Видалення даних із Таблиці

--5_2-14 Видалити з таблиці «Автомобіль» автомобілі АвтомобільId>16 та <18.


DELETE	FROM
   Car
	WHERE CarId in (16,17,18)