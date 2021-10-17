--UC1
create database PayRoll;

--use database
use PayRoll;

--UC2 create a table for PaymentRoll
create table Employee_payroll(
id int primary key,
name varchar(100),
salary int,
start_date Date
);

--UC3 inserting data
insert into Employee_payroll
values (101,'Dhanashree',3000,'12/8/2021')

insert into Employee_payroll
values(102,'Pooja',4000,'11/9/2021')

insert into Employee_payroll
values(103,'Preksha',5000,'12/10/2021')

--UC4 
select * from Employee_payroll;

--UC5 Inserting More data
insert into Employee_payroll values (104,'Rohan',6000,'2019/10/8'),
(105,'suraj',7000,'2018/02/10');

--Printing data of a perticular empolyee(where condition)
select * from Employee_payroll where name = 'Dhanashree'; 

--searching name and salary for people how join from 2018-01-01
select name,salary from Employee_payroll where start_date between CAST('2019-10-8' AS date) and GETDATE();

--UC6 add gender
Alter table Employee_payroll add gender char;

update Employee_payroll set gender='F' where name='Dhanashree' or name='Pooja';
update Employee_payroll set gender='F' where name='Pooja' or name='Preksha';
update Employee_payroll set gender='M' where name='Rohan';
Select * from Employee_payroll;

--UC7
--Average
select AVG(salary) from Employee_payroll;
--Sum 
select SUM(salary) from Employee_payroll;
--Minimum
select MIN(salary) from Employee_payroll;
--Maximum
select MAX(salary) from Employee_payroll;
--Count
select COUNT(salary) from Employee_payroll;
-- Group by 
--Total female salary
select SUM(salary) from Employee_payroll
where gender = 'F' group by gender;
--Total male salary
select SUM(salary) from Employee_payroll
where gender = 'M' group by gender;

--UC8
--Adding address,phone_no,dept
Alter table Employee_payroll add address varchar(255) default 'Banglore'; 
Alter table Employee_payroll add phone_no varchar(255);
Alter table Employee_payroll add dept varchar(255) not null default 'Adv. Dept';
select * from Employee_payroll;

--UC9
Alter table Employee_payroll add basicPay float, Deduction float, TaxablePay float, IncomeTax float, NetPay float;

--UC10 Add Two Employee Having same name but different Dept.
insert into Employee_payroll values
(90,'Alice',3000000, '2019-02-05' , 'F','New York',9922003699,'Marketting',  3000000.00, 1000000.00, 2000000.00, 500000.00, 1500000.00)
, (91,'Alice',3000000, '2019-02-05' , 'F','New York',9034001654,'Sales',  3000000.00, 1000000.00, 2000000.00, 500000.00, 1500000.00);
select * from Employee_payroll where name='Alice';

--UC 11 Create Tables
create table Company(
CmpID int identity(1,1) PRIMARY KEY,
CmpName varchar(100) not null);

create table Department(
DepartmentID int identity(1,1) PRIMARY KEY,
DepartmentName varchar(100) not null);

create table employee(
ID int identity(1,1) PRIMARY KEY,
EmployeeName varchar(100) NOT NULL,
EmployeePhoneNumber int not null,
EmployeeAddress varchar(255),
EmployeeGender char(1),
CompanyID int,
Foreign key(CompanyID) REFERENCES employee(id)
);

create table Payment(
PaymentID int identity(1,1) PRIMARY KEY,
EmployeeID int,
basicPay float, 
Deduction float, 
TaxablePay float, 
IncomeTax float, 
NetPay float
Foreign key(EmployeeID) REFERENCES employee(id)
);

create table EmployeeDepartment(
EmployeeID int,
DepartmentID int,
Foreign key(EmployeeId) REFERENCES employee(id),
Foreign key(DepartmentID) REFERENCES Department(DepartmentID)
