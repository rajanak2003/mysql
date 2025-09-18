use hr;

delimiter $$
create procedure updatesalary(in empid_ int,in salary_ int,out message varchar(40))
begin
declare currentsalary int;
select salary into currentsalary from employees where emp_id = empid_;
if(salary_ > currentsalary ) then
	update employees set salary = salary_ where emp_id = empid_ ;
    set message = 'updated successfully';
else 
	set message = 'salary is not matched the requirements';
end if;
end $$
delimiter ;


select * from employees;
select * from departments;
set @msg='';
call updatesalary(101,60000,@msg);
select @msg;

-- another methood 
delimiter $$
create procedure updatesalary_anotherMethod(in empid_ int,in salary_ int)
begin
declare currentsalary int;
declare message varchar(30);
select salary into currentsalary from employees where emp_id = empid_;
if(salary_ > currentsalary ) then
	update employees set salary = salary_ where emp_id = empid_ ;
    set message = 'updated successfully';
    select message;
else 
	set message = 'salary is not matched the requirements';
    select message;
end if;
end $$
delimiter ;

call updatesalary_anotherMethod(101,75000);




select * from employees where department_id = (select department_id from departments where department_name = 'hr') and emp_id = 101;

select department_id from departments  where department_id = (select department_id from employees where emp_id = 101) ;

select * from departments;

select * from employees; 

select department_id from departments where department_name = 'hr';

select department_id from employees where emp_id=101; 

delimiter $$
create procedure updatedepartment(in department_name_ varchar(20),in empid_ int)
begin 
declare current_department_ int;
declare current_department_id int;
declare message varchar(20);
select department_id into current_department_ from departments where department_name = department_name_;
select department_id into current_department_id from employees where emp_id=empid_;
if (current_department_ = current_department_id) then
	set message = 'same so dont need to change';
	select meassage;
else
	update employees set department_id = current_department_ where emp_id = empid_;
    set message = 'updated successfully';
    select message;
end if;
end $$ 
delimiter ;

call updatedepartment('hr',102)

