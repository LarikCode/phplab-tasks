
create database SQLDB;
use SQLDB;

---------------------------------------------------------------------------------------
--�������� ������
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
--���������� ����� ������

use SQLDB;

insert into TypeOfWork(TitleOfWork, DescriptOfWork)
 values ('����� ������','������� ����� ����� �������� ������');

 insert into TypeOfWork(TitleOfWork, DescriptOfWork)
 values ('����� �������� ����','������� �����  �������� ����');

  insert into TypeOfWork(TitleOfWork, DescriptOfWork)
 values ('����� ������','������� ����� ����� �������� ������');
 
insert into TypeOfWork(TitleOfWork, DescriptOfWork)
 values ('����� ������','������� ����� ������� �������� ������');

  insert into TypeOfWork(TitleOfWork, DescriptOfWork)
 values ('����� �������� ����','������� �����  ���������� ����');

 
  --####################################################################################--
 --���������� ����������

 use SQLDB;

insert into Position(PositionName, PositionDescript)
 values ('������','��������� �������� ����');

 insert into Position(PositionName, PositionDescript)
 values ('������������','��������� ����������� �� ����������� ������� ����');


  insert into Position(PositionName, PositionDescript)
 values ('ĳ������ ������','��������� ����������� ������');


   insert into Position(PositionName, PositionDescript)
 values ('ĳ������ �������','��������� ����������� �������');

    insert into Position(PositionName, PositionDescript)
 values ('������ ������','��������� �������� �������');
 


 --####################################################################################--
 --���������� ������� �����������
 
 
 use SQLDB;

insert into CarModel(CarModelName, CarCountryProd, CarDescript)
 values ('BMW-128', 'ͳ�������', '�/�');

 insert into CarModel(CarModelName, CarCountryProd, CarDescript)
 values ('AUDI-100', 'ͳ�������', '�/�');

 insert into CarModel(CarModelName, CarCountryProd, CarDescript)
 values ('AUDI-A1', 'ͳ�������', '�/�');

  insert into CarModel(CarModelName, CarCountryProd, CarDescript)
 values ('FIAT Albea', '�����', '�/�');

 insert into CarModel(CarModelName, CarCountryProd, CarDescript)
 values ('Honda Accord', '�����', '�/�');



 
   --####################################################################################--
 --���������� ���������� �����������

 use SQLDB;

insert into OwnerCar(OwnerName, OwnerMiddlename,OwnerSurname, OwnerBirthDay, OwnerBirthplace, OwnerDriverlicNum,OwnerPhoneNum)
 values ('������','�����������', '��������', '1989-11-20', '���i�', 'KG4564564', '0957452234');

 insert into OwnerCar(OwnerName, OwnerMiddlename,OwnerSurname, OwnerBirthDay, OwnerBirthplace, OwnerDriverlicNum,OwnerPhoneNum)
 values ('�����','��������', '������', '1990-10-30', '���', 'BF1234556', '0507445234');

 insert into OwnerCar(OwnerName, OwnerMiddlename,OwnerSurname, OwnerBirthDay, OwnerBirthplace, OwnerDriverlicNum,OwnerPhoneNum)
 values ('������','���������', '�������', '1966-11-10', '����', 'DF1454564', '0997654234');

 insert into OwnerCar(OwnerName, OwnerMiddlename,OwnerSurname, OwnerBirthDay, OwnerBirthplace, OwnerDriverlicNum,OwnerPhoneNum)
 values ('�����', '��������', '�����', '1990-03-11', '�������', 'FG1237864', '0987561234');

  insert into OwnerCar(OwnerName, OwnerSurname, OwnerBirthDay, OwnerBirthplace, OwnerDriverlicNum,OwnerPhoneNum)
 values ('�����', '�������', '1985-06-11', '�������', 'FG1237456', '0987881234');


 --####################################################################################--
 --���������� �����������



   insert into Car(OwnerCarId, CarModelId, CarStateNum, CarColor,CarYearOfProd, CarSpec)
 values (1, 1, 'HGF-665687', '�������', 2011, '������, �������');
   insert into Car(OwnerCarId, CarModelId, CarStateNum, CarColor,CarYearOfProd, CarSpec)
 values (2, 2, 'DFG-765687', '�������', 2015, '������, �������');
   insert into Car(OwnerCarId, CarModelId, CarStateNum, CarColor,CarYearOfProd, CarSpec)
 values (3, 3, 'SDC-435654', '������', 1999, '������, �������');
   insert into Car(OwnerCarId, CarModelId, CarStateNum, CarColor,CarYearOfProd, CarSpec)
 values (4, 4, 'ASD-465345', '�����', 2010, '������, �������');
    insert into Car(OwnerCarId, CarModelId, CarStateNum, CarColor,CarYearOfProd, CarSpec)
 values (5, 5, 'VBN-567687', '�������', 2005, '������, �������');

 
  --####################################################################################--
 --���������� ����������

 use SQLDB;

insert into Employee(PositionId, EmplName, EmplMiddlename, EmplSurname, EmplBirthDay, EmplBirthplace, EmplSalary, EmplSurcharge, EmplPaymentDate, EmplPhoneNum)
 values (1,'�����', '�������������', '������', '1966-11-10' ,'����' , 10000, 1000, '2019-05-05', '0989584235');

insert into Employee(PositionId, EmplName, EmplMiddlename, EmplSurname, EmplBirthDay, EmplBirthplace, EmplSalary, EmplSurcharge, EmplPaymentDate, EmplPhoneNum)
 values (2,'������', '�����������', '�����', '1988-10-15' ,'�����' , 11000, 500, '2019-05-05', '0987844237');

 insert into Employee(PositionId, EmplName, EmplMiddlename, EmplSurname, EmplBirthDay, EmplBirthplace, EmplSalary, EmplSurcharge, EmplPaymentDate, EmplPhoneNum)
 values (3,'�����', '�����������', '�����', '1990-12-20' ,'���i�' , 9000, 300, '2019-05-05', '0667664237');

  insert into Employee(PositionId, EmplName, EmplMiddlename, EmplSurname, EmplBirthDay, EmplBirthplace, EmplSalary, EmplSurcharge, EmplPaymentDate, EmplPhoneNum)
 values (4,'�����', '��������', '�����', '1991-10-29' ,'�������' , 9500, 200, '2019-05-05', '0677524237');

   insert into Employee(PositionId, EmplName, EmplMiddlename, EmplSurname, EmplBirthDay, EmplBirthplace, EmplSalary, EmplSurcharge, EmplPaymentDate, EmplPhoneNum)
 values (5,'��������', '��������', '�����', '1999-11-20' ,'�������' , 7000, 100, '2019-05-05', '0668524237');
 
 

  --####################################################################################--
 --�������� �������������� ����

ALTER TABLE Employee ADD EmpFullSalary AS EmplSalary + EmplSurcharge;

 
 
 --####################################################################################--
 --���������� ��������

 use SQLDB;

insert into Service(CarId, EmployeeId, TypeOfWorkId, ServicePrice, ServiceDateStart, ServiceDateFinish, ServiceNotes)
 values (1, 1, 1, 3000, '2019-01-10', '2019-01-20', '��� ���������');

 insert into Service(CarId, EmployeeId, TypeOfWorkId, ServicePrice, ServiceDateStart, ServiceDateFinish, ServiceNotes)
 values (1, 1, 2, 2000, '2019-02-10', '2019-02-20', '��� ���������');

 insert into Service(CarId, EmployeeId, TypeOfWorkId, ServicePrice, ServiceDateStart, ServiceDateFinish, ServiceNotes)
 values (1, 1, 3, 3000, '2019-03-10', '2019-03-20', '��� ���������');

 insert into Service(CarId, EmployeeId, TypeOfWorkId, ServicePrice, ServiceDateStart, ServiceDateFinish, ServiceNotes)
 values (2, 2, 2, 1000, '2019-04-01', '2019-04-20', '��� ���������');

 insert into Service(CarId, EmployeeId, TypeOfWorkId, ServicePrice, ServiceDateStart, ServiceDateFinish, ServiceNotes)
 values (3, 3, 3, 3000, '2019-04-05', '2019-04-25', '��� ���������');

 insert into Service(CarId, EmployeeId, TypeOfWorkId, ServicePrice, ServiceDateStart, ServiceDateFinish, ServiceNotes)
 values (4, 4, 4, 5000, '2019-01-10', '2019-01-25', '��� ���������');

 insert into Service(CarId, EmployeeId, TypeOfWorkId, ServicePrice, ServiceDateStart, ServiceDateFinish, ServiceNotes)
 values (5, 5, 5, 10000, '2019-02-10', '2019-02-20', '��� ���������');