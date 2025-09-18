use hr;

select * from emp;


create table update_salarydetails(
empid int,
name varchar(20),
old_salary  int,
new_salary int,
dateandtime date 
)

delimiter $$
create trigger t1 
before update 
on emp 
for each row
begin
insert into update_salarydetails values(old.empid,old.name,old.salary,new.salary,now());
end $$
delimiter ;

update emp set salary = 20000 where empid = 1;


create table delete_onemp(
empid int ,
name varchar(20),
age int,
contact int,
departtment varchar(20)
);

delimiter $$
create trigger t2 
before delete 
on emp for each row 
begin
insert into delete_onemp value(old.empid,old.name,old.age,old.contact,old.department);
end $$
delimiter ;

delete from emp where empid = 1;


create table insert_onemp (empid int, name varchar(20),age int,contact int,department varchar(30));

delimiter $$ 
create trigger t3 
after insert 
on emp for each row
begin
insert into insert_onemp values(new.empid,new.name,new.age,new.contact,new.department);
end $$
delimiter ;

insert into emp values (1,'prem',22,1324576809,'hr',20000);

select * from insert_onemp ;



