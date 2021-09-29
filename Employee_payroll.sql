#Uc1_DATABASE 
create database payroll_service;
show databases;
use payroll_service;
select database();

#Uc2_CreateTable
create table employee_payroll
( id int not null auto_increment,
name varchar(50) not null,
salary Double not null,
startDate date not null,
primary key(id)
);
desc employee_payroll;

#Uc3_InsertNewData
select * from employee_payroll;
insert into employee_payroll (name,salary,startDate) values('Monali',40000,'2021-10-11');
insert into employee_payroll (name,salary,startDate) values(5,'Toshita',70000,'2021-9-11');
insert into employee_payroll (name,salary,startDate) values('Sonali',40000,'2021-1-17');
insert into employee_payroll(name,salary,startdate)values('Soham',70000,'2022-05-10');
insert into employee_payroll(name,salary,startdate)values('Trupti',60000,'2021-11-15');

#Uc4_AbilityToRetrieveAllData
select * from employee_payroll;

#Uc5_AbilityToRetrieveParticularData
select * from employee_payroll where name="Monali";
select * from employee_payroll where salary=70000;
select * from employee_payroll where startDate between '2021-1-17' And date(now());

#Uc6_AbilityToUpdateData
alter table employee_payroll add gender char(1);
UPDATE employee_payroll set gender='F' where id='2';
UPDATE employee_payroll set gender = 'M' WHERE id =1;
UPDATE employee_payroll set gender = 'M' WHERE id =4;

#Uc7_AbilityToUseDatabaseFunctions
select gender,sum(salary) from employee_payroll group by gender; 
select gender,min(salary) from employee_payroll;
select gender,max(salary) from employee_payroll;
select gender,avg(salary) from employee_payroll;
select count(salary) from employee_payroll;
set sql_safe_updates=0;

#Uc8_ExtendedTableToStoreEmployeeInfomation
alter table employee_payroll add phone varchar(20);
alter table employee_payroll add address varchar(80) default 'Nagpur';
alter table employee_payroll add department varchar(20) not null;
desc employee_payroll;

#Uc9_AbilityToAddFields
alter table employee_payroll rename COLUMN salary to basic_pay;
alter table employee_payroll add deduction int,add taxable_pay int ,add income_tax int,add net_pay int;

#Uc10_AbilityToAddTwoDepartmentsForTerrisa
insert into employee_payroll(name,basic_pay,startdate,gender,department,deduction,taxable_pay,income_tax,net_pay)values('Terrisa',30000,'2018-08-09','F','Marketing','3000','2000','5000','30000');
insert into employee_payroll(name,basic_pay,startdate,gender,department,deduction,taxable_pay,income_tax,net_pay)values('Terrisa',30000,'2018-08-09','F','Sales','0','0','0','0');

#Uc11_AbilityToAddTablesToCreateManyToManyRelationship
create table employee
(id int auto_increment not null primary key,
name varchar(30) not null,
gender varchar(1),
startdate date not null,
phone varchar(15),
address varchar(30));
insert into employee (id,name,gender,startdate,phone,address) values(1,'Mona','F','2021-9-20',34787123,'Nagpur');
insert into employee (id,name,gender,startdate,phone,address) values(2,'Sona','F','2021-9-30',456787123,'Kolhapur');
select * from employee;

create table payroll
(
id int auto_increment not null primary key,
basic_pay int,
deduction int,
taxable_pay int,
income_tax int,
net_pay int,
emp_id int,
foreign key(emp_id) references employee(id)
);
insert into payroll (basic_pay,deduction,taxable_pay,income_tax,net_pay) values(10000,400,500,900,800);
insert into payroll (basic_pay,deduction,taxable_pay,income_tax,net_pay,id) values(20000,500,800,100,900,3);
select * from payroll;

create table department
(
id int auto_increment not null primary key,
dept_name varchar(20) not null
);
insert into department (id,dept_name) values(1,'Sales');
insert into department values (2,'Marketing');
select * from department;

create table employee_department
(
employee_id int not null,
department_id int not null,
foreign key(employee_id) references employee(id),
foreign key(department_id) references department(id),
primary key(employee_id,department_id)
);

#Uc12_AbilityToPerformRetrivalQueries
select * from employee,department,employee_department;