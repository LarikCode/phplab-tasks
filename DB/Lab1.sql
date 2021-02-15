
create database SQLDB;
use SQLDB;

---------------------------------------------------------------------------------------
--Создание таблиц
create table OwnerCar
(
	OwnerCarId int identity(1,1) not null PRIMARY KEY,
	OwnerName nvarchar(50) not null,
	OwnerMiddlename nvarchar(50)  null,
	OwnerSurname nvarchar(50) not null,
	OwnerBirthDay  date not null,
	OwnerBirthplace nvarchar(50)  null,
	OwnerDriverlicNum nvarchar(50) not null,
	OwnerPhoneNum  nvarchar(22) null 	  
);

create table CarModel
(
	CarModelId int identity(1,1) not null PRIMARY KEY,
	CarModelName nvarchar(50) not null,
	CarCountryProd nvarchar(50) not null,
	CarDescript nvarchar(1000) not null	  
);

create table Car
(
	CarId int identity(1,1) not null PRIMARY KEY,

	OwnerCarId int not null references OwnerCar(OwnerCarId),
	CarModelId int not null references CarModel(CarModelId),

	CarStateNum nvarchar(50) not null,
	CarColor nvarchar(50) not null,	
	CarYearOfProd int not null,
	CarSpec nvarchar(1000) not null		  
);

create table TypeOfWork
(
	TypeOfWorkId int identity(1,1) not null PRIMARY KEY,
	TitleOfWork nvarchar(250) not null,
	DescriptOfWork nvarchar(1000) not null			  
);

create table Position
(
	PositionId int identity(1,1) not null PRIMARY KEY,
	PositionName nvarchar(50) not null,
	PositionDescript nvarchar(1000) not null			  
);

create table Employee
(
	EmployeeId int identity(1,1) not null PRIMARY KEY,

	PositionId int not null references Position(PositionId),

	EmplName nvarchar(50) not null,
	EmplMiddlename nvarchar(50)  null,
	EmplSurname nvarchar(50) not null,
	EmplBirthDay date not null,
	EmplBirthplace nvarchar(50)  null,
	EmplSalary money  not null,
	EmplSurcharge money null,
	EmplPaymentDate date not null,
	EmplPhoneNum nvarchar(22) null	 			  
);

create table Service
(
	ServiceId int identity(1,1) not null PRIMARY KEY,

	CarId int not null references Car(CarId),
	EmployeeId int not null references Employee(EmployeeId),
	TypeOfWorkId int not null references TypeOfWork(TypeOfWorkId),

	ServicePrice money  not null,
	ServiceDateStart date not null,
	ServiceDateFinish date null,
	ServiceNotes nvarchar(1000)  null			 			  
);


  --####################################################################################--
--Добавление типов работы

use SQLDB;

insert into TypeOfWork(TitleOfWork, DescriptOfWork)
 values ('Заміна колеса','Провели заміну лівого заднього колеса');

 insert into TypeOfWork(TitleOfWork, DescriptOfWork)
 values ('Заміна лобового скла','Провели заміну  заднього скла');

  insert into TypeOfWork(TitleOfWork, DescriptOfWork)
 values ('Заміна шарніру','Провели заміну лівого заднього шарніру');
 
insert into TypeOfWork(TitleOfWork, DescriptOfWork)
 values ('Заміна колеса','Провели заміну правого заднього колеса');

  insert into TypeOfWork(TitleOfWork, DescriptOfWork)
 values ('Заміна лобового скла','Провели заміну  переднього скла');

 
  --####################################################################################--
 --Добавление должностей

 use SQLDB;

insert into Position(PositionName, PositionDescript)
 values ('Механік','Займається ремонтом авто');

 insert into Position(PositionName, PositionDescript)
 values ('Зварювальник','Займається зварюванням та відновленням корпусу авто');


  insert into Position(PositionName, PositionDescript)
 values ('Діагност підвіски','Займається діагностикою підвіски');


   insert into Position(PositionName, PositionDescript)
 values ('Діагност двигуна','Займається діагностикою двигуна');

    insert into Position(PositionName, PositionDescript)
 values ('Стажер механік','Займається ремонтом двигуна');
 


 --####################################################################################--
 --Добавление моделей автомобилей
 
 
 use SQLDB;

insert into CarModel(CarModelName, CarCountryProd, CarDescript)
 values ('BMW-128', 'Німеччина', 'Б/У');

 insert into CarModel(CarModelName, CarCountryProd, CarDescript)
 values ('AUDI-100', 'Німеччина', 'Б/У');

 insert into CarModel(CarModelName, CarCountryProd, CarDescript)
 values ('AUDI-A1', 'Німеччина', 'Б/У');

  insert into CarModel(CarModelName, CarCountryProd, CarDescript)
 values ('FIAT Albea', 'Італія', 'Б/У');

 insert into CarModel(CarModelName, CarCountryProd, CarDescript)
 values ('Honda Accord', 'Японія', 'Б/У');



 
   --####################################################################################--
 --Добавление владельцев автомобилей

 use SQLDB;

insert into OwnerCar(OwnerName, OwnerMiddlename,OwnerSurname, OwnerBirthDay, OwnerBirthplace, OwnerDriverlicNum,OwnerPhoneNum)
 values ('Микола','Миколайович', 'Мозговий', '1989-11-20', 'Львiв', 'KG4564564', '0957452234');

 insert into OwnerCar(OwnerName, OwnerMiddlename,OwnerSurname, OwnerBirthDay, OwnerBirthplace, OwnerDriverlicNum,OwnerPhoneNum)
 values ('Петро','Петрович', 'Мазепа', '1990-10-30', 'Київ', 'BF1234556', '0507445234');

 insert into OwnerCar(OwnerName, OwnerMiddlename,OwnerSurname, OwnerBirthDay, OwnerBirthplace, OwnerDriverlicNum,OwnerPhoneNum)
 values ('Микола','Сергійович', 'Миколан', '1966-11-10', 'Суми', 'DF1454564', '0997654234');

 insert into OwnerCar(OwnerName, OwnerMiddlename,OwnerSurname, OwnerBirthDay, OwnerBirthplace, OwnerDriverlicNum,OwnerPhoneNum)
 values ('Сидор', 'Петрович', 'Ванов', '1990-03-11', 'Черкаси', 'FG1237864', '0987561234');

  insert into OwnerCar(OwnerName, OwnerSurname, OwnerBirthDay, OwnerBirthplace, OwnerDriverlicNum,OwnerPhoneNum)
 values ('Сергій', 'Лановий', '1985-06-11', 'Черкаси', 'FG1237456', '0987881234');


 --####################################################################################--
 --Добавление автомобилей



   insert into Car(OwnerCarId, CarModelId, CarStateNum, CarColor,CarYearOfProd, CarSpec)
 values (1, 1, 'HGF-665687', 'Красний', 2011, 'Дизель, Автомат');
   insert into Car(OwnerCarId, CarModelId, CarStateNum, CarColor,CarYearOfProd, CarSpec)
 values (2, 2, 'DFG-765687', 'Зелений', 2015, 'Бензин, Механіка');
   insert into Car(OwnerCarId, CarModelId, CarStateNum, CarColor,CarYearOfProd, CarSpec)
 values (3, 3, 'SDC-435654', 'Жовтий', 1999, 'Дизель, Автомат');
   insert into Car(OwnerCarId, CarModelId, CarStateNum, CarColor,CarYearOfProd, CarSpec)
 values (4, 4, 'ASD-465345', 'Былий', 2010, 'Бензин, Механіка');
    insert into Car(OwnerCarId, CarModelId, CarStateNum, CarColor,CarYearOfProd, CarSpec)
 values (5, 5, 'VBN-567687', 'Рожевий', 2005, 'Дизель, Автомат');

 
  --####################################################################################--
 --Добавление работников

 use SQLDB;

insert into Employee(PositionId, EmplName, EmplMiddlename, EmplSurname, EmplBirthDay, EmplBirthplace, EmplSalary, EmplSurcharge, EmplPaymentDate, EmplPhoneNum)
 values (1,'Петро', 'Володимирович', 'Мамонт', '1966-11-10' ,'Суми' , 10000, 1000, '2019-05-05', '0989584235');

insert into Employee(PositionId, EmplName, EmplMiddlename, EmplSurname, EmplBirthDay, EmplBirthplace, EmplSalary, EmplSurcharge, EmplPaymentDate, EmplPhoneNum)
 values (2,'Микола', 'Миколайович', 'Берет', '1988-10-15' ,'Дніпро' , 11000, 500, '2019-05-05', '0987844237');

 insert into Employee(PositionId, EmplName, EmplMiddlename, EmplSurname, EmplBirthDay, EmplBirthplace, EmplSalary, EmplSurcharge, EmplPaymentDate, EmplPhoneNum)
 values (3,'Сергій', 'Миколайович', 'Велет', '1990-12-20' ,'Львiв' , 9000, 300, '2019-05-05', '0667664237');

  insert into Employee(PositionId, EmplName, EmplMiddlename, EmplSurname, EmplBirthDay, EmplBirthplace, EmplSalary, EmplSurcharge, EmplPaymentDate, EmplPhoneNum)
 values (4,'Євген', 'Петрович', 'Насор', '1991-10-29' ,'Черкаси' , 9500, 200, '2019-05-05', '0677524237');

   insert into Employee(PositionId, EmplName, EmplMiddlename, EmplSurname, EmplBirthDay, EmplBirthplace, EmplSalary, EmplSurcharge, EmplPaymentDate, EmplPhoneNum)
 values (5,'Валентин', 'Петрович', 'Пором', '1999-11-20' ,'Черкаси' , 7000, 100, '2019-05-05', '0668524237');
 
 

  --####################################################################################--
 --Добавить калькулируемое поле

ALTER TABLE Employee ADD EmpFullSalary AS EmplSalary + EmplSurcharge;

 
 
 --####################################################################################--
 --Добавление сервисов

 use SQLDB;

insert into Service(CarId, EmployeeId, TypeOfWorkId, ServicePrice, ServiceDateStart, ServiceDateFinish, ServiceNotes)
 values (1, 1, 1, 3000, '2019-01-10', '2019-01-20', 'Без зауважень');

 insert into Service(CarId, EmployeeId, TypeOfWorkId, ServicePrice, ServiceDateStart, ServiceDateFinish, ServiceNotes)
 values (1, 1, 2, 2000, '2019-02-10', '2019-02-20', 'Без зауважень');

 insert into Service(CarId, EmployeeId, TypeOfWorkId, ServicePrice, ServiceDateStart, ServiceDateFinish, ServiceNotes)
 values (1, 1, 3, 3000, '2019-03-10', '2019-03-20', 'Без зауважень');

 insert into Service(CarId, EmployeeId, TypeOfWorkId, ServicePrice, ServiceDateStart, ServiceDateFinish, ServiceNotes)
 values (2, 2, 2, 1000, '2019-04-01', '2019-04-20', 'Без зауважень');

 insert into Service(CarId, EmployeeId, TypeOfWorkId, ServicePrice, ServiceDateStart, ServiceDateFinish, ServiceNotes)
 values (3, 3, 3, 3000, '2019-04-05', '2019-04-25', 'Без зауважень');

 insert into Service(CarId, EmployeeId, TypeOfWorkId, ServicePrice, ServiceDateStart, ServiceDateFinish, ServiceNotes)
 values (4, 4, 4, 5000, '2019-01-10', '2019-01-25', 'Без зауважень');

 insert into Service(CarId, EmployeeId, TypeOfWorkId, ServicePrice, ServiceDateStart, ServiceDateFinish, ServiceNotes)
 values (5, 5, 5, 10000, '2019-02-10', '2019-02-20', 'Без зауважень');