--2-1 ������� ��� ���������� ���:
--�	�����;
--�	��������;
--�	������.


use SQLDB;

select * from CarModel;
select * from OwnerCar;
select * from Position;



--2-2  �������� ϲ�, ����� �����������
--���������, ��� �� ���� ������� �����


SELECT DISTINCT EmplName, EmplMiddlename, EmplSurname, EmplSalary FROM Employee;


--2-3  ������� ���������� ��� ����������� (ϲ�, �����, ������������� �����������), � ���� �������� <100

SELECT EmployeeId, EmplName, EmplMiddlename, EmplSurname, EmplSalary, EmplSurcharge  
FROM Employee
WHERE EmplSurcharge < 100;

--2-4  ������� ���������� ��� �������� (ϲ�, �������, ������������� ��������, ̳���),
-- � ���� ������� ���������� �� �050� � ��� ����� �� ̳��� ���������� �� �����


SELECT OwnerCarId,OwnerName, OwnerMiddlename, OwnerSurname, OwnerBirthplace, OwnerPhoneNum  
FROM OwnerCar
WHERE OwnerPhoneNum LIKE '050%' AND OwnerBirthplace != '���';


--2-5  ������� ���������� ��� ����������� (ϲ�, �����, ������������� �����������, ̳���), �� ��������� �������� =300 � 
--���������� � �����, � ����� ����������� �� ����  ����������


SELECT EmployeeId, EmplName, EmplMiddlename, EmplSurname, EmplSalary, EmplSurcharge,EmplBirthplace  
FROM Employee
WHERE (EmplSurcharge = 300 AND EmplBirthplace = '���') OR EmplBirthplace = '�������';


--2-6  ������� ���������� ��� ����������� (ϲ�, �����, ������������� �����������, ̳���), 
--�� ��������� �������� =500 �� ���������� � ����� ��� � �������

SELECT EmployeeId, EmplName, EmplMiddlename, EmplSurname, EmplSalary, EmplSurcharge,EmplBirthplace  
FROM Employee
WHERE EmplSurcharge = 500 AND (EmplBirthplace IN ('���', '����'));

--2-7 ������� ���������� ��� �������� (ϲ�, ���� ����������, ������������� ��������), 
--� ���� ���� ���������� ������ � �����: 1989-01-01 � 1990-12-31

SELECT OwnerCarId,OwnerName, OwnerMiddlename, OwnerSurname, OwnerBirthDay  
FROM OwnerCar
WHERE OwnerBirthDay BETWEEN '1989-01-01' AND '1990-12-31';

--2-8 ������� ³������ �� ���������� � Id �������� 1 ��� 4 ��� 3 � Id ����� 1 ��� 3 ��� 5

SELECT OwnerCarId,CarModelId, CarStateNum, CarColor, CarYearOfProd,CarSpec  
FROM Car
WHERE OwnerCarId  IN(1, 4, 3) AND (CarModelId IN (1, 3, 5));


--2-9  ������� ����� ���������� ��� ��� �����������, ������� ���� ���������� �� ����

SELECT * 
FROM Employee
WHERE EmplSurname like '���%'

--2-10 ������� ����� ���������� ��� ��� ����������� 1966 ���� ����������

SELECT *  
FROM Employee
WHERE  DATEPART(YEAR, EmplBirthDay) = 1966; 

--2-11 ������� ����� ���������� ��� �����������, ��� �����  ��-������� �� �� �������� �� ������� 800

SELECT *  
FROM Employee
WHERE EmplSurcharge != 800 AND EmplMiddlename IS NOT NULL;

--2-12  ������� ����� ���������� ��� ��������, �� �� ����� ��-�������.

SELECT *  
FROM OwnerCar
WHERE  OwnerMiddlename IS NULL;


--2-13 ������� ������ ���������, ������������� �� ������� �� ���������� � �� ������� �������� �� �������.
 --��������� �� �������.

SELECT DISTINCT * 
FROM Car
ORDER BY CarColor DESC, CarStateNum DESC 

--2-14 ������� �������� ������� ���������

Select COUNT(Car.CarId)from  Car;

--2-15 ������� ������� ���� ��������.

Select COUNT (OwnerCar.OwnerName) from  OwnerCar;

--2-16 ������� ������� ��-������� ��������

Select COUNT (OwnerCar.OwnerMiddlename) from  OwnerCar;

--2-17 ������� ������� �����������, ���������, ������������, ������� ������.

Select COUNT(Employee.EmployeeId) as EmplNum,MIN(Employee.EmplSalary) as MinEmplSalary,MAX(Employee.EmplSalary) as MaxEmpSalary,
 AVG(Employee.EmplSalary) as AvgEmpSalary From Employee;

 --2-18 ������� ���������� ��� �� ������ �����������: �������� ������� ����������� �� �������,
-- �������, ����������, ������ ������� �� ������� � ����������� ���� ������� ������.


Select D.PositionName, COUNT(E.EmployeeId) as EmplNum,
 MIN(E.EmplSalary+EmplSurcharge) as MinEmplMoney,
 MAX(EmplSalary+EmplSurcharge) as MaxEmpMoney,
 AVG(EmplSalary+EmplSurcharge) as AvgEmpMoney,
 EmplPaymentDate
 FROM Employee E JOIN Position D ON E.PositionId = D.PositionId
 Group By D.PositionName, E.EmplPaymentDate

 --����� ��� ���� D/E � Select/Group By

 --2-19 ������� ������� ��������������� ������ ��������

SELECT COUNT(DISTINCT OwnerSurname) AS DistinctSurname FROM OwnerCar

--2-20 ������� ������� ���������� ���� �������� �� ����� �.

select COUNT (OwnerName) as OwnerNameK 
from OwnerCar
where OwnerName LIKE '�%'


--2-21 ������� ������� ����������� � ������� ���. ������������ ������ �� ����. 
--���� ������ ������ ���� ������, �� ���������, ��� �����  ��������������� ��������� ��� ���� ���������.


select EmplBirthplace, Count(EmployeeId) as Count_Employee
from Employee
Group By EmplBirthplace
Order By EmplBirthplace

--2-22 ������� ���������� ������ �� �����: ������� ���������, �� ������������� �� ���� ����,
--�� ������� ���� ����� �� ���� ���� ������� ��� ����.
--���� ������ � ������ ���� ������, �� ���������, ��� �����  ��������������� ��������� ��� ���� ���������. 



Select ServicePrice, Count(CarId)as Count_Car,Count(TypeOfWorkId)as Count_TypeOfWorkId 
from Service
Group By ServicePrice


--2-23 ������� ������ ���� ����� �� ������� ���������, �� �������� �5000� �� ����� ����� ����.  
--���� ������ � ������ ���� ������, �� ���������, ��� �����  ��������������� ��������� ��� ���� ���������.

Select TypeOfWork.TitleOfWork, Count(Service.CarId)as Count_Car from Service,TypeOfWork
Where ServicePrice=5000 and TypeOfWork.TypeOfWorkId=Service.TypeOfWorkId
Group By TypeOfWork.TitleOfWork


--2-24 ������� ������� ��������� ��������� � ����.
--������������ ������ �� ���.


Select ServiceDateStart as DateStart, COUNT(ServiceId)as NumberServ from Service
Group By ServiceDateStart
Order By ServiceDateStart



--2-25 ������ �������� ���� �������� � ����, � � ���� ���� ���� �������� ����� 2 �������� ����. 
--������������ ������ �� ���.


Select ServiceDateStart as StartDate, COUNT(ServiceId)as ServNum from Service
Group By ServiceDateStart
Having COUNT(ServiceId)>2
Order By ServiceDateStart

--2-26 ������� ������� ������� �� ����� ��� �����������, ���� ���������� 
--���� ��������� � �����: 1945-01-01 �� 1965-12-31

SELECT EmplBirthplace, AVG(EmplSalary+EmplSurcharge)as AvgMoney
FROM Employee 
WHERE EmplBirthDay BETWEEN '1945-01-01' AND '1965-12-31' 
Group By EmplBirthplace


--2-27 �������� ���������� ��� ������� ��-�������
SELECT COUNT (*)  AS Employee_Middlename_Total
 FROM (
     SELECT  EmplMiddlename FROM Employee
	  ) AS Employee_Middlename


--�������� ���������� ��� ������� ��������������� ��-�������
SELECT COUNT (*)  AS Employee_Middlename_DISTINCT
 FROM (
     SELECT DISTINCT EmplMiddlename FROM Employee WHERE  EmplMiddlename IS not NULL
	  ) AS Employee_Middlename


--�������� ���������� ��� ������� ��������, � ���� ������ ��-�������
SELECT COUNT (*)  AS Employee_Middlename_Null
 FROM (
     SELECT  EmplMiddlename FROM Employee WHERE  EmplMiddlename IS NULL
	  ) AS Employee_Middlename

--2-28 ������� ���������, � ����� ������� ���� ������ ����� 3000

SELECT CarId, AVG(ServicePrice) as AvgServPrice 
FROM  Service  
GROUP BY  CarId
HAVING AVG(Service.ServicePrice)>3000

--2-29  ������� ������ ������� �� �������, �� ����� >4500.

SELECT PositionId, AVG(EmplSalary+EmplSurcharge) As AvgMoney 
FROM Employee 
 GROUP BY PositionId 
 HAVING AVG(EmplSalary+EmplSurcharge)> 4500