drop table departments;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location_id INT
);


drop table employees;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Insert into departments
INSERT INTO departments (department_id, department_name, location_id) VALUES
(10, 'HR', 1700),
(20, 'Sales', 1700),
(30, 'IT', 1800);

-- Insert into employees
INSERT INTO employees (emp_id, name, salary, department_id) VALUES
(101, 'John', 50000, 10),
(102, 'Alice', 60000, 20),
(103, 'Bob', 45000, 30),
(104, 'Emma', 70000, 20),
(105, 'David', 55000, 10);

select * from employees;

select * from employees e1 where salary > (select avg(salary) from employees e2 where e1.department_id = e2.department_id);


select * from employees where salary > any(select salary from employees where department_id = 20);

select * from employees where salary > all(select salary from employees where department_id = 20);



select * from employees where emp_id >= any(select emp_id from employees where emp_id > 103);

select * from employees where salary > any(select avg(salary) from employees group by department_id);

select * from employees where department_id > any( select department_id from departments where location_id = 1700);

select * from employees e where  exists (select 1 from departments d1 where d1.department_id = e.department_id and location_id=1700)


