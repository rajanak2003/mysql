-- salary --> update --> trigger --> procedure --> update the salary

select * from update_onemp;


update empl set salary=2000 where empid = 2;


delimiter $$
create trigger update_salary_with_procedure before update on empl for each row
begin
call Salary_update(new.empid,new.salary);
end $$
delimiter ;


delimiter $$
create procedure Salary_update(in empid_ int,in salary_ int)
begin
declare current_salary int;
declare name_of_emp varchar(30);
select salary into current_salary from empl where empid = empid_;
select name into name_of_emp from empl where empid = empid_;
if(current_salary < salary_) then
	insert into update_onemp values (empid_,name_of_emp ,current_salary,salary_,now(),"salary updated successfully");
else
	insert into update_onemp values (empid_,name_of_emp ,current_salary,salary_,now(),"salary not updated");
end if;
end $$
delimiter $$
 


