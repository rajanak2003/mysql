create or replace view user_view as 
select * from employees  where salary > 70000;

select * from user_view;

create or replace view joins_view as
select e.* from employees e join departments d where e.department_id = d.department_id and e.salary > 60000;


drop view joins_view;

select * from departments;

select * from joins_view where emp_id = 101;

select * from (select * , row_number() over (order by department_id) as rownumber from employees) as emp_row where rownumber > 3;

select * , ntile(2) over (order by name)  as ntile_ from employees;

select ltrim(name),rtrim(name),trim(name) from employees;  

select trim(both '*' from '*test*');

select department_id,group_concat(name separator '*') from employees group by department_id;


-- replace
SELECT REPLACE('MySQL is easy', 'easy', 'powerful') AS Result;
SELECT REPLACE('111-222-333', '-', ':') AS Result;

-- LPAD() / RPAD()
SELECT LPAD('123', 6, '0') AS LeftPad;  
SELECT RPAD('123', 6, '*') AS RightPad;

-- SUBSTRING()
SELECT SUBSTRING('Database', 1, 4) AS Result;
SELECT SUBSTRING('Database',5) AS Result;


-- replace -- > prasanna , nn , aa --> prasaaaa

-- tran - > prasanna , aa , ny  --> 


