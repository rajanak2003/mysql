delimiter $$
create procedure insert_into_employees (in empid int,in name_ varchar(40),in salary int,in departmentid int)
begin
insert into employees(emp_id,name,salary,department_id) values(empid,name_,salary,departmentid);
end $$
delimiter ;

call insert_into_employees(110,"prasanna",10000,30);

use hr;

select * from employees;