--3-1 ������� ��� ���������� �� ����� ������ ��������� - ������ 

SELECT * FROM TypeOfWork
where TitleOfWork = '��������'

--3-2 ������� ��� ���������� �� �������: ��������	- ������

SELECT * FROM Position
where PositionName like '%������%'

--3-3 ������� ϲ� ����������� -	�������� (��� ���������� ��������)

SELECT DISTINCT
	EmplName,
	EmplMiddlename,
	EmplSurname
FROM [Employee]
order by 
	EmplName,
	EmplMiddlename,
	EmplSurname

--3-4	������� ��������� �, �� ����������� ��������� �� ������������� �������� ����� �� ��������.
-- ������������ ��������� ���������	- �������� (��� ����������)

SELECT DISTINCT OwnerCarId, CarStateNum, CarYearOfProd	
FROM Car 
order by OwnerCarId

--3-5 ������� ��� ������� ������, ��� ���� ���� ��� ������� ���������� �� ������, �� ������ -	
 -- ������� ������� (������ ������ �� ������ ������� ����������� � ������ ������� ������ �������)
SELECT 
	Employee.EmplName, 
	Position.PositionName 
FROM Employee 
	CROSS JOIN Position

--3-6  ������� ��� ������� ������, ��� ���� ���� ��� ������� ��������� �� �������, 
--�� ������	������� ������� (������ ������ �� ������ ������� ����������� � ������ ������� ������ �������)

SELECT 
	Car.CarId,
	OwnerCar.OwnerName 
FROM Car 
	CROSS JOIN OwnerCar

--3-6.1 ������� ��� ������� ������, ��� ���� ���� ��� ������� ��������� �� �������, �� ������
--� ������������� ��������� 

SELECT 
	Car.CarId as CarId,
	OwnerCar.OwnerName as OwnerName
FROM Car 
	CROSS JOIN OwnerCar


--3-07 �ᒺ������ �� ������.
--������� ϲ� ����������� �� ����� �����:
-- -������� ��������� 璺������ (������ ����� ���������� 璺������), ��� �����������;

SELECT (Employee.EmplName+' '+isnull(Employee.EmplMiddlename, '')+' '+Employee.EmplSurname +' - '+ Position.PositionName) as EmplName_Pos1
FROM  Employee, Position
where Employee.PositionId=Position.PositionId

-- -������� ��������� � ������������� ���������;
SELECT (e.EmplName+' '+isnull(e.EmplMiddlename, '')+' '+e.EmplSurname +' - '+ p.PositionName) as EmplName_Pos2
FROM  Employee e, Position p
where e.PositionId=p.PositionId

-- -����� ��������� 璺������ (SQL ANSI:1992 ��������� 璺������);
SELECT   (Employee.EmplName+' '+isnull(Employee.EmplMiddlename, '')+' '+Employee.EmplSurname +' - '+ Position.PositionName) as EmplName_Pos3
FROM Employee  
	 join  Position on Employee.PositionId=Position.PositionId
order by EmplName_Pos3

-- -����� ��������� � ������������� ���������.
SELECT   (e.EmplName+' '+isnull(e.EmplMiddlename, '')+' '+e.EmplSurname +' - '+ p.PositionName) as EmplName_Pos4
FROM Employee as e 
	 join  Position as p on e.PositionId=p.PositionId
order by EmplName_Pos4


--3-08--������� �� ϲ� ��������, �� ����� �������� ����� �������:
--������� ��������� 璺������ (������ ����� ���������� 璺������);
SELECT (OwnerCar.OwnerName+' '+isnull(OwnerCar.OwnerMiddlename, '')+' '+OwnerCar.OwnerSurname +' �� ���� �������: '+ Car.CarColor) as OwnerName_CarColor1
FROM  OwnerCar, Car
where OwnerCar.OwnerCarId=Car.OwnerCarId
 and Car.CarColor like '�����'

--������� ��������� � ������������� ���������;
SELECT (o.OwnerName+' '+isnull(o.OwnerMiddlename, '')+' '+o.OwnerSurname +' �� ���� �������: '+ c.CarColor) as OwnerName_CarColor2
FROM  OwnerCar o, Car c
where o.OwnerCarId=c.OwnerCarId
 and c.CarColor like '�����'

--����� ��������� 璺������ (SQL ANSI:1992 ��������� 璺������);
SELECT (OwnerCar.OwnerName+' '+isnull(OwnerCar.OwnerMiddlename, '')+' '+OwnerCar.OwnerSurname +' �� ���� �������: '+ Car.CarColor) as OwnerName_CarColor3
FROM  OwnerCar 
  join Car on OwnerCar.OwnerCarId=Car.OwnerCarId
 and Car.CarColor like '�����'

--����� ��������� � ������������� ���������.
SELECT (o.OwnerName+' '+isnull(o.OwnerMiddlename, '')+' '+o.OwnerSurname +' �� ���� �������: '+ c.CarColor) as OwnerName_CarColor4
FROM  OwnerCar as o
  join Car as c on o.OwnerCarId=c.OwnerCarId
 and c.CarColor like '�����'


  --3-09-- ������� JOIN � ���������� FROM --������� 璺������
 --Inner join -- ��������� ������ ��� �����, ��� ������� ���������� ������������ ������� ������� ������� � ��������������.

--3-10 ������� ϲ�, ��������� � ���������, � ���������� ����������, ������� ��� ��������,
-- �� ����� ��������� ������� ��� �������� ���  ������. ��������� �� �������� 

select 
	o.OwnerName+' '+ isnull(o.OwnerMiddlename, '')+' '+o.OwnerSurname  as FIO,
	c.CarColor, c.CarStateNum, o.OwnerDriverlicNum, o.OwnerPhoneNum
from Car c 
	inner join OwnerCar o on c.OwnerCarId=o.OwnerCarId
where c.CarColor like '����' 
	or c.CarColor like '�������'
order by FIO 



  --������� JOIN � ���������� FROM --������� 璺������
 --Inner join -- ��������� ������ ��� �����, ��� ������� ���������� ������������ ������� ������� ������� � ��������������.

--3-10--������� ϲ�, ����� ������, ���� ����������, ���� ���������� ��� �����������, 
--�� ��������� �������� � ������� 620-800 ���. �� �� �� ��������� �������� 
--��������� �� �������� �� ���������

select 
	e.EmplName+ ' ' + isnull(e.EmplMiddlename, '')+' '+e.EmplSurname as FIO,
	p.PositionName, e.EmplBirthplace, e.EmplBirthDay, e.EmplSalary,
	isnull(e.EmplSurcharge, 0) as  EmplSurcharge	
from Employee e 
	inner join Position p on e.PositionId =p.PositionId
where EmplSurcharge between '620' and '800' 
	  or e.EmplSurcharge is null
order by FIO, EmplSurcharge


--������� JOIN � ���������� FROM --������� 璺������
 --Inner join -- ��������� ������ ��� �����, ��� ������� ���������� ������������ ������� ������� ������� � ��������������.

--3-11 ������� ϲ� ��������, ��������� � ���������, ����� ���������, ��� ������ �� ���� �� ������ � �����.
-- ��������� �� ��������

select 
	o.OwnerName+' '+ isnull(o.OwnerMiddlename, '')+' '+o.OwnerSurname  as FIO,
	 cm.CarModelName, c.CarStateNum, tw.TitleOfWork, s.ServicePrice
from OwnerCar o 
    inner join Car c on o.OwnerCarId =c.OwnerCarId	
	inner join Service s on s.CarId=c.CarId
	inner join CarModel cm on cm.CarModelId =c.CarModelId
	inner join TypeOfWork tw on tw.TypeOfWorkId=s.TypeOfWorkId
	order by FIO


--������� JOIN � ���������� FROM --������� 璺������
 --Inner join -- ��������� ������ ��� �����, ��� ������� ���������� ������������ ������� ������� ������� � ��������������.

--3-12 ������� ϲ� ��������, ��������� � ���������, ���� ��������� � ����� � ����� 
--����� 3400 � ����� � 2019-01-01 �� 2019-04-01

select 
o.OwnerName+' '+ isnull(o.OwnerMiddlename, '')+' '+o.OwnerSurname  as FIO,
c.CarStateNum, s.ServiceDateStart, s.ServicePrice

from OwnerCar o 
    inner join Car c on o.OwnerCarId =c.OwnerCarId	
	inner join Service s on s.CarId=c.CarId

where s.ServicePrice>3400  
	  and s.ServiceDateStart between '2019-01-01' and '2019-04-01'
order by FIO 



--������� JOIN � ���������� FROM --������� 璺������
 --Inner join -- ��������� ������ ��� �����, ��� ������� ���������� ������������ ������� ������� ������� � ��������������.

--3-13 ������� ϲ� ��������, ��������� � ���������, ����� ���������, 
--�� �� �������� � ������� �� �ͳ�������. ��������� �� ��������

select 
o.OwnerName+' '+ isnull(o.OwnerMiddlename, '')+' '+o.OwnerSurname  as FIO,
cm.CarModelName, c.CarStateNum, cm.CarCountryProd
from OwnerCar o 
	inner join Car c on o.OwnerCarId =c.OwnerCarId		
	inner join CarModel cm on cm.CarModelId =c.CarModelId
where cm.CarCountryProd not in ('�����','ͳ�������')
order by FIO



--������� JOIN � ���������� FROM --������� 璺������
 --Inner join -- ��������� ������ ��� �����, ��� ������� ���������� ������������ ������� ������� ������� � ��������������.

--������� ϲ� ��������, ����� ���������, ��� ������ �� ϲ�, ����� ������ �����������,
-- �� ��������� �����. ��������� �� ������

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



--������� JOIN � ���������� FROM --������� 璺������
 --Inner join -- ��������� ������ ��� �����, ��� ������� ���������� ������������ ������� ������� ������� � ��������������.

--3-15 ������� ������� ��������� ����� (����� �����)


select 
	cm.CarModelName,
	count (cm.CarModelId) as 'NumOfCarSuchModel'
from Car c 
inner join CarModel cm on c.CarModelId = cm.CarModelId
group by cm.CarModelName


--������� JOIN � ���������� FROM --������� 璺������
 --Inner join -- ��������� ������ ��� �����, ��� ������� ���������� ������������ ������� ������� ������� � ��������������.

 --3-16 ������� ������� ��������� ����� (����� �����), ���� ������ ���� 900.

select 
	cm.CarModelName,
	count (cm.CarModelId) as 'NumCarModelWithServis900'
from Car c 
inner join CarModel cm on c.CarModelId = cm.CarModelId
inner join Service s on c.CarId = s.CarId

group by cm.CarModelName, s.ServicePrice
having s.ServicePrice=900



--������� JOIN � ���������� FROM --������� 璺������
 --Inner join -- ��������� ������ ��� �����, ��� ������� ���������� ������������ ������� ������� ������� � ��������������.

 --3-17 ������� ��� ��������, �� ����� � � ���������� ���������� ����� �300�: ϲ� ��������, 
 --����� ���������, ϲ�, ����� ������ �����������, �� ��������� ����� �� ������� ���������� ���� ����

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

--������� JOIN � ���������� FROM --������� 璺������
 --Inner join -- ��������� ������ ��� �����, ��� ������� ���������� ������������ ������� ������� ������� � ��������������.

--3-18 ������� ������ ����  ���������, �� ���� ������� � ����� � 01 �� 07 �����:
-- ����� ���� ������, ϲ� �����������, ����. ³���������� �� ����� ������, ��������


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


--������ 璺������ ( left join- �� ������� ������� ����� ������� ��� ������, ���� ���� � �������������� ������� ��� ����������
--Right join ���������� ��� ������ ��������������� ������ ����� �������, ���� ���� ��� �� ����� ������������ � ������� (�����) �������

--3-19 ������� �� ����� ��������� �� �� ���������� � ���� ��������� ���� �����,
-- ��� �������� ��������� ���� ����� �� � ����������� ������


select  
	CarModel.CarModelName, isnull(Car.CarColor, '') as CarColor

from Car Car    
	 left join CarModel CarModel  on CarModel.CarModelId = Car.CarModelId
	
order by CarModel.CarModelName


--������ 璺������ ( left join- �� ������� ������� ����� ������� ��� ������, ���� ���� � �������������� ������� ��� ����������
--Right join ���������� ��� ������ ��������������� ������ ����� �������, ���� ���� ��� �� ����� ������������ � ������� (�����) �������


--3-20 ������� �� ������ �� ϲ� �����������, �� �� �������� (���� ��� �������).

select 
	p.PositionName, 
	isnull(e.EmplName+ ' ' + isnull(e.EmplMiddlename, '')+' '+e.EmplSurname, '') as FIO	
from Position p  
	left join Employee e on e.PositionId =p.PositionId
order by p.PositionName,FIO
