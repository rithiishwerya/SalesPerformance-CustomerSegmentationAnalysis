----------------  TASK 1

Insert 10 different records using insert query
update 5 different values in separate queries
delete 3 records
write a truncate query and wipe out all the data
insert 20 records with different names and other values
write select statement for filter the email column that contains only 'gmail'

create table employee (id number(20), name varchar2(50), phone number(30), email varchar2(30));

insert into employee values (1001,'name1', 87654321,'name1@gmail.com')
insert into employee values (1002,'name2', 82748957892,'name2@gmail.com')
insert into employee values (1003,'name3', 1234567890,'name3@gmail.com')
insert into employee values (1004,'name4', 0987654321,'name4@gmail.com')
insert into employee values (1005,'name5', 9897877654,'name5@gmail.com')
insert into employee values (1006,'name6', 8987865,'name6@gmail.com')
insert into employee values (1007,'name7', 878567890,'name7@gmail.com')
insert into employee values (1008,'name8', 15434567890,'name8@gmail.com')
insert into employee values (1009,'name9', 1276543890,'name9@gmail.com')
insert into employee values (10010,'name10', 12309890,'name10@gmail.com')

update employee set name = 'sai' where id = 1001
update employee set name = 'rithi' where id = 1002
update employee set name = 'sri' where id = 1003
update employee set name = 'ishwerya' where id = 1004
update employee set name = 'rishi' where id = 1005

delete from employee where id in (10010,1009,1008)

truncate table employee 

INSERT INTO employee (id, name, phone, email) VALUES (1001, 'name1', '87654321', 'name1@gmail.com');
INSERT INTO employee (id, name, phone, email) VALUES (1002, 'name2', '82748957892', 'name2@gmail.com');
INSERT INTO employee (id, name, phone, email) VALUES (1003, 'name3', '1234567890', 'name3@gmail.com');
INSERT INTO employee (id, name, phone, email) VALUES (1004, 'name4', '0987654321', 'name4@gmail.com');
INSERT INTO employee (id, name, phone, email) VALUES (1005, 'name5', '9897877654', 'name5@gmail.com');
INSERT INTO employee (id, name, phone, email) VALUES (1006, 'name6', '8987865', 'name6@gmail.com');
INSERT INTO employee (id, name, phone, email) VALUES (1007, 'name7', '878567890', 'name7@gmail.com');
INSERT INTO employee (id, name, phone, email) VALUES (1008, 'name8', '15434567890', 'name8@gmail.com');
INSERT INTO employee (id, name, phone, email) VALUES (1009, 'name9', '1276543890', 'name9@gmail.com');
INSERT INTO employee (id, name, phone, email) VALUES (10010, 'name10', '12309890', 'name10@gmail.com');
INSERT INTO employee (id, name, phone, email) VALUES (10011, 'name11', '87654321', 'name11@gmail.com');
INSERT INTO employee (id, name, phone, email) VALUES (10012, 'name12', '82748957892', 'name12@gmail.com');
INSERT INTO employee (id, name, phone, email) VALUES (10013, 'name13', '1234567890', 'name13@gmail.com');
INSERT INTO employee (id, name, phone, email) VALUES (10014, 'name14', '0987654321', 'name14@gmail.com');
INSERT INTO employee (id, name, phone, email) VALUES (10015, 'name15', '9897877654', 'name15@gmail.com');
INSERT INTO employee (id, name, phone, email) VALUES (10016, 'name16', '8987865', 'name16@gmail.com');
INSERT INTO employee (id, name, phone, email) VALUES (10017, 'name17', '878567890', 'name17@gmail.com');
INSERT INTO employee (id, name, phone, email) VALUES (10018, 'name18', '15434567890', 'name18@gmail.com');
INSERT INTO employee (id, name, phone, email) VALUES (10019, 'name19', '1276543890', 'name19@gmail.com');
INSERT INTO employee (id, name, phone, email) VALUES (10020, 'name20', '12309890', 'name20@gmail.com');

select email from employee where email like '%gmail%';


--------------------  TASK 2:
1.Create a new table: staff
Columns: id, name, email, phone, dept
2. Insert 5 different staff  information using two types of insert queries
write a query to
1. Update all data of a column
2. Update all columns of a particular record
3. delete all records in a table (two approach)
4. delete 3 records in a table
5. display 4 records out of 10 records in a table (use in, between keywords - give each 1 example)
6. display records using logical operators
7. Create tables with all types of constraints.

create table staff (id number(10)primary key, name varchar2(30)not null, phone number(30)unique, dept varchar2(30)default  'DEPT_DEFAULT')

alter table staff add (email varchar2(30));

INSERT INTO staff VALUES (01, 'staff1', 9376543201,'computer','staff1@gmail.com')
INSERT INTO staff VALUES (02, 'staff2', 987654322,'science','staff2@gmail.com')
INSERT INTO staff VALUES (03, 'staff3', 987654323,'biology','staff3@gmail.com')
INSERT INTO staff VALUES (04, 'staff3', 987654324,'computer','staff4@gmail.com')
INSERT INTO staff VALUES (05, 'staff5', 987654325,'english','staff5@gmail.com')

INSERT INTO staff(id, name,email, phone, dept) VALUES (06, 'staff6','staff6@gmail.com', 93765643201,'computer')
INSERT INTO staff(id, name,email, phone) VALUES (07, 'staff7', 'staff7@gmail.com',9876574322)
INSERT INTO staff(id, name,email, dept) VALUES (08, 'staff8','staff8@gmail.com','biology')
INSERT INTO staff(id, name,email) VALUES (09, 'staff9','staff9@gmail.com')
INSERT INTO staff(id, name,email, phone, dept) VALUES (10, 'staff10','staff10@gmail.com', 98765544325,'english')

update staff set email = 'zzz@gmail.com'

update staff set email = 'default@gmail.com' where id in (1,2,5,6)

delete from staff where id in (10,9,8)

select * from staff where id in (2,4,6)
SELECT * FROM staff where id between 3 and 10
SELECT * FROM staff where id not in (2,4,6)
SELECT * FROM staff where email like 'zzz%'

SELECT * FROM staff where dept='computer' and email='zzz@gmail.com'
SELECT * FROM staff where dept='computer' or email='zzz@gmail.com'
SELECT * FROM staff where not dept='computer' 

--- TASK (#3)
1. Create the table orders, order_details, order_delivery and apply the primary and foreign keys where necessary..
Also add data through the insert queires..

create table orders( ord_id number(30)primary key, ord_address varchar2(40)not null, ord_name varchar2(30)) 

create table order_details( ord_id number(30)primary key, ord_qty number(20),product_name varchar2(50),
                     constraint id foreign key(ord_id) references orders(ord_id))
                     
create table order_delivery( ord_id number(30) primary key, delivery_address varchar2(50)not null,est_delivery number(30),
                     constraint del_id foreign key(ord_id) references orders(ord_id),
                     constraint address foreign key(delivery_address) references orders(ord_address))
                     
alter table orders modify (ord_address varchar2(40)unique);      

insert into orders values ('123', 'adc street','plastic')
insert into orders values ('456', 'def street','cosmetics')
insert into orders values ('789', 'xyz street','dress')

insert into order_details values ('123', '3','plastic')
insert into order_details values ('789', '7','shirt')

insert into order_delivery values ('123', 'adc street','23')
insert into order_delivery values ('456', 'def street','31')

---  Task (#4)
1. Add some duplicate data in different columns in a table
2. Write select statement to find the count of the duplicate occurance
3. write a filter using having 
4. write a appropriate function to remove extra spaces around a text, convert a sentence into proper case, find the position of particular character, prefix a text to a existing column value, postfix a text if needed to a existing column value
5. write a query to add substitute value if a column value is null
6. Handle multiple null values in a column and display values appropriately..


select dept,count(*) from staff group by dept;

select dept from staff group by dept having count(*)>1;

select trim('   hello world !                         ') from dual;
select initcap('   hello world !                         ') from dual;
select email, instr(email,'gmail') from staff;

select name,('staff_' || name) from staff;
select name,(name || '_staff') from staff;

select phone,email,nvl(phone,0), nvl(email,'--') from staff;

select email, coalesce(email,name,'no info') from staff;

--------------------  Hospital management system (HMS)----------:

Create tables below
Employee
Patient
Billing_details
Expense_details
Stock_details
leave_info
Payroll_info
In this you need to create primary key, foreign key and check constraints.

--Employee ? Patient:
--Employee ? Expense_details:
--Employee ? Leave_info:
--Employee ? Payroll_info:
--Stock_details ? Expense_details:
--Patient ? Billing_details:


create table Employe(emp_id number(5) primary key ,emp_name varchar2(20),emp_email varchar2(20)not null)
insert into Employe values (1001,'emp1','emp1@gmail.com')
insert into Employe values (1002,'emp2','emp2@gmail.com')
insert into Employe values (1003,'emp3','emp3@gmail.com')


create table Patient(pat_id number(5) primary key ,emp_id number(5),pat_name varchar2(20),pat_email varchar2(20)not null,
                    constraint pat_info foreign key(emp_id) references Employe(emp_id))
insert into Patient values (100,1003,'patient1','patient1@gmail.com')
insert into Patient values (102,1002,'patient2','patient2@gmail.com')
insert into Patient values (103,1002,'patient3','patient3@gmail.com')


create table Stock_details(Stock_id number(5) primary key ,Stock_name varchar2(20)not null)
insert into Stock_details values (12,'tag')
insert into Stock_details values (34,'pen')
insert into Stock_details values (56,'note')
insert into Stock_details values (78,'dress')
insert into Stock_details values (90,'shoe')


create table Expense_details(Expense_id number(5) primary key ,emp_id number(5)not null,stock_id number(20)not null,
                    constraint emp_info foreign key(emp_id) references Employe(emp_id),
                    constraint stock_info foreign key(stock_id) references Stock_details(stock_id))
alter table Expense_details add (Expense_Amt number(20))
insert into Expense_details values (10,1003,34,300)
insert into Expense_details values (11,1002,56,800)
insert into Expense_details values (12,1001,78,1500)


create table Leave_info(emp_id number(5)not null,total_leave number(20)not null,taken_leave number(10),
                    constraint emp_leave_info foreign key(emp_id) references Employe(emp_id))
insert into Leave_info values (1003,10,5)
insert into Leave_info(emp_id,total_leave) values (1002,5)
insert into Leave_info values (1001,10,1)


create table Payroll_info(emp_id number(5) primary key ,salary number(5),PF number(20),
                    constraint pay_info foreign key(emp_id) references Employe(emp_id))
insert into Payroll_info values (1003,60000,1800)
insert into Payroll_info values (1002,80000,2600)
insert into Payroll_info values (1001,55000,1800)


create table Billing_details(bill_no number(5) primary key ,emp_id number(5),pat_id number(20),amount number(20),
                    constraint emp_pat foreign key(emp_id) references Employe(emp_id),
                    constraint pat_emp foreign key(pat_id) references Patient(pat_id))
insert into Billing_details values (4582,1001,102,80000)
insert into Billing_details values (8745,1003,100,2600)
insert into Billing_details values (989,1003,103,60000)
insert into Billing_details values (877,1002,102,1500)
insert into Billing_details values (9879,1001,103,100000)
insert into Billing_details values (8787,1002,100,500)