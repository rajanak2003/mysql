-- cte
with xyz as 
(select department_id , sum(salary) as sal from employees group by department_id)
select * from xyz join employees e on e.salary  >=  xyz.sal and e.department_id = xyz.department_id;

with empsalary as
(select department_id , sum(salary) as dep_salary from employees  group by department_id)
select dep_salary , lag(dep_salary,1,0 ) over (order by department_id) as lag_  from empsalary;


-- recursive
with recursive number as(
select 1 as n
union all 
select n+1 from number where n < 10)
select * from number;


