--large object datatypes- lob
--clob - character large object - this datatype normally used for capturing feedbacks / comments
--blob - binary large object - this datatype will hold the picture jpeg/png/documents, mpeg files

----------------------------------------------DDL (create, alter, truncate, drop)----------------------------------------------------------------

--CREATE
create table students(id number(5),name varchar(50),course varchar(30),doj date,logintime timestamp(6))

--ALTER (alter table structure)
alter table students add (phone number(12));
alter table students add (gender varchar2(10));

alter table students modify (phone number (15));

alter table students drop (gender); 

alter table students rename COLUMN phone to mobile;

--TRUNCATE( will remove data from the tale, irreversable)
truncate table students;

--DROP(removes table along with data, irreversable)
drop table students;

----------------------------------------------DML (insert, update, delete, select)----------------------------------------------------------------

--INSERT (cant insert many values)
insert into students values (5,'name5', 'computer','10-12-2024','13-12-2024 8:15:34.000000000 AM', 982739898, 'male' );

insert into students(id,name,course,doj,gender,mobile) values (6,'name6','science','11-12-2024','female',4628938787);

--UPDATE (updates existing data)
update students set gender = 'male' where name = 'name1'

--DELETE (deletes specific row)
delete from students where name = 'name1';

--SELECT
SELECT * FROM students

select name,course from students

select name, course from students where course = 'computer'

----------KEYWORDS in WHERE clause(in , not in, between, like):

--in
select * from students where course in ('computer','science')

select * from students where id in (1,2,3,4)

--not in
select * from students where course not in ('computer','science')

select * from students where id not in (1,2,3,4)

--between
select * from students where id between 3 and 6

select name,course from students where id between 3 and 6

--like
select * from students where course like 'c%'

select id,course from students where course like '%e%'

------------Comparision opertators:
-- = => equals
-- != => not equals
-- <> => not equals
-- >  => greater than
-- <  => less than
-- >= => greater than or equal to
-- <= => less than or equal to


---------------------------------Logical operators :
--and, or, not

--and
select * from students where course like 'c%' and gender = 'male'

--or
select * from students where course like 'c%' or gender = 'male'

--not
select * from students where not course= 'science'

-------------SORT :
--desc,asc-by default

select * from students order by id, name ;

select * from students order by doj desc;

select id, name, gender from students order by id;

select id, name, gender from students order by 1; --orders id in asc
select id, name, gender from students order by 2  ; --orders name in asc
select id, name, gender from students order by 3 ; --orders gender in asc
select id, name, gender from students order by 1, 2;-- 1st orders id in asc and then name in asc
select id, name, gender doj from students order by 1, 2 desc;
select * from students order by 6 desc;-- sorts 6th column mobile in desc

------------Grouping/Aggregation of data :

select course from students group by course; --select column only added in groupby
select name, count(*) from students group by name;
select course,count(*) from students group by course order by count(*) desc; --orders the count in desc
select course,count(*) from students group by course order by course desc; --orders the count in desc

--having(Filters rows after grouping or aggregation is performed in that column)

select name, count(*) from students group by name having count(*)=2; 
select name, count(*) from students group by name having count(*)>1; 
select name, count(*) from students group by name having count(*)=1; 
select course, count(*) from students group by course having course = 'computer'; 

-----------------DISTINCT

select distinct course from students;
select distinct course,name from students;--returns repeated values

----------------IMPORT AND EXPORT DATA
select* from students;

update students set name='xyz' where id=7;--update a data
----------------
desc students;--display the structure of a table, including column names, data types, and any constraints

-----------------DATE & TIME
select * from dual;

default column header is DUMMY
default value is X
dual is the table name

select 14*48, 12342+343, 100/5 from dual; --dual used only in select statements

--default date functions => sysdate, current_date
--default timestamp functions => systimestamp, current_timestamp

select sysdate, current_date, systimestamp, current_timestamp from dual;
SELECT 'Database is running' AS STATUS FROM DUAL;


----------------------How to create a table :
--use prefix
--if table is student => stu
--if table is student_details => sd_

create table student(
    stu_id number(4),
    stu_name varchar2(50),
    stu_doj date,
    stu_logintimestamp timestamp(6),
    stu_gender varchar2(15),
    stu_email varchar2(50)
);

select stu_name from student;
insert into student values(1001,'Ram', sysdate, systimestamp, 'Male', 'ram@gmail.com');
select * from student;
insert into student values(1002,'Raju', current_date, current_timestamp, 'Male', 'raju@gmail.com');
insert into student values(1002,'Raju', '02-05-2024', '10-12-2024 08:30:45.343598000', 'Male', 'raju@gmail.com');

------------------------------------------Increment / Decrement date


select sysdate-4, sysdate+2, current_date-3, current_date+10 from dual;
select systimestamp, current_timestamp, systimestamp-4, systimestamp+2, current_timestamp-3, current_timestamp+10 from dual;
select * from student;
update student set stu_doj=sysdate-14 where stu_id=1001;

select stu_id, stu_doj from student;

-- Date formatting functions:
-- to_char => which will convert the date to a character(date is a set of numbers)
-- to_date => which converts the character to a date(return i  numbers)

--01-09-2024 => 01-September-24, 01-Sep-2024, 09-01-2024, 01/09/2024, 01/SEP/2024, 01 SEP 24 etc...
syntax:
select to_char(date, 'format of the date to be converted') from tablename;

select sysdate,to_char(sysdate, 'DD/MON/YYYY'),to_char(sysdate, 'MONTH, DD YYYY') from dual;

SELECT to_date('14-DEC-2024', 'DD-MON-YYYY') AS Converted_Date FROM DUAL;

D-saturday
DD -28
MM-12
MON-DEC
MONTH-DECEMBER
YY-24
YYYY-2024
YEAR-2024

HH-HOUR
MI-MINUTES
SS-SECONDS
HH12-12 HOUR FORMAT
HH24-24 HOUR FORMAT

select * from student

select stu_doj, to_char(stu_doj,'day') from student 

select systimestamp from dual 

select systimestamp, to_char(systimestamp,'hh'),to_char(systimestamp,'mi'),to_char(systimestamp,'ss'),to_char(systimestamp,'hh24'),to_char(systimestamp,'DAY') from dual

select '12-december-2024', to_date('12-december-2024','dd-mm-yyyy'),to_date('12-december-2024','dd-month-yyyy') from dual

select '12-DECEMBER-2024', to_date('12-DECEMBER-2024', 'DD-MONTH-YYYY'), to_date('12-DEC-2024', 'DD-MON-YYYY'), to_date('09-12-2024', 'MM-DD-YYYY')from dual;

select to_date('03-01-2024','MM-DD-YYYY') from dual;

--to_timestamp()
select to_timestamp('MAY-10-2024 ','MONTH-DD-YYYY HH:MI:SS AM') from dual;

select sysdate,to_char(sysdate,'MON/DD/YYYY'), to_char(sysdate,'DD'), to_char(sysdate,'DDD')from dual;

select '12-DECEMBER-2024',to_date('12-DECEMBER-2024','dd-mm-YYYY') from dual;

select to_char(sysdate,'DDD') from dual;--returning the number of day in the year 

--------------------------------------------Trunc - Is Used To Trim/Round Off The Value-----------------------------------------
select sysdate, trunc(sysdate) from dual
select systimestamp,  trunc(systimestamp)from dual

--Components of date
--YYYY
--MON
--Date
--HH
--MI
--SS

select trunc(sysdate),trunc(sysdate,'YEAR') from dual--truncates the year and set to new--year starting
select TRUNC(SYSDATE, 'MONTH')from dual --tructaes this month starts from starting--month starting
select TRUNC(SYSDATE, 'day')from dual--day starting

select sysdate,trunc(sysdate,'MON'),trunc(sysdate,'MONTH') from dual;--trunc month value, it resets the below date, hr, mins and seconds
select sysdate,trunc(sysdate,'DD') from dual;--trunc date value, it resets the below  hr, mins and seconds
select sysdate,trunc(sysdate,'D'),to_char(sysdate,'D') from dual;--truncate today
select sysdate,trunc(sysdate,'DAY'),to_char(sysdate,'DAY') from dual;

select sysdate,trunc(sysdate,'HH'),to_char(sysdate,'HH') from dual;--trunc hour value, it resets the below mins and seconds
select sysdate,trunc(sysdate,'MI'),to_char(sysdate,'MI') from dual;--trunc hour value, it resets the below mins and seconds

select '99.99',trunc(99.99),trunc(199.99) from dual;
select '99.99',round(99.99),round(199.99),round(199.49),round(199.50) from dual;


-------------------------------------------------------------------CONSTRAINTS:--------------------------------------------------------------------
--Rules to be setup on the table columns to prevent some values from updating to the table
There are 6 types available:
1. Not null constraint
2. Unique constraint
3. Primary key constraint
4. Foreign key constraint
5. Check constraint
6. Default constraint

1. Not null constraint(that column should not be null)

create table notnull(emp_id number(10)not null,emp_name varchar2(20))
insert into notnull values(1,'name1')
insert into notnull values('','name2')--error
insert into notnull(emp_id,emp_name) values (3,'name3')
insert into notnull(emp_name) values ('name3')--error

2. Unique constraint(that column should have only unique values)

create table uniquetable(emp_id number(10)unique,emp_name varchar2(20))
insert into uniquetable values(1,'name1')
insert into uniquetable values(2,'name2')
insert into uniquetable(emp_id,emp_name) values (2,'name3')--error

3. Primary key constraint(column should be notnull and unique)

create table Primarytable(emp_id number(10)primary key,emp_name varchar2(20))
insert into Primarytable values(1,'name1')
insert into Primarytable values(2,'name2')
insert into Primarytable(emp_id,emp_name) values (2,'name3')--error
insert into notnull values('name2')--error

6. Default constraint(can set particular column to deafult value)

create table Defaulttable(emp_id number(10)primary key,emp_name varchar2(20), city varchar2(10) default 'INDIA')
insert into Defaulttable values(1,'name1','banglore')
insert into Defaulttable values(2,'name2')--error
insert into Defaulttable(emp_id, emp_name) values (2,'name3')
select * from Defaulttable

4. Foreign key constraint
--child data references parent data
--id in parent only exists in child 
--can't delete parent row if that id is present in 
-- referencing column must be primary key or unique key

create table employee_info(id number(10)primary key, name varchar2(20), email varchar2(10))
alter table employee_info modify (email varchar2(30))
insert into employee_info values(1001,'sai',' sai@gmail.com')
insert into employee_info values(1002,'sri',' sri@gmail.com')
insert into employee_info values(1003,'rithi',' rithi@gmail.com')
insert into employee_info values(1004,'rishi',' rishi@gmail.com')


create table employee_leave(emp_id number(10)primary key, total_leave number(20), taken_leave number(30),
                           constraint leaves foreign key(emp_id) references employee_info(id))

insert into employee_leave values(1001,'9',' 3')
insert into employee_leave values(1002,'8',' 1')
insert into employee_leave values(1003,'5',' 0')
insert into employee_leave values(1004,'4',' 1')


--to delete a data 

delete from employee_info where name='sai';--Error report -violated - child record found

delete from employee_leave where emp_id=1001
delete from employee_info where id=1001

select * from employee_info
select * from employee_leave

5. Check constraint

create table check_constraint (id number(10),name varchar2(20),age number(20), gender varchar2(10), check (age >18 and gender='male'))
insert into check_constraint values(1001,'sai',' 19','male')
insert into check_constraint values(1002,'rithi',' 16','female')--error
insert into check_constraint values(1003,'rishi',' 20','male')


-----------------------------------------------------------INBULT-FUNCTIONS-----------------------------------------------------------------------
1. upper - lower case to upper
2. lower - upper to lower case
3. initcap - upper case first letter of every word
4. trim - remove extra space
5. ltrim - remove extra space in left
6. rtrim - remove extra space in right
7. || or concat - combine values
8. instr - find the character/text position number occurred
9. substr - return the character mentioned in position number
syntax : lpad(sourcetext, expected text length , text to be appended)
10. lpad
11. rpad

select upper('Hello Raju'),upper('hello'), upper('HELLO') from dual;

select lower('Hello Raju'),lower('hello'), lower('HELLO') from dual;

select initcap('HeLLo raju'),initcap('hello'), initcap('HELLO') from dual;

select trim('   hello world !                         ') from dual;
select ltrim('   hello world !                         ') from dual;
select rtrim('   hello world !                         ') from dual;

select concat('hello','world!') from dual; --only 2 values can be concatenated

select (2||3||4) from dual;

select instr('Hello World!','ello') from dual;
select email,instr(email,'gmail') from employee_info;
select email,instr(email,'gmail') from employee_info where instr(email,'gmail')=0; 

select substr('Hello Raju',1,5) from dual;
select email,substr(email,1,5) from employee_info;
select email,substr(email,1,instr(email,'@')-1) from employee_info;--split the name b4 gmail

select rpad('1',5,'0') from dual;
select lpad('1',5,'0') from dual;

-----------------------------------------------------------------  SUBSTITUTE VALUES   -------------------------------------------------------------------



---   NVL()
used when null
select nvl(column/value, substitutable text) from table/dual;
if column/value is not null it returns the column/value ,if that is null onlu it returns subsitutable text

select nvl('priya','nlvs') from dual
select nvl('Ramya','Priya') from dual;
select '',nvl('', 'Salman') from dual;
select stu_gender, nvl(stu_gender, 'Gender') from student;

--- COALESCE()  
used when null
coalesce replaces a thing with multiple replacable values,if the things are null

select name,email,coalesce(name,email,'NO NAME') as emp_name from employee_info

--- REPLACE()

select replace('there are 5 ice','5','2') from dual;
select replace('Hello how are you', 'how','yes') from dual;

select name,email,replace(email,(null),'xxx@gmail.com') from employee_info;
select name,email,replace(email,'dimple@gmail.com','xxx@gmail.com') from employee_info;

select nullif('Hello','How are you') from dual;
select nullif('Hello','Hello') from dual;


--- NULLIF ()  -- is used to check / compare two values/columns and find if they are same or different
if different returns 1st value
if same returns null

select emp_name,city,nullif( emp_name,city) from defaulttable where emp_name is not null ;
select nullif('rithi','rithi') from dual;
select nullif('rithi','RS') from dual;
select nullif('RS','rithi') from dual;

-----------------------------------------------------------------  ARITHMETIC OPERATIONS   -------------------------------------------------------------------
returns 1 value
+ ,-, *, %, 
sum,avg,count, min, max

select * from employee_leave;
select total_leave,sum(total_leave) from employee_leave group by total_leave;
select sum(total_leave) from employee_leave ;
select min(total_leave),max(total_leave) from employee_leave;
