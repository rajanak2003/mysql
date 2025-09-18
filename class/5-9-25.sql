select * from employees where salary > (select avg(salary) from employees);

select avg(salary) , department from employees group by department having avg(salary) > 60000 ;

-- without having clause
select avg_,dep from (select avg(salary)  as avg_ , department as dep from employees group by department) as salary where avg_ > 60000;


create table employees(emp_id int primary key, name varchar(30),salary int , department_id int references departments(department_id));

create table departments (department_id int primary key, department_name varchar(30),location varchar(30));

insert into departments values(10,"HR",1700),(20,"sales",1700),(30,"IT",1800);

insert into employees values(105,"David",55000,10);

select * from employees;


select * from employees where department_id in (select department_id from departments where location = 1700);