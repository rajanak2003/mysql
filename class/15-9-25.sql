-- MySQL
SELECT NOW();       -- 2025-07-21 14:30:45
SELECT CURDATE();   -- 2025-07-21
SELECT CURTIME();   -- 14:30:45
SELECT UTC_TIMESTAMP(); -- UTC time
SELECT YEAR(NOW())   AS year;     -- 2025
SELECT MONTH(NOW())  AS month;    -- 7
SELECT DAY(NOW())    AS day;      -- 21
SELECT HOUR(NOW())   AS hour;     -- 14
SELECT MINUTE(NOW()) AS minute;   -- 30
SELECT SECOND(NOW()) AS second;   -- 45
-- Format date as DD-MM-YYYY
SELECT DATE_FORMAT(NOW(), '%d-%m-%Y') AS formatted_date;  

-- Format as Weekday, Month Name, Day, Year
SELECT DATE_FORMAT(NOW(), '%W %M %d %Y %i %c') AS full_format; 
-- Output: Monday July 21 2025
SELECT DATE_ADD(NOW(), INTERVAL 7 DAY)   AS next_week;
SELECT DATE_ADD(NOW(), INTERVAL 1 MONTH) AS next_month;
SELECT DATE_SUB(NOW(), INTERVAL 10 DAY)  AS ten_days_ago;
SELECT DATE_SUB(NOW(), INTERVAL 1 YEAR)  AS last_year;
-- Days between two dates
SELECT DATEDIFF('2025-09-1', '2025-01-01') AS days_diff;  -- 20

-- Hours between two timestamps
SELECT TIMESTAMPDIFF(HOUR, '2025-07-01 10:00:00', '2025-07-02 12:00:00') AS hours_diff; -- 26
SELECT LAST_DAY(NOW()) AS last_day_of_month;  
SELECT DATE_FORMAT(NOW(), '%Y-%m-01') AS first_day_of_month;
SELECT STR_TO_DATE('21-07-2025', '%d-%m-%Y'); -- Convert string to date
SELECT UNIX_TIMESTAMP(NOW()); -- Get Unix timestamp
SELECT FROM_UNIXTIME(1757915599); -- Convert Unix timestamp to date



select * from employees;

insert into employees values(106,'alex',55000,20);

-- 1. Find Employees Who Earn More Than the Average Salary of Their Department
select * from employees e1 where salary >
(select avg(salary) from employees e2 where e1.department_id = e2.department_id);

-- 2. List Employees Who Earn More Than the Highest Paid Employee in Department 10
select * from employees where salary > 
(select max(salary) from employees where department_id = 10);

-- 3. Find Products That Have Never Been Ordered and Belong to a Category That Has at Least 3 Products Ordered

-- 4. List Customers Who Placed Orders in Every Month of the Year 2024
select customer_id from orders where year(order_date) = 2024 
group by customer_id having count(distinct(month(order_date) = 12));

-- 5. Get the Employee(s) with the Second Highest Salary in Each Department
select * from employees  e1 where salary < 
(select max(salary) from employees e2 
group by department_id having e1.department_id = e2.department_id);

-- 6. Identify Orders Whose Total Amount is Greater Than the Average of All Orders in the Same Month
 select * from products where product_id in
 (select product_id from (select product_id , (unit_price * quantity )  as ordered_price from order_details) 
 as ordered where ordered_price > (select avg(unit_price) from order_details));

-- 7. Find the Department(s) with the Highest Average Salary Among Those Having More Than 5 Employees
select * from employees where salary > 
(select avg(salary) from employees group by department_id having count(*) > 5);

-- 8. List Employees Who Have the Same Salary as Someone in a Different Department
select * from employees e1 join employees e2
where e1.salary = e2.salary and
e1.department_id != e2.department_id;

-- 9. Display Customers Who Ordered All Products from a Specific Category ('Electronics')
select distinct customer_id from orders where order_id in 
(select order_id from order_details where product_id in
(select product_id from products where category ="electronics"));
select * from products;
select * from orders;
select * from order_details;

-- 10. Find the Products Whose Sales Quantity in Any Month Is Higher Than the Total Annual Quantity of the Same Product in 2023



CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price int
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_Date date
    );
    
    CREATE TABLE order_details (
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO products (product_id, product_name, category, price) VALUES
(1, 'Smartphone', 'Electronics', 30000),
(2, 'Laptop', 'Electronics', 60000),
(3, 'Headphones', 'Electronics', 2000),
(4, 'Desk Chair', 'Furniture', 5000),
(5, 'Bookshelf', 'Furniture', 7000),
(6, 'Water Bottle', 'Accessories', 500),
(7, 'Backpack', 'Accessories', 1500),
(8, 'Monitor', 'Electronics',12000);


INSERT INTO orders (order_id, customer_id, order_date) VALUES
(101, 1, '2024-01-15'),
(102, 2, '2024-02-20'),
(103, 1, '2024-03-05'),
(104, 3, '2024-03-25'),
(105, 2, '2024-04-10'),
(106, 1, '2024-05-18'),
(107, 3, '2024-06-22'),
(108, 1, '2024-07-30'),
(109, 2, '2024-08-14'),
(110, 3,'2024-09-09');

INSERT INTO order_details (order_id, product_id, quantity, unit_price) VALUES
(101, 1, 1, 30000),
(101,3, 2, 2000),
(102, 2, 1, 60000),
(103, 4, 1, 5000),
(104, 5, 1, 7000),
(105, 6, 3, 500),
(106, 7, 2, 1500),
(107, 8, 1, 12000),
(108, 1, 1, 30000),
(109, 2, 1, 60000),
(110,3,2,2000);