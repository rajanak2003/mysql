-- subquery task

select * from employees 
where salary > (select avg(salary) from employees);

select * from employees 
where salary = (select max(salary) from employees);

select * from employees where department_id in
(select department_id from employees where name = 'alice');

select * from employees where department_id in
(select department_id from departments where location_id = 1700);

select * from employees 
where salary > 
any(select salary from employees  where department_id = 20);

select * from employees 
where salary > 
any(select salary from employees  where department_id = 10);

select * from employees 
where salary in 
(select salary from employees where department_id = 10);

select * from employees e1 
where salary > (select avg(salary) from employees e2 where e1.department_id = e2.department_id);

select * from employees e1 where not exists 
(select 1 from employees e2 where e2.department_id = e1.department_id);

select * from employees e1
where exists (select 1 from employees e2 where e1.department_id = e2.department_id and salary > 60000);

select * from departments;

select (select department_name from departments d where d.department_id = e.department_id) as department_name ,
 e.*  from employees e;
 
 select max(salary) from employees where salary < (select max(salary) from employees);


select * from employees where department_id =
(select department_id from
(select department_id, avg(salary) av from employees 
 group by department_id order by av desc limit 1) t);
 
 
 update employees set salary = salary * 1.10 where department_id =
 (select department_id from departments where department_name='sales');
 
 select * from employees;
 
 
 delete from employees where department_id =
 (select department_id from departments where location_id = 1800);
 
 
 



