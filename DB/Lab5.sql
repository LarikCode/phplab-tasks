--�������� �� ��������� UNION, EXCEPT, INTERSECT
-- UNION - ����������� �������� SELECT(������ SELECT ������ UNION ������ ����� ���������� ����� �������� � ����)


--5.1-1 �������� �Ѳ ϲ�, ���� ����������, ���� ���������� ��� �������� ��������� �� �����������.

select EmplName+' '+isnull(EmplMiddlename, '')+' '+EmplSurname  as FIO,
       EmplBirthplace as Birthplace, EmplBirthDay as BirthDay
from Employee

union all   

select OwnerName+' '+ isnull(OwnerMiddlename, '')+' '+OwnerSurname  as FIO,
        OwnerBirthplace as Birthplace, OwnerBirthDay as BirthDay
     
from OwnerCar

--�������� �� ��������� UNION, EXCEPT, INTERSECT
-- UNION - ����������� �������� SELECT(������ SELECT ������ UNION ������ ����� ���������� ����� �������� � ����)


--5.1-2 �������� ϲ�, ���� ����������, ���� ���������� ��� �������� ��������� �� �����������, ���������� ��������.

select EmplName+' '+isnull(EmplMiddlename, '')+' '+EmplSurname  as FIO,
       EmplBirthplace as Birthplace, EmplBirthDay as BirthDay
from Employee

union    

select OwnerName+' '+ isnull(OwnerMiddlename, '')+' '+OwnerSurname  as FIO,
        OwnerBirthplace as Birthplace, OwnerBirthDay as BirthDay
     
from OwnerCar

--�������� �� ��������� UNION, EXCEPT, INTERSECT
-- UNION - ����������� �������� SELECT(������ SELECT ������ UNION ������ ����� ���������� ����� �������� � ����)


--5.1-3 �������� �� ����, � ���� ������������� �����������, ��� �� ������������� �������� ���������.

select EmplBirthplace as Birthplace
 from Employee

except 

select OwnerBirthplace as Birthplace
 from OwnerCar

 --�������� �� ��������� UNION, EXCEPT, INTERSECT
-- UNION - ����������� �������� SELECT(������ SELECT ������ UNION ������ ����� ���������� ����� �������� � ����)


--5.1-4 �������� �� ��� ����, � ���� ������������� � �������� ��������� � �����������.

select EmplBirthplace as Birthplace
 from Employee

INTERSECT 

select OwnerBirthplace as Birthplace
 from OwnerCar

 

--5.1-5 ������� �����������, �� ������ ����� ��� ��������� ������� ������ �� ��������.
--��� �������� ��������.

select ca.CarColor, se.EmployeeId
from Car ca
 inner join Service se on  ca.CarId=se.CarId 
 where ca.CarColor in ('����', '�������')
 group by se.EmployeeId, ca.CarColor

 --��������� ����� �� ������� INSERT
--5_2-1

--1 �������� �� zkMyCopy_����������_������ (����� zkMyCopy)

create database zkMyCopy_carserv; 

--1.2 �������� ������� � �� zkMyCopy :
--���������CopyA � ��������� ��������� -���������-

create table TypeOfWorkCopyA
(
	TypeOfWorkId int identity(1,1) not null PRIMARY KEY,
	TitleOfWork varchar(250) not null,
	DescriptOfWork varchar(1000) not null			  
);

----���������CopyB � ������ ��������� ����: ������������ 

create table TypeOfWorkCopyB
(
	TypeOfWorkId int identity(1,1) not null PRIMARY KEY,
	TitleOfWork varchar(250) not null,
	DescriptOfWork varchar(1000) not null,
	Abbreviation varchar(250)  null				  
);

--���������CopyC � ��������� ��������� -���������-
create table TypeOfWorkCopyC
(
	TypeOfWorkId int identity(1,1) not null PRIMARY KEY,
	TitleOfWork varchar(250) not null,
	DescriptOfWork varchar(1000) not null			  
);

--1.3. �������� ��� � ��������� � ������� ������� ���������CopyA �� ���������CopyB.

--SET IDENTITY_INSERT TypeOfWorkCopyA OFF; 
--SET IDENTITY_INSERT TypeOfWorkCopyB ON; 

INSERT INTO TypeOfWorkCopyA (TypeOfWorkId, TitleOfWork, DescriptOfWork)
SELECT TypeOfWorkId, TitleOfWork, DescriptOfWork
FROM SQLDB.dbo.TypeOfWork


INSERT INTO TypeOfWorkCopyB (TypeOfWorkId, TitleOfWork, DescriptOfWork)
SELECT TypeOfWorkId, TitleOfWork, DescriptOfWork
FROM SQLDB.dbo.TypeOfWork


--2.1 �� ������� ��������� �������� ��� � ������� ���������CopyC ����� ��� ������,
-- � ���� ���������Id>5


SET IDENTITY_INSERT TypeOfWorkCopyC ON; 


INSERT INTO TypeOfWorkCopyC (TypeOfWorkId, TitleOfWork, DescriptOfWork)
SELECT TypeOfWorkId, TitleOfWork, DescriptOfWork
FROM SQLDB.dbo.TypeOfWork
where TypeOfWorkId>5

----5_2-3 
--�������� ������� � �� zkMyCopy:
--�����Copy � ��������� ��������� �����

create table CarModelCopy
(
	CarModelId int identity(1,1) not null PRIMARY KEY,
	CarModelName varchar(50) not null,
	CarCountryProd varchar(50) not null,
	CarDescript varchar(1000) not null	  
);

--3.2. ��������� � ����� ���, � ���� Id>3 �� <5 � �����Copy 

SET IDENTITY_INSERT CarModelCopy ON; 


INSERT INTO CarModelCopy (CarModelId, CarModelName, CarCountryProd,CarDescript)
SELECT CarModelId, CarModelName, CarCountryProd,CarDescript
FROM SQLDB.dbo.CarModel
where CarModelId>3 and CarModelId<5


--��������� ����� � ������� UPDATE

--5_2-6 � ������� �������� ��� �������� ��������:  ����� ������ �� ���1233�»

    UPDATE OwnerCar 
    SET OwnerDriverlicNum = '��1233��' 
    WHERE OwnerSurname = '�������'

--��������� ����� � ������� UPDATE

--5_2-7 � ������� �������� ��� �������� � ���������������� �� 7 �� 8 ������ ���� �� ������

    UPDATE OwnerCar 
    SET OwnerBirthplace = '�����' 
    WHERE OwnerCarId in(7,8)

--��������� ����� � ������� UPDATE
--5_2-8 �������� ����� ��� ����� ������ �� ������������ �� 25%

    UPDATE Employee 
    SET EmplSalary =  EmplSalary*1.25
    WHERE PositionId in 
		(
		select PositionId 
		from Position 
		where PositionName in('������', '������������')
		)

--��������� ����� � ������� UPDATE
--5_2-9 �������� ��������� ����� �� 0,7 (ϳ������ ��� min ������)

    UPDATE Employee 
    SET EmplSalary =  EmplSalary*1.7
    WHERE EmployeeId in 
		(
		select EmployeeId  
		from Employee 	
		where EmplSalary = (select min(EmplSalary) from Employee)
		)


--��������� ����� � ������� UPDATE

-- 5_2-10 �������� ������������ ����� � 2 ����

 UPDATE Employee 
    SET EmplSalary =  EmplSalary*2
    WHERE EmployeeId in 
		(
		select EmployeeId  
		from Employee 	
		where EmplSalary = (select max(EmplSalary) from Employee)
		)

--UPDATE

--5_2-11 1. �������� �������� ������ � ������� ���������.

ALTER TABLE Car ADD Model varchar(50)  null


--UPDATE
--5_2-11_2

--2. ��� ��� ����� ������ ������ � �X3�.
UPDATE Car 
    SET Model =  'X�'

--UPDATE

--5_2-11_3
--3. ��� ����� ��������� �FIAT Albea� ������ ������ �� �Q50�.

 UPDATE Car 
    SET Model =  'Q50'
    WHERE CarModelId in 
		(
		select CarModelId  
		from CarModel 	
		where CarModelName = 'FIAT Albea'
		)

--��������� ����� �� �������

--5_2-12 �������� ������ � ������� ������, � ���� ���������Id>13 �� � ����  ���������Id<14.


DELETE	FROM
   Service
	WHERE CarId in (13,14)


--��������� ����� �� �������

--5_2-13 �������� � ������� ������ ������ ��� "�����" ��������.


DELETE	FROM
   Service
	WHERE CarId in (select CarId from Car where CarColor like '���')

--��������� ����� �� �������

--5_2-14 �������� � ������� ����������� �������� ���������Id>16 �� <18.


DELETE	FROM
   Car
	WHERE CarId in (16,17,18)