create table students_details(
roll_no int auto_increment primary key,
name varchar(10),
department varchar(40),
mark int
);

INSERT INTO students_details (name, department, mark) VALUES
('Arun', 'Computer Science', 85),
('Divya', 'Mechanical', 78),
('Kiran', 'Electrical', 92),
('Sneha', 'Civil', 67),
('Ravi', 'Information Tech', 88),
('Meena', 'Electronics', 74),
('Vijay', 'Computer Science', 90),
('Anu', 'Mechanical', 81),
('Raj', 'Civil', 69),
('Priya', 'Information Tech', 90);

select *,rank() over (partition by department order by mark) as rank_, dense_rank() over (partition by department order by mark) as dense from students_details;

select *,rank() over (order by mark) as rank_, dense_rank() over (order by mark) as dense from students_details;

select mark,department,rank() over (order by mark )  as rank_ from students_details;

-- temporary table
create temporary table temp_table(id int,name varchar(20));

select * from temp_table;
 
 select round(4.4), round(4.5) from dual;

select abs(5),abs(-5) from dual;

select sign(-8),sign(18) from dual;

select mod(48,300),mod(3,4),mod(7,3) from dual;

select round(rand()*10) from dual;

select truncate(rand()*10,0) from dual;
 
select now();

select curdate();

select current_time();

select curtime();

select utc_timestamp();


