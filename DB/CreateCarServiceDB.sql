DROP DATABASE IF EXISTS CarService;
CREATE DATABASE CarService;
USE CarService;

CREATE TABLE Positions
(
    PositionId       int            NOT NULL AUTO_INCREMENT,
    PositionName     nvarchar(50)   NOT NULL,
    PositionDescript nvarchar(1000) NOT NULL,
    PRIMARY KEY (PositionId)
);

CREATE TABLE CarModels
(
    CarModelId     int            NOT NULL AUTO_INCREMENT,
    CarModelName   nvarchar(50)   NOT NULL,
    CarCountryProd nvarchar(50)   NOT NULL,
    CarDescript    nvarchar(1000) NOT NULL,
    PRIMARY KEY (CarModelId)
);

CREATE TABLE TypeOfWorks
(
    TypeOfWorkId   int            NOT NULL AUTO_INCREMENT,
    TitleOfWork    nvarchar(250)  NOT NULL,
    DescriptOfWork nvarchar(1000) NOT NULL,
    PRIMARY KEY (TypeOfWorkId)
);

CREATE TABLE OwnerCars
(
    OwnerCarId        int          NOT NULL AUTO_INCREMENT,
    OwnerName         nvarchar(50) NOT NULL,
    OwnerMiddlename   nvarchar(50) NULL,
    OwnerSurname      nvarchar(50) NOT NULL,
    OwnerBirthDay     date         NOT NULL,
    OwnerBirthplace   nvarchar(50) NULL,
    OwnerDriverlicNum nvarchar(50) NOT NULL,
    OwnerPhoneNum     nvarchar(22) NULL,
    PRIMARY KEY (OwnerCarId)
);

CREATE TABLE Cars
(
    CarId         int            NOT NULL AUTO_INCREMENT,
    OwnerCarId    int            NOT NULL,
    CarModelId    int            NOT NULL,
    CarStateNum   nvarchar(50)   NOT NULL,
    CarColor      nvarchar(50)   NOT NULL,
    CarYearOfProd int            NOT NULL,
    CarSpec       nvarchar(1000) NOT NULL,
    PRIMARY KEY (CarId),
    FOREIGN KEY (OwnerCarId) REFERENCES OwnerCars (OwnerCarId),
    FOREIGN KEY (CarModelId) REFERENCES CarModels (CarModelId)
);

CREATE TABLE Employees
(
    EmployeeId      int            NOT NULL AUTO_INCREMENT,
    PositionId      int            NOT NULL,
    EmplName        nvarchar(50)   NOT NULL,
    EmplMiddlename  nvarchar(50)   NULL,
    EmplSurname     nvarchar(50)   NOT NULL,
    EmplBirthDay    date           NOT NULL,
    EmplBirthplace  nvarchar(50)   NULL,
    EmplSalary      decimal(19, 4) NOT NULL,
    EmplSurcharge   decimal(19, 4) NULL,
    EmplPaymentDate date           NOT NULL,
    EmplPhoneNum    nvarchar(22)   NULL,
    PRIMARY KEY (EmployeeId),
    FOREIGN KEY (PositionId) REFERENCES Positions (PositionId)
);

CREATE TABLE Services
(
    ServiceId         int            NOT NULL AUTO_INCREMENT,
    CarId             int            NOT NULL,
    EmployeeId        int            NOT NULL,
    TypeOfWorkId      int            NOT NULL,
    ServicePrice      decimal(19, 4) NOT NULL,
    ServiceDateStart  date           NOT NULL,
    ServiceDateFinish date           NULL,
    ServiceNotes      nvarchar(1000) NULL,
    PRIMARY KEY (ServiceId),
    FOREIGN KEY (CarId) REFERENCES Cars (CarId),
    FOREIGN KEY (EmployeeId) REFERENCES Employees (EmployeeId),
    FOREIGN KEY (TypeOfWorkId) REFERENCES TypeOfWorks (TypeOfWorkId)
);

/* Add TypeOfWorks */

USE CarService;

INSERT INTO TypeOfWorks(TitleOfWork, DescriptOfWork)
VALUES ('Заміна колеса', 'Провели заміну лівого заднього колеса');

INSERT INTO TypeOfWorks(TitleOfWork, DescriptOfWork)
VALUES ('Заміна лобового скла', 'Провели заміну  заднього скла');

INSERT INTO TypeOfWorks(TitleOfWork, DescriptOfWork)
VALUES ('Заміна шарніру', 'Провели заміну лівого заднього шарніру');

INSERT INTO TypeOfWorks(TitleOfWork, DescriptOfWork)
VALUES ('Заміна колеса', 'Провели заміну правого заднього колеса');

INSERT INTO TypeOfWorks(TitleOfWork, DescriptOfWork)
VALUES ('Заміна лобового скла', 'Провели заміну  переднього скла');

/* Add Positions */

USE CarService;

INSERT INTO Positions(PositionName, PositionDescript)
VALUES ('Механік', 'Займається ремонтом авто');

INSERT INTO Positions(PositionName, PositionDescript)
VALUES ('Зварювальник', 'Займається зварюванням та відновленням корпусу авто');


INSERT INTO Positions(PositionName, PositionDescript)
VALUES ('Діагност підвіски', 'Займається діагностикою підвіски');


INSERT INTO Positions(PositionName, PositionDescript)
VALUES ('Діагност двигуна', 'Займається діагностикою двигуна');

INSERT INTO Positions(PositionName, PositionDescript)
VALUES ('Стажер механік', 'Займається ремонтом двигуна');

/* Add CarModels */

USE CarService;

INSERT INTO CarModels(CarModelName, CarCountryProd, CarDescript)
VALUES ('BMW-128', 'Німеччина', 'Б/У');

INSERT INTO CarModels(CarModelName, CarCountryProd, CarDescript)
VALUES ('AUDI-100', 'Німеччина', 'Б/У');

INSERT INTO CarModels(CarModelName, CarCountryProd, CarDescript)
VALUES ('AUDI-A1', 'Німеччина', 'Б/У');

INSERT INTO CarModels(CarModelName, CarCountryProd, CarDescript)
VALUES ('FIAT Albea', 'Італія', 'Б/У');

INSERT INTO CarModels(CarModelName, CarCountryProd, CarDescript)
VALUES ('Honda Accord', 'Японія', 'Б/У');

/* Add OwnerCars */

USE CarService;

INSERT INTO OwnerCars(OwnerName, OwnerMiddlename, OwnerSurname, OwnerBirthDay, OwnerBirthplace, OwnerDriverlicNum,
                      OwnerPhoneNum)
VALUES ('Микола', 'Миколайович', 'Мозговий', '1989-11-20', 'Львiв', 'KG4564564', '0957452234');

INSERT INTO OwnerCars(OwnerName, OwnerMiddlename, OwnerSurname, OwnerBirthDay, OwnerBirthplace, OwnerDriverlicNum,
                      OwnerPhoneNum)
VALUES ('Петро', 'Петрович', 'Мазепа', '1990-10-30', 'Київ', 'BF1234556', '0507445234');

INSERT INTO OwnerCars(OwnerName, OwnerMiddlename, OwnerSurname, OwnerBirthDay, OwnerBirthplace, OwnerDriverlicNum,
                      OwnerPhoneNum)
VALUES ('Микола', 'Сергійович', 'Миколан', '1966-11-10', 'Суми', 'DF1454564', '0997654234');

INSERT INTO OwnerCars(OwnerName, OwnerMiddlename, OwnerSurname, OwnerBirthDay, OwnerBirthplace, OwnerDriverlicNum,
                      OwnerPhoneNum)
VALUES ('Сидор', 'Петрович', 'Ванов', '1990-03-11', 'Черкаси', 'FG1237864', '0987561234');

INSERT INTO OwnerCars(OwnerName, OwnerSurname, OwnerBirthDay, OwnerBirthplace, OwnerDriverlicNum, OwnerPhoneNum)
VALUES ('Сергій', 'Лановий', '1985-06-11', 'Черкаси', 'FG1237456', '0987881234');

/* Add Cars */

INSERT INTO Cars(OwnerCarId, CarModelId, CarStateNum, CarColor, CarYearOfProd, CarSpec)
VALUES (1, 1, 'HGF-665687', 'Красний', 2011, 'Дизель, Автомат');
INSERT INTO Cars(OwnerCarId, CarModelId, CarStateNum, CarColor, CarYearOfProd, CarSpec)
VALUES (2, 2, 'DFG-765687', 'Зелений', 2015, 'Бензин, Механіка');
INSERT INTO Cars(OwnerCarId, CarModelId, CarStateNum, CarColor, CarYearOfProd, CarSpec)
VALUES (3, 3, 'SDC-435654', 'Жовтий', 1999, 'Дизель, Автомат');
INSERT INTO Cars(OwnerCarId, CarModelId, CarStateNum, CarColor, CarYearOfProd, CarSpec)
VALUES (4, 4, 'ASD-465345', 'Білий', 2010, 'Бензин, Механіка');
INSERT INTO Cars(OwnerCarId, CarModelId, CarStateNum, CarColor, CarYearOfProd, CarSpec)
VALUES (5, 5, 'VBN-567687', 'Рожевий', 2005, 'Дизель, Автомат');

/* Add Employees */

USE CarService;

INSERT INTO Employees(PositionId, EmplName, EmplMiddlename, EmplSurname, EmplBirthDay, EmplBirthplace, EmplSalary,
                      EmplSurcharge, EmplPaymentDate, EmplPhoneNum)
VALUES (1, 'Петро', 'Володимирович', 'Мамонт', '1966-11-10', 'Суми', 10000, 1000, '2019-05-05', '0989584235');

INSERT INTO Employees(PositionId, EmplName, EmplMiddlename, EmplSurname, EmplBirthDay, EmplBirthplace, EmplSalary,
                      EmplSurcharge, EmplPaymentDate, EmplPhoneNum)
VALUES (2, 'Микола', 'Миколайович', 'Берет', '1988-10-15', 'Дніпро', 11000, 500, '2019-05-05', '0987844237');

INSERT INTO Employees(PositionId, EmplName, EmplMiddlename, EmplSurname, EmplBirthDay, EmplBirthplace, EmplSalary,
                      EmplSurcharge, EmplPaymentDate, EmplPhoneNum)
VALUES (3, 'Сергій', 'Миколайович', 'Велет', '1990-12-20', 'Львiв', 9000, 300, '2019-05-05', '0667664237');

INSERT INTO Employees(PositionId, EmplName, EmplMiddlename, EmplSurname, EmplBirthDay, EmplBirthplace, EmplSalary,
                      EmplSurcharge, EmplPaymentDate, EmplPhoneNum)
VALUES (4, 'Євген', 'Петрович', 'Насор', '1991-10-29', 'Черкаси', 9500, 200, '2019-05-05', '0677524237');

INSERT INTO Employees(PositionId, EmplName, EmplMiddlename, EmplSurname, EmplBirthDay, EmplBirthplace, EmplSalary,
                      EmplSurcharge, EmplPaymentDate, EmplPhoneNum)
VALUES (5, 'Валентин', 'Петрович', 'Пором', '1999-11-20', 'Черкаси', 7000, 100, '2019-05-05', '0668524237');

/* Add calculable field */

ALTER TABLE Employees
    ADD EmpFullSalary decimal(19, 4) AS (EmplSalary + EmplSurcharge);

/* Add Services */

INSERT INTO Services(CarId, EmployeeId, TypeOfWorkId, ServicePrice, ServiceDateStart, ServiceDateFinish, ServiceNotes)
VALUES (1, 1, 1, 3000, '2019-01-10', '2019-01-20', 'Без зауважень');

INSERT INTO Services(CarId, EmployeeId, TypeOfWorkId, ServicePrice, ServiceDateStart, ServiceDateFinish, ServiceNotes)
VALUES (1, 1, 2, 2000, '2019-02-10', '2019-02-20', 'Без зауважень');

INSERT INTO Services(CarId, EmployeeId, TypeOfWorkId, ServicePrice, ServiceDateStart, ServiceDateFinish, ServiceNotes)
VALUES (1, 1, 3, 3000, '2019-03-10', '2019-03-20', 'Без зауважень');

INSERT INTO Services(CarId, EmployeeId, TypeOfWorkId, ServicePrice, ServiceDateStart, ServiceDateFinish, ServiceNotes)
VALUES (2, 2, 2, 1000, '2019-04-01', '2019-04-20', 'Без зауважень');

INSERT INTO Services(CarId, EmployeeId, TypeOfWorkId, ServicePrice, ServiceDateStart, ServiceDateFinish, ServiceNotes)
VALUES (3, 3, 3, 3000, '2019-04-05', '2019-04-25', 'Без зауважень');

INSERT INTO Services(CarId, EmployeeId, TypeOfWorkId, ServicePrice, ServiceDateStart, ServiceDateFinish, ServiceNotes)
VALUES (4, 4, 4, 5000, '2019-01-10', '2019-01-25', 'Без зауважень');

INSERT INTO Services(CarId, EmployeeId, TypeOfWorkId, ServicePrice, ServiceDateStart, ServiceDateFinish, ServiceNotes)
VALUES (5, 5, 5, 10000, '2019-02-10', '2019-02-20', 'Без зауважень');