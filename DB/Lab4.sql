--Оператор IN 
--визначає, чи співпадає дане значення з якимось значенням в підпорядкованому запиті або переліку

--4-01 Визначити список співробітників, які обслуговували автомобілі.
--Перевірити на повтори, впорядкувати за алфавітом.



 select  
	e.EmplName+ ' ' + isnull(e.EmplMiddlename, '')+' '+e.EmplSurname as FIO_employee,
	count (s.ServiceId) as NumOfService
from Employee e     
	left join Service s on s.EmployeeId=e.EmployeeId
		
where s.ServiceId in(1,2,3,4,5,6,7,8,9)	--только если был сервис
group by e.EmplName+ ' ' + isnull(e.EmplMiddlename, '')+' '+e.EmplSurname
order by FIO_employee



--Оператор IN 
--визначає, чи співпадає дане значення з якимось значенням в підпорядкованому запиті або переліку

--4-02 Визначити список співробітників, які не обслуговували автомобілі.
--Перевірити на повтори, впорядкувати за алфавітом. 

 select  
	e.EmplName+ ' ' + isnull(e.EmplMiddlename, '')+' '+e.EmplSurname as FIO_employee,
	count (s.ServiceId) as NumOfService
from Employee e     
	left join Service s on s.EmployeeId=e.EmployeeId	
		
group by e.EmplName+ ' ' + isnull(e.EmplMiddlename, '')+' '+e.EmplSurname, e.EmployeeId

having count (s.ServiceId)=0 and e.EmployeeId IN(1,2,3,4,5,6,7)


order by FIO_employee


--Оператор IN 
--визначає, чи співпадає дане значення з якимось значенням в підпорядкованому запиті або переліку

--4-03 Визначити вид роботи, за яким не робили сервіс.
-- Перевірити на повтори, впорядкувати за алфавітом.



 select  
	tw.TitleOfWork,
	count (s.ServiceId) as NumOfService
from TypeOfWork tw     
	left join Service s on s.TypeOfWorkId=tw.TypeOfWorkId	
		
group by tw.TitleOfWork, tw.TypeOfWorkId

having count (s.ServiceId)=0 and tw.TypeOfWorkId IN(1,2,3,4,5,6,7)

order by tw.TitleOfWork



--Оператор IN 
--визначає, чи співпадає дане значення з якимось значенням в підпорядкованому запиті або переліку

--4-04 Визначити посади, які обслуговували автомобілі.
--Перевірити на повтори, впорядкувати за алфавітом. (Зв'язок посади та сервісу через Співробітника.)



select  
	p.PositionName,
	count (s.ServiceId) as NumOfService
from  Position p     	
	left join Employee e on p.PositionId=e.PositionId	
	left join Service s on s.EmployeeId=e.EmployeeId
where s.ServiceId in(1,2,3,4,5,6,7,8,9)	--только если был сервис	
group by  p.PositionName


order by p.PositionName


--Оператор IN 
--визначає, чи співпадає дане значення з якимось значенням в підпорядкованому запиті або переліку

--4-05 Визначити автомобілі, для яких не проводили сервіс.
--Перевірити на повтори, впорядкувати за алфавітом.


select  
	cm.CarModelName, c.CarId,
	count (s.ServiceId) as NumOfService
from  Car c
	left join Service s on s.CarId=c.CarId
	left join CarModel cm on cm.CarModelId=c.CarModelId

group by  cm.CarModelName,c.CarId,s.ServiceId 
having count (s.ServiceId)=0 and c.CarId in(1,2,3,4,5,6,7)		

order by cm.CarModelName


--Оператор IN 
--визначає, чи співпадає дане значення з якимось значенням в підпорядкованому запиті або переліку

--4-06 Вивести ПІБ власника, державний №, рік виробництва автомобілів, які обслуговували за ціною 1300.
--      Перевірити на повтори, впорядкувати за алфавітом.

select  distinct
	o.OwnerName+' '+ isnull(o.OwnerMiddlename, '')+' '+o.OwnerSurname  as FIO,
	 c.CarStateNum, c.CarYearOfProd, s.ServicePrice
	
from  Car c
	left join Service s on s.CarId=c.CarId
	left join OwnerCar o on c.OwnerCarId=o.OwnerCarId

where s.ServicePrice in(1300)		

order by FIO



--Оператор IN 
--визначає, чи співпадає дане значення з якимось значенням в підпорядкованому запиті або переліку

--4-07 Видати ПІБ, посаду співробітників, які робили заміну колеса.


select  
	tw.TitleOfWork,	 p.PositionName,
	e.EmplName+ ' ' + isnull(e.EmplMiddlename, '')+' '+e.EmplSurname as FIO_employee	
from Employee e 
	inner join Position p on p.PositionId = e.PositionId   	
	inner join Service s on s.EmployeeId=e.EmployeeId	
	inner join TypeOfWork tw on tw.TypeOfWorkId=s.TypeOfWorkId
where tw.TypeOfWorkId in(1)		-- замена колеса
order by FIO_employee



--Прості вкладені підзапити з оператором порівняння (підзапит в WHERE ).


--4-08 Вивести ПІБ, оклад, надбавку, посаду, телефон для всіх співробітників,
-- оклад яких більше ніж середній по автосервісу та надбавка >= 750 (Середній оклад співробітників – підзапит.)


select  	
	e.EmplName+ ' ' + isnull(e.EmplMiddlename, '')+' '+e.EmplSurname as FIO_employee,	
	p.PositionName, e.EmplSalary, e.EmplSurcharge, e.EmplPhoneNum	
from Employee e 
	inner join Position p on p.PositionId = e.PositionId   	
	inner join Service s on s.EmployeeId=e.EmployeeId
where  e.EmplSalary > (SELECT AVG(EmplSalary) FROM Employee) and e.EmplSurcharge >= 750



--Прості вкладені підзапити з оператором порівняння (підзапит в WHERE ).


--4-09 Вивести державний №, ПІБ власника, рік виробництва автомобілів та їх ціну сервісу,
-- якщо їх ціна сервісу >= AVG ціні сервісу по автосервісу.
--Підзапит - AVG ціну сервісу по автосервісу та підставляє вирахуване значення в пропозицію WHERE зовнішнього запита.



select  	
	o.OwnerName+' '+ isnull(o.OwnerMiddlename, '')+' '+o.OwnerSurname  as FIO_owner,	
	c.CarStateNum, c.CarYearOfProd, s.ServicePrice	
from OwnerCar o  	  	
    inner join Car c on o.OwnerCarId =c.OwnerCarId	
	inner join Service s on s.CarId=c.CarId 
	
where  s.ServicePrice >= (SELECT AVG(ServicePrice) FROM Service) 


--Підзапит на рівні пропозиції HAVING
--4-10 Вивести державний № автомобілів, у яких середня ціна сервісу, вище середньої по ціни сервісу по автосервісу.



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


--Використання однієї і тієї ж таблиці в зовнішньому та вкладеному підзапиті

--4-11 Вивести дані про співробітників, які народились в тому ж місті що й СпівробітникId=1


select * from  	Employee
where EmplBirthplace = 
(
	select EmplBirthplace 
	from Employee 
	where EmployeeId=1 
)


--Використання однієї і тієї ж таблиці в зовнішньому та вкладеному підзапиті

--4-12 Вивести всіх співробітників, які займають посаду, таку саму як «Сидоров» та мають оклад > середнього окладу.
--Перевірити на повтори, впорядкувати від Я-А.

select * from  	Employee
where EmplSalary > 
(
	select AVG (EmplSalary) 
	from Employee 
	   
) and PositionId in
(
select PositionId 
	from Employee 
	where EmplSurname like 'Сидоров'
)
order by EmplSurname

select AVG (EmplSalary) 
	from Employee 




--Використання однієї і тієї ж таблиці в зовнішньому та вкладеному підзапиті

--4-13 Вивести всіх власників, які мають той же колір автомобілю, що і «Сидоров».



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
							 where OwnerSurname like 'Сидоров')	   
) 
order by OwnerCarId


--Вкладенні підзапити в операторі FROM

--4-14 Вивести кількість посад, які займає більше 1 співробітників.

select Count(*) as NumberOfPosWithMoreThen2Emp from
(
	select count (p.PositionId) as PosIdNum
	from Position p 
		inner join Employee e on p.PositionId = e.PositionId
		group by p.PositionId
		having count (p.PositionId)>1
) as NumberOfPosWithMoreThen2Emp


--Вкладенні підзапити в операторі FROM

--4-15 Вивести кількість власників, які мають автомобілів >1

select Count(*) as NumberOfOwnerWithMoreThen2Car 
from
(
    select count (c.CarId) as CarIdNum
	from Car c 
		inner join OwnerCar oc on c.OwnerCarId = oc.OwnerCarId
		group by c.OwnerCarId
		having count (c.CarId)>1
) as NumberOfOwnerWithMoreThen2Car




--Вкладенні підзапити в операторі FROM

--4-16 Вивести  -власника- автомобілів, які проходили сервіс з одного і того ж самого виду роботи більше 1 разу



select Car.OwnerCarId, OwnerCar.OwnerSurname
from Car, OwnerCar
where CarId in (
	select  s.CarId   -- нахождение Id авто, которое проходило сервис более 2 раз по одному типу работ
	from Service s 
		inner join Car ca on ca.CarId = s.CarId
		group by s.TypeOfWorkId,s.CarId
		having count (s.TypeOfWorkId)>1
) and Car.OwnerCarId = OwnerCar.OwnerCarId


--Вкладенні підзапити в операторі FROM

--4-17 Вивести державний № авто, середню ціну сервісу авто, назву марки, - середню ціну сервісу марки- 
--та країну виробника для авто, чия середня ціна сервісу вище, ніж середня ціну сервісу для їх марки.  
  
  SELECT sub1.*, sub2.* FROM

  --нахожднение средних расходов на сервис по модели
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

  --нахожднение средних расходов на сервис по авто
  (
  select AVG (s.ServicePrice) as AVGservPrice, ca.CarModelId,s.CarId,ca.CarYearOfProd, ca.CarStateNum 
		   from Service s
			  inner join Car ca on ca.CarId = s.CarId			  
		   group by s.CarId,ca.CarModelId,ca.CarYearOfProd,ca.CarStateNum 
  )sub2

  where sub1.CarModelId=sub2.CarModelId and sub2.AVGservPrice>sub1.AvgModelServ


  --Вкладенні підзапити в операторі FROM

--4-18 Визначити середню ціну за сервіс автомобілю, державний № автомобілю та Id автомобілю
-- (Автомобіль міг проходити сервіс декілька разів з одного виду робіт. Тож необхідно брати
-- найбільшу ціну за кожен вид робіт автомобіля.
-- Після цього необхідно знайти середню ціну від отриманого результату вже по всіх видах робіт – це і буде середньою ціною за сервіс автомобілю).

  
  SELECT sub1.*, sub2.* FROM

  --нахожднение средних расходов на сервис по авто
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

  --нахожднение макс цены на сервис по авто для каждого вида сервиса
  (
  select MAX (s.ServicePrice) as MAXservPrice, s.CarId, ca.CarStateNum ,s.TypeOfWorkId
		   from Service s
			  inner join Car ca on ca.CarId = s.CarId			  
		   group by s.TypeOfWorkId, s.CarId, ca.CarStateNum 
  )sub2

  where sub1.CarId=sub2.CarId 
  order by sub2.CarId 



  --Вкладенні підзапити в операторі FROM

--4-19 Вивести автомобілі, які проходили сервіс лише у майстра «Сидоров»
-- (тобто не проходили сервіс у жодного іншого майстра).

  

  select CarId from Service where EmployeeId in (
  select EmployeeId from Employee where EmplSurname like 'Сидоров')


  --Вкладенні підзапити в операторі FROM

--4-20 Вивести співробітників, які робили сервіс з виду роботи
-- «Замена колеса» ТА «Замена лобового стекла».

  

  select sub.TypeOfWorkId, sub.TitleOfWork, s.EmployeeId, e.EmplSurname  from
  (
	  select TypeOfWorkId, TitleOfWork 
	  from TypeOfWork
	   where TitleOfWork like 'Заміна колеса' or TitleOfWork like 'Заміна лобового скла'
   ) sub
   inner join Service s on s.TypeOfWorkId=sub.TypeOfWorkId
   inner join Employee e on s.EmployeeId=e.EmployeeId
   order by sub.TypeOfWorkId, e.EmployeeId