create database assignment;
use assignment;
create table employee(empid int primary key,empname varchar(20),department varchar(10),contact bigint,emailid varchar(20),empheadid int);
insert into employee values(101,'Isha','E-101',1234567890,'isha@gmail.com',105);
insert into employee values(102,'Priya','E-104',1234567890,'priya@yahoo.com',103);
insert into employee values(103,'Neha','E-101',1234567890,'neha@gmail.com',101);
insert into employee values(104,'Rahul','E-102',1234567890,'rahul@yahoo.com',105);
insert into employee values(105,'Abhishek','E-101',1234567890,'abhishek@gmail.com',102);
create table empdept(deptid varchar(10),deptname varchar(100),dept_off varchar(100),depthead int );
alter table empdept add primary key(deptid);
alter table empdept add foreign key(depthead) references employee(empid);
insert into empdept values('E-101','HR','MONDAY',105);
insert into empdept values('E-102','Development','TUESDAY',101);
insert into empdept values('E-103','House Keeping','Saturday',103);
insert into empdept values('E-104','Sales','SUNDAY',104);
insert into empdept values('E-105','Purchage','TUESDAY',104);
select * from employee;
create table empsalary(empid int ,salary bigint,ispermanent varchar(3));
alter table empsalary add  foreign key (empid) references employee(empid);
insert into empsalary values(101,2000,'YES');
insert into empsalary values(102,10000,'YES');
insert into empsalary values(103,5000,'NO');
insert into empsalary values(104,1900,'YES');
insert into empsalary values(105,2300,'YES');
select * from empsalary;
create table empproject(empid int,projectid varchar(50),clientid varchar(50),startyear int,endyear int);
alter table empproject add foreign key(empid) references employee(empid);
insert into empproject values(101,'p-1','C1-1',2010,2010);
insert into empproject values(102,'p-2','C1-2',2010,2012);
insert into empproject values(103,'p-3','C1-3',2011,null);
insert into empproject values(104,'p-4','C1-4',2011,2011);
insert into empproject values(105,'p-4','C1-5',2015,2015);

# 1.Select the detail of the employee whose name start with R.
select * from employee where empname like 'R%';

# 2.How many permanent candidate take salary more than 2000.
select count(*) from empsalary where salary>4000 and ispermanent='YES';

# 3.Select the detail of employee whose emailId is in gmail.
select * from employee where emailid like'%@gmail.com';

# 4.Select the details of the employee who work either for department E-101 or E-103.
select * from employee where department='E-101'or department='E-103';

# 5.What is the department name for DeptID E-102? 
select deptname from empdept where deptid='E-102';

# 6.What is total salary that is paid to permanent employees?
select sum(salary) from empsalary where ispermanent='YES';

# 7.List name of all employees whose name ends with k.
select * from employee where empname like '%k';

# 8.How many project started in year 2010 and 2011.
select count(*) from empproject where startyear=2010 or startyear=2011;

# 9.How many project started and finished in the same year.
select count(*) from empproject where startyear=endyear;

# 10.select the name of the employee whose name's 3rd charactor is 'h'.
select empname from employee where empname like '__h%';