----------------------------------------------------------  SUB QUERY   ------------------------------------------------------------------
select column1,column2
table name
where 
1. used in select statement 
2. used in table clause
3. used in where clause

1. used in select statement 
--any 1 column should same in both

select name, email, (select taken_leave from employee_leave where emp_id = id) from employee_info ;
select name, email, (select taken_leave from employee_leave where emp_id = id) leave from employee_info ;--alias name

2. used in table clause
--columns metioned in select, should be mentioned in table subquery also

select name, email, taken_leave from ( select name, email, taken_leave from employee_leave, employee_info where emp_id = id)
select name, email, leave from ( select name, email, taken_leave leave from employee_leave, employee_info where emp_id = id)-- alias name, same name mentioned in select(alias name)

3. used in where clause

select id,name,email from employee_info where id in (select emp_id from employee_leave )

----------------------------------------------------------  REPLICATE/COPY TABLE   ------------------------------------------------------------------

create table duplicate_student as SELECT * FROM student

select * from duplicate_student
----------------------------------------------------------  JOIN 2 TABLE   ------------------------------------------------------------------

SELECT employee_info.id, employee_info.name, employee_info.email, employee_leave.total_leave, employee_leave.taken_leave FROM employee_info,employee_leave
where employee_info.id = employee_leave.emp_id

--instead of using long table name use short one

SELECT info.id, info.name, info.email, leave.total_leave, leave.taken_leave FROM employee_info info,employee_leave leave
where info.id = leave.emp_id

--this method not preferable
SELECT a.id, a.name, a.email, b.total_leave, b.taken_leave FROM employee_info a,employee_leave b
where a.id = b.emp_id

--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
----------------------------------------------------------------   PL/SQL programming    PL/SQL programming language
1. INITIALIZE/ DECLARE section
2. EXECUTION section
3. ERROR/ EXEPTION HANDLING section(optional)

----------------------------------------------------------------      BLOCK OF CODE                      ------------------------------------------------------------------

Not saved in database
Not reusable
Executed immediately when written
syntax :
declare

begin

end
/

set serveroutput on;--if we want output in script output need to eecute this once
--(1)
declare
    n1 number(3);
    n2 number;
    n3 number;
begin
    n1:=100;
    n2:=200;
    n3:= n1 + n2;
    dbms_output.put_line('value of n3 is='||n3);
end;
/

--(2)
declare
    a number(5) :=20;
    b number(5) :=10;
    c number(5) :=15;
    d number(5) :=5;
    e number(5) ;
begin
    e := (a+b) * c/d;
    dbms_output.put_line('value of e is='||e);
    e := a+b *(c/d);
    dbms_output.put_line('value of e is='||e);
end;
/

--(3)
select name from employee_info where id=1002

declare
   new_name varchar(30);
begin
    select name into new_name from  employee_info where id=1002;
    dbms_output.put_line('output :'||   new_name);

end;
/

-- Exception handling in block of code:
--unexpected error which breaks the normal flow of the program

--(4)
declare 
    name varchar2(30);
    id number(20):=1005;
begin
    select stu_name into name from student where stu_id = id;
    DBMS_OUTPUT.PUT_LINE('The student id is ' || id || ' and name is ' || name);
    exception
        when no_data_found then
            dbms_output.put_line('No id exists ' ||id);
        when others then
            dbms_output.put_line('some error occured!');
end;
/

--(5)
declare
    n1 number(20):=25;
    n2 number(20):=0;
    n3 number(20);
begin
    n3:=n1/n2;
    dbms_output.put_line('value of n3 = '||n3);
    exception
        when zero_divide then
            dbms_output.put_line('can not divide by 0');
        when others then
            dbms_output.put_line('error occured!');
end;
/


---lIST OF EXCEPTION KEYWORDS
ACCESS_INTO_NULL	
CASE_NOT_FOUND	
COLLECTION_IS_NULL	
CURSOR_ALREADY_OPEN	
DUP_VAL_ON_INDEX	
INVALID_CURSOR	
INVALID_NUMBER	
LOGIN_DENIED	
NO_DATA_FOUND	
NOT_LOGGED_ON	
PROGRAM_ERROR	
ROWTYPE_MISMATCH	
SELF_IS_NULL	
STORAGE_ERROR	
SUBSCRIPT_BEYOND_COUNT	
SUBSCRIPT_OUTSIDE_LIMIT	
SYS_INVALID_ROWID	
TIMEOUT_ON_RESOURCE	
TOO_MANY_ROWS	
VALUE_ERROR
ZERO_DIVIDE

--(6)
select *from students where id<5
--when more than 1 values/condition use cursor method

declare
    stu_id number(30);
    stu_name varchar2(30);
    cursor stu_cursor is select id,name from students where id<5;
begin
    open stu_cursor;
    loop
        fetch stu_cursor into stu_id,stu_name;
        exit when stu_cursor%notfound;
        dbms_output.put_line('name of student is '||stu_name||' and id is'||stu_id);
    end loop;
end;
/


---------------------------------------------variable types in block of code:-----------------------------------------------------------
1.global variable
2.local variable

declare
    n1 number(10):=10;--global variable
    n2 number(10):=20;
begin
    declare
         n3 number(10);--local variable
    begin
         n3:= n1+n2;
        dbms_output.put_line('n1= '||n1||' n2= '||n2||' n3='||n3);
    end;
        dbms_output.put_line('n1= '||n1||' n2= '||n2);--throws error n3 not declared
end;
/

-------------------------------------------------    Condtion statements:      ------------------------------------------------------------
1. if statement
2. if...else statement
3. elsif statement
4. nested if statement

1. if statement

declare
    n1 number(5) :=100;
    n2 number(5) :=50;
begin
    if(n1>n2)then
         dbms_output.put_line('n1 is greater than n2');
    end if;
end;
/

2. if...else statement

declare
    n1 number(3):=100;
    n2 number(3):=150;
begin
    if(n1>n2)then
        dbms_output.put_line('n1 is greater than n2');
    else 
        dbms_output.put_line('n2 is greater than n1');
    end if;
end;
/


3. elsif statement

declare
    n1 number(3):=100;
    n2 number(3):=150;
    n3 number(3):=200;
begin
    if(n1>n2)then
        dbms_output.put_line('n1 is greater than n2');
    elsif(n2>n3)then
        dbms_output.put_line('n2 is greater than n1 and n3');
    else 
        dbms_output.put_line('n3 is greater than n1 and n2');
    end if;
end;
/

4. nested if statement

declare
    n1 number(3):=160;
    n2 number(3):=150;
    n3 number(3):=200;
begin
    if(n1>n2)then
        if(n1>n3)then
            dbms_output.put_line('n1 is greater than n2 and n3');
        else
            dbms_output.put_line('n3 is greater than n1 and n2');
        end if;
    elsif(n2>n3)then
        dbms_output.put_line('n2 is greater than n1 and n3');
    else 
        dbms_output.put_line('n3 is greater than n1 and n2');
    end if;
end;
/

----------------------------------------------- ALTER MAIN TABLE

EG: according to age set employee is
below 18 = minor
>=18  <60 major
>=60 senior citizen

select * from check_constraint;

alter table check_constraint add (age_status number(2));
alter table check_constraint modify (age_status varchar2(15));

--ALTERS IN MAIN TABLE ITSELF
--ALTER 1 ROW

declare
    a_id number:=1001;
    b_age number(3);
begin
    select age into b_age from check_constraint where id=a_id;
    if(b_age<18) then
        update check_constraint set age_status='minor' where id=a_id;
    elsif(b_age between 18 and 59) then
        update check_constraint set age_status='major' where id=a_id;
    else
        update check_constraint set age_status='senior citizen' where id=a_id;
    end if;
end;
/

--ALTER ALL ROW
-- cursor method

declare
    a_id number(5);
    b_age number(5);
    cursor age_calculate is select id,age from check_constraint;
begin
    open age_calculate;
    loop
        fetch age_calculate into a_id,b_age;
        exit when age_calculate%notfound;
        
        if(b_age<18) then
             update check_constraint set age_status='minor' where id=a_id;
        elsif(b_age between 18 and 59) then
            update check_constraint set age_status='major' where id=a_id;
        else
            update check_constraint set age_status='senior citizen' where id=a_id;
        end if;
    end loop;
end;
/


----------------------------------------------------------------      STORED PROCEDURE         ------------------------------------------------------------------

Stored in the database for reuse since it has name
Can be reused multiple times.
syntax :
create procedure procedurename
as

begin

end;
/

Basically the procedure or stored procedure is classified into two types:
Procedures are of two types, 
1. procedure with parameter
2. procedure without parameter

set serveroutput on;

1. procedure with parameter

create procedure procedure_1
as
    n1 number;
    n2 number;
    n3 number;
begin
    n1:=10444;
    n2:=2076878;
    n3:= n1+n2;
    dbms_output.put_line('value of n3 is '||n3);
end;
/

2. procedure without parameter

create or replace procedure procedure_2(n1 number, n2 number)
as
    n3 number;
begin
    n3:= n1+n2;
    dbms_output.put_line('value of n3 from parameterised procedure is '||n3);
end;
/

execute procedure_2(200,400);
exec procedure_2(400,400);

--(1)
DECLARE
  N1 NUMBER;
  N2 NUMBER;
BEGIN
  N1 := 10;
  N2 := 30;
  procedure_2(N1, n2); --function called
END;
/

--(2)
--cursor method
alter table employee add (emp_age number(10));
alter table employee add (emp_status varchar2(10));

create or replace procedure procedure3
as
    cursor emp_cursor is select emp_id, emp_age from employee;
    id number(4);
    age number(3);
begin
    open emp_cursor;
    loop
        fetch emp_cursor into id, age;
        exit when emp_cursor%notfound;
        
        if(age<18)then
            update employee set emp_status='Minor' where emp_id = id;
        elsif(age between 18 and 59) then--elsif(age>=18 and age<60) then
            update employee set emp_status='Major' where emp_id = id;
        else
            update employee set emp_status='Senior Citizen' where emp_id = id;
        end if;
        
    end loop;    
end;
/        