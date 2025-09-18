select * from employees;

-- scenario 5
select * from employees where name like "a%";

-- scenario 6
select * from employees where name like "%san%";

-- scenario 7
select * from employees where name like "%a";

-- scenario 8
select count(*),department from employees group by department having count(*) > 2 order by avg(salary) desc;  