delimiter $$
create function discount (amount int,discount int)
returns int
deterministic
begin 
	declare discount_ int;
    declare total int;
    
    set discount_ = (amount * discount)/ 100;
    set  total = amount - discount_;
    return total;
end $$
delimiter ;

drop function discount;

select discount(1000,1);


select * from emp;

alter table emp add column department varchar(30);

select * from emp where age between 20 and 25;

insert into emp values(5,"prasanna",30,123467850,"admin");

select * from  emp where name like "p%";

select * from emp where age >= 20 and name like "p%";

select * from emp where age not between 20 and 30;

select * from emp where contact like "%789%";

select cast((123.456) as decimal(10,2));

select department , count(*) from emp group by department;
