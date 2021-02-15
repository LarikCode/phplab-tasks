--�������� IN 
--�������, �� ������� ���� �������� � ������� ��������� � ��������������� ����� ��� �������

--4-01 ��������� ������ �����������, �� ������������� ��������.
--��������� �� �������, ������������ �� ��������.



 select  
	e.EmplName+ ' ' + isnull(e.EmplMiddlename, '')+' '+e.EmplSurname as FIO_employee,
	count (s.ServiceId) as NumOfService
from Employee e     
	left join Service s on s.EmployeeId=e.EmployeeId
		
where s.ServiceId in(1,2,3,4,5,6,7,8,9)	--������ ���� ��� ������
group by e.EmplName+ ' ' + isnull(e.EmplMiddlename, '')+' '+e.EmplSurname
order by FIO_employee



--�������� IN 
--�������, �� ������� ���� �������� � ������� ��������� � ��������������� ����� ��� �������

--4-02 ��������� ������ �����������, �� �� ������������� ��������.
--��������� �� �������, ������������ �� ��������. 

 select  
	e.EmplName+ ' ' + isnull(e.EmplMiddlename, '')+' '+e.EmplSurname as FIO_employee,
	count (s.ServiceId) as NumOfService
from Employee e     
	left join Service s on s.EmployeeId=e.EmployeeId	
		
group by e.EmplName+ ' ' + isnull(e.EmplMiddlename, '')+' '+e.EmplSurname, e.EmployeeId

having count (s.ServiceId)=0 and e.EmployeeId IN(1,2,3,4,5,6,7)


order by FIO_employee


--�������� IN 
--�������, �� ������� ���� �������� � ������� ��������� � ��������������� ����� ��� �������

--4-03 ��������� ��� ������, �� ���� �� ������ �����.
-- ��������� �� �������, ������������ �� ��������.



 select  
	tw.TitleOfWork,
	count (s.ServiceId) as NumOfService
from TypeOfWork tw     
	left join Service s on s.TypeOfWorkId=tw.TypeOfWorkId	
		
group by tw.TitleOfWork, tw.TypeOfWorkId

having count (s.ServiceId)=0 and tw.TypeOfWorkId IN(1,2,3,4,5,6,7)

order by tw.TitleOfWork



--�������� IN 
--�������, �� ������� ���� �������� � ������� ��������� � ��������������� ����� ��� �������

--4-04 ��������� ������, �� ������������� ��������.
--��������� �� �������, ������������ �� ��������. (��'���� ������ �� ������ ����� �����������.)



select  
	p.PositionName,
	count (s.ServiceId) as NumOfService
from  Position p     	
	left join Employee e on p.PositionId=e.PositionId	
	left join Service s on s.EmployeeId=e.EmployeeId
where s.ServiceId in(1,2,3,4,5,6,7,8,9)	--������ ���� ��� ������	
group by  p.PositionName


order by p.PositionName


--�������� IN 
--�������, �� ������� ���� �������� � ������� ��������� � ��������������� ����� ��� �������

--4-05 ��������� ��������, ��� ���� �� ��������� �����.
--��������� �� �������, ������������ �� ��������.


select  
	cm.CarModelName, c.CarId,
	count (s.ServiceId) as NumOfService
from  Car c
	left join Service s on s.CarId=c.CarId
	left join CarModel cm on cm.CarModelId=c.CarModelId

group by  cm.CarModelName,c.CarId,s.ServiceId 
having count (s.ServiceId)=0 and c.CarId in(1,2,3,4,5,6,7)		

order by cm.CarModelName


--�������� IN 
--�������, �� ������� ���� �������� � ������� ��������� � ��������������� ����� ��� �������

--4-06 ������� ϲ� ��������, ��������� �, �� ����������� ���������, �� ������������� �� ����� 1300.
--      ��������� �� �������, ������������ �� ��������.

select  distinct
	o.OwnerName+' '+ isnull(o.OwnerMiddlename, '')+' '+o.OwnerSurname  as FIO,
	 c.CarStateNum, c.CarYearOfProd, s.ServicePrice
	
from  Car c
	left join Service s on s.CarId=c.CarId
	left join OwnerCar o on c.OwnerCarId=o.OwnerCarId

where s.ServicePrice in(1300)		

order by FIO



--�������� IN 
--�������, �� ������� ���� �������� � ������� ��������� � ��������������� ����� ��� �������

--4-07 ������ ϲ�, ������ �����������, �� ������ ����� ������.


select  
	tw.TitleOfWork,	 p.PositionName,
	e.EmplName+ ' ' + isnull(e.EmplMiddlename, '')+' '+e.EmplSurname as FIO_employee	
from Employee e 
	inner join Position p on p.PositionId = e.PositionId   	
	inner join Service s on s.EmployeeId=e.EmployeeId	
	inner join TypeOfWork tw on tw.TypeOfWorkId=s.TypeOfWorkId
where tw.TypeOfWorkId in(1)		-- ������ ������
order by FIO_employee



--����� ������� �������� � ���������� ��������� (������� � WHERE ).


--4-08 ������� ϲ�, �����, ��������, ������, ������� ��� ��� �����������,
-- ����� ���� ����� �� ������� �� ���������� �� �������� >= 750 (������� ����� ����������� � �������.)


select  	
	e.EmplName+ ' ' + isnull(e.EmplMiddlename, '')+' '+e.EmplSurname as FIO_employee,	
	p.PositionName, e.EmplSalary, e.EmplSurcharge, e.EmplPhoneNum	
from Employee e 
	inner join Position p on p.PositionId = e.PositionId   	
	inner join Service s on s.EmployeeId=e.EmployeeId
where  e.EmplSalary > (SELECT AVG(EmplSalary) FROM Employee) and e.EmplSurcharge >= 750



--����� ������� �������� � ���������� ��������� (������� � WHERE ).


--4-09 ������� ��������� �, ϲ� ��������, �� ����������� ��������� �� �� ���� ������,
-- ���� �� ���� ������ >= AVG ��� ������ �� ����������.
--ϳ������ - AVG ���� ������ �� ���������� �� ��������� ���������� �������� � ���������� WHERE ���������� ������.



select  	
	o.OwnerName+' '+ isnull(o.OwnerMiddlename, '')+' '+o.OwnerSurname  as FIO_owner,	
	c.CarStateNum, c.CarYearOfProd, s.ServicePrice	
from OwnerCar o  	  	
    inner join Car c on o.OwnerCarId =c.OwnerCarId	
	inner join Service s on s.CarId=c.CarId 
	
where  s.ServicePrice >= (SELECT AVG(ServicePrice) FROM Service) 


--ϳ������ �� ��� ���������� HAVING
--4-10 ������� ��������� � ���������, � ���� ������� ���� ������, ���� �������� �� ���� ������ �� ����������.



select  	
	o.OwnerName+' '+ isnull(o.OwnerMiddlename, '')+' '+o.OwnerSurname  as FIO_owner,	
	c.CarStateNum, c.CarYearOfProd, s.ServicePrice	
from OwnerCar o  	  	
    inner join Car c on o.OwnerCarId =c.OwnerCarId	
	inner join Service s on s.CarId=c.CarId 

group by
 	o.OwnerName+' '+ isnull(o.OwnerMiddlename, '')+' '+o.OwnerSurname,	
	c.CarStateNum, c.CarYearOfProd, s.ServicePrice	   
	     
having s.ServicePrice >= (SELECT AVG(ServicePrice) FROM Service)


--������������ ���� � 򳺿 � ������� � ���������� �� ���������� �������

--4-11 ������� ��� ��� �����������, �� ���������� � ���� � ��� �� � ����������Id=1


select * from  	Employee
where EmplBirthplace = 
(
	select EmplBirthplace 
	from Employee 
	where EmployeeId=1 
)


--������������ ���� � 򳺿 � ������� � ���������� �� ���������� �������

--4-12 ������� ��� �����������, �� �������� ������, ���� ���� �� �������� �� ����� ����� > ���������� ������.
--��������� �� �������, ������������ �� �-�.

select * from  	Employee
where EmplSalary > 
(
	select AVG (EmplSalary) 
	from Employee 
	   
) and PositionId in
(
select PositionId 
	from Employee 
	where EmplSurname like '�������'
)
order by EmplSurname

select AVG (EmplSalary) 
	from Employee 




--������������ ���� � 򳺿 � ������� � ���������� �� ���������� �������

--4-13 ������� ��� ��������, �� ����� ��� �� ���� ���������, �� � ��������.



select c.OwnerCarId, c.CarColor, oc.OwnerSurname
from  Car c, OwnerCar oc  
where c.OwnerCarId=oc.OwnerCarId 
    and CarColor 
	in  (
	select CarColor 
	from Car
	where  OwnerCarId like (
	                         select OwnerCarId 
							 from OwnerCar 
							 where OwnerSurname like '�������')	   
) 
order by OwnerCarId


--�������� �������� � �������� FROM

--4-14 ������� ������� �����, �� ����� ����� 1 �����������.

select Count(*) as NumberOfPosWithMoreThen2Emp from
(
	select count (p.PositionId) as PosIdNum
	from Position p 
		inner join Employee e on p.PositionId = e.PositionId
		group by p.PositionId
		having count (p.PositionId)>1
) as NumberOfPosWithMoreThen2Emp


--�������� �������� � �������� FROM

--4-15 ������� ������� ��������, �� ����� ��������� >1

select Count(*) as NumberOfOwnerWithMoreThen2Car 
from
(
    select count (c.CarId) as CarIdNum
	from Car c 
		inner join OwnerCar oc on c.OwnerCarId = oc.OwnerCarId
		group by c.OwnerCarId
		having count (c.CarId)>1
) as NumberOfOwnerWithMoreThen2Car




--�������� �������� � �������� FROM

--4-16 �������  -��������- ���������, �� ��������� ����� � ������ � ���� � ������ ���� ������ ����� 1 ����



select Car.OwnerCarId, OwnerCar.OwnerSurname
from Car, OwnerCar
where CarId in (
	select  s.CarId   -- ���������� Id ����, ������� ��������� ������ ����� 2 ��� �� ������ ���� �����
	from Service s 
		inner join Car ca on ca.CarId = s.CarId
		group by s.TypeOfWorkId,s.CarId
		having count (s.TypeOfWorkId)>1
) and Car.OwnerCarId = OwnerCar.OwnerCarId


--�������� �������� � �������� FROM

--4-17 ������� ��������� � ����, ������� ���� ������ ����, ����� �����, - ������� ���� ������ �����- 
--�� ����� ��������� ��� ����, ��� ������� ���� ������ ����, �� ������� ���� ������ ��� �� �����.  
  
  SELECT sub1.*, sub2.* FROM

  --����������� ������� �������� �� ������ �� ������
  (		  
	  SELECT AVG(sub.AVGservPrice) as AvgModelServ, sub.CarModelId 
	  FROM(   
		   select AVG (s.ServicePrice) as AVGservPrice, ca.CarModelId,s.CarId 
		   from Service s
			  inner join Car ca on ca.CarId = s.CarId		
		   group by s.CarId,ca.CarModelId
		  ) sub 
	  group by sub.CarModelId
  )sub1,

  --����������� ������� �������� �� ������ �� ����
  (
  select AVG (s.ServicePrice) as AVGservPrice, ca.CarModelId,s.CarId,ca.CarYearOfProd, ca.CarStateNum 
		   from Service s
			  inner join Car ca on ca.CarId = s.CarId			  
		   group by s.CarId,ca.CarModelId,ca.CarYearOfProd,ca.CarStateNum 
  )sub2

  where sub1.CarModelId=sub2.CarModelId and sub2.AVGservPrice>sub1.AvgModelServ


  --�������� �������� � �������� FROM

--4-18 ��������� ������� ���� �� ����� ���������, ��������� � ��������� �� Id ���������
-- (��������� �� ��������� ����� ������� ���� � ������ ���� ����. ��� ��������� �����
-- �������� ���� �� ����� ��� ���� ���������.
-- ϳ��� ����� ��������� ������ ������� ���� �� ���������� ���������� ��� �� ��� ����� ���� � �� � ���� ��������� ����� �� ����� ���������).

  
  SELECT sub1.*, sub2.* FROM

  --����������� ������� �������� �� ������ �� ����
  (		  
	  SELECT AVG(sub.MAXservPrice) as AvgCarServ, sub.CarId 
	  FROM(   

		   select MAX (s.ServicePrice) as MAXservPrice, s.CarId, ca.CarStateNum 
		   from Service s
			  inner join Car ca on ca.CarId = s.CarId			  
		   group by s.CarId,s.TypeOfWorkId,ca.CarStateNum 
		  ) sub 

	  group by sub.CarId
  )sub1,

  --����������� ���� ���� �� ������ �� ���� ��� ������� ���� �������
  (
  select MAX (s.ServicePrice) as MAXservPrice, s.CarId, ca.CarStateNum ,s.TypeOfWorkId
		   from Service s
			  inner join Car ca on ca.CarId = s.CarId			  
		   group by s.TypeOfWorkId, s.CarId, ca.CarStateNum 
  )sub2

  where sub1.CarId=sub2.CarId 
  order by sub2.CarId 



  --�������� �������� � �������� FROM

--4-19 ������� ��������, �� ��������� ����� ���� � ������� ��������
-- (����� �� ��������� ����� � ������� ������ �������).

  

  select CarId from Service where EmployeeId in (
  select EmployeeId from Employee where EmplSurname like '�������')


  --�������� �������� � �������� FROM

--4-20 ������� �����������, �� ������ ����� � ���� ������
-- ������� ������ �� ������� �������� ������.

  

  select sub.TypeOfWorkId, sub.TitleOfWork, s.EmployeeId, e.EmplSurname  from
  (
	  select TypeOfWorkId, TitleOfWork 
	  from TypeOfWork
	   where TitleOfWork like '����� ������' or TitleOfWork like '����� �������� ����'
   ) sub
   inner join Service s on s.TypeOfWorkId=sub.TypeOfWorkId
   inner join Employee e on s.EmployeeId=e.EmployeeId
   order by sub.TypeOfWorkId, e.EmployeeId