create table employees (
  id int primary key,
  name varchar(50),
  department varchar(50),
  salary int,
  city varchar(50)
);


INSERT INTO employees (id, name, department, salary, city) VALUES
(1, 'Alice', 'HR', 50000, 'New York'),
(2, 'Bob', 'IT', 70000, 'San Diego'),
(3, 'Charlie', 'HR', 55000, 'New York'),
(4, 'David', 'IT', 80000, 'Boston'),
(5, 'Eva', 'Finance', 60000, 'San Diego'),
(6, 'Frank', 'IT', 75000, 'San Jose'),
(7, 'Grace', 'Finance', 65000, 'New York'),
(8, 'Hannah', 'HR', 52000, 'Boston');


-- scenario 1
select department , count(*)  as Number_count from employees group by department;

-- scenario 2
select department , avg(salary) as avg_salary from employees group by department;

-- scenario 3
select name , salary from employees order by salary desc; 

-- scenario 4
select name ,department , salary from employees order by department asc  , salary asc;