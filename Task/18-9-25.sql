-- 1. GROUP_CONCAT() 

-- 1. List all subjects each student has enrolled in as a single row. 
select distinct (name ) , group_concat(title separator ",") as asd
 from enrollments e join students s on e.studentid = s.studentid 
 join courses c on c.courseId = e.courseid group by s.name;
 
 -- 2. Show all department names each employee has worked in (comma separated). 
 select department_id , group_concat(name separator ",") as names from employees group by department_id;
 
 -- 3. Concatenate all phone numbers of each customer separated by ;. 
 select emp_id , group_concat(salary separator ",") as sal from employees group by emp_id;
 
 -- 4. Display a list of all product names under each category. 
select category , group_concat(product_name separator ",") from products group by category;
 
 -- 5. Combine all cities where a supplier delivers into a single string. 
 select supplier_name , group_concat(cities separator ",") from delivery_partners group by cities;
 
 -- 2. TRIM() 
 
 -- 6. Remove extra spaces before and after employee names in the employee table. 
 select trim(name) from employees;
 
 -- 7. Clean up email addresses where users have mistakenly added spaces. 
 select trim(email) from employees;
 
 -- 8. Show names after trimming only leading spaces. 
 select ltrim(name) from employees;
 
 -- 9. Show names after trimming only trailing spaces.               
 select rtrim(name) from employees;
 
 -- 10. Remove # characters from both sides of a string. 
 select trim(both "*" from name) from employees;
 
 -- 3. ROW_NUMBER() 
 
 -- 11. Assign a unique row number to employees ordered by salary. 
 select * , row_number() over (order by salary) from employees ;
 
 -- 12. Within each department, number employees based on their hire date. 
 select * , row_number() over (partition by city order by joindate) from students;
 
 
 -- 13. List the top 3 earners in each department using row numbers. 
 select * from (
 select *,row_number() over (order by salary) as order_ from employees) as cur_table 
 where order_ <= 3;

 --  14. Generate sequential numbers for students ordered by marks. 
 select * , row_number() over (order by salary) from employees;
 
 -- 15. Rank orders in each region by order amount. 
 select *,row_number() over (order by order_amount) from orders;
 
 -- 4. VIEW 
 
 -- 16. Create a view that shows only employees with salary greater than 50,000.
 create or replace view sal_greater_than_50000 as
 select * from employees where salary > 50000;
 
 select * from sal_greater_than_50000;
 
 
 -- 17. Create a view for students who scored more than 80 in exams. 
 create or replace view mark_80 as
 select * from students where mark > 80;

 -- 18. Create a view that displays all products out of stock. 
 create or replace view out_of_stock as
 select * from product_details where product_available <= 0;
 
 -- 19. Create a view that joins orders and customers for quick access. 
 create or replace view order_customer as
 select * from orders join customer;
 
 -- 20. Create a view to show monthly sales summary.
 create or replace view monthly_sal as
 select emp_id , salary from employees group by emp_id , salary;
 
 -- 5. NTILE(n) 
 
 -- 21. Divide employees into 4 performance groups based on salary.
 select * ,ntile(4) over (order by salary) from employees;
 
 -- 22. Assign students into 3 grade buckets based on marks. 
 select * , ntile(3) over (order by mark) from students;
 
 -- 23. Split salespeople into 5 groups according to sales value.
 select *, ntile(5) over (order by sales_value) from sales;
 
 -- 24. Divide marathon runners into quartiles based on completion time.
 select * , ntile(4) over (order by completion_time) from marathon;
 
 -- 25. Classify customers into 2 halves: high spenders and low spenders.
 select * , ntile(2) over (order by amount_spended) from customers;
 
 -- 6. REPLACE() 
 
 -- 26. Replace all occurrences of "colour" with "color" in a product description. 
 update products set appearaance = replace(appearance,"colour","color") where appearance like '%colour%';
 
 -- 27. Replace dashes - with slashes / in date strings.
 update students set joindate = replace (joindate , '-','/') ;
 
 
-- 28. Replace old company name with new one in the clients table. 
update clien set company_name = replace (company_name , "aefg","leo") where comapny_name like "%aefg%";

-- 29. Replace spaces with underscores in usernames. 
update students set name = replace(name , " ", "_" ) ;

-- 30. Replace "N/A" with NULL in the data column.
update students set phone_number = "N/A" where phone_number = null;

-- 7. LPAD() / RPAD() 
-- 31. Pad employee IDs with leading zeros to make them 6 digits. 
select * , lpad(emp_id,6,'0') from employees;

-- 32. Right-pad customer names with * to make them 15 characters long.
select * ,rpad(name,15,"*") from employees;

-- 33. Display order numbers with leading ORD- prefix using LPAD. 
select emp_id , lpad(emp_id,length(emp_id) + 4,"ORD-") from employees;

-- 34. Format account numbers so they are always 10 digits (with LPAD). 
select lpad("123456789",10,0) from dual;

-- 35. Pad invoice numbers with trailing # until they reach length 12.
select rpad("pv35pcdd",12,"#") from dual;

-- 8. SUBSTRING() 

-- 36. Extract the first 3 letters of each employee name. 
select substring(name,1,3) from employees;

-- 37. Show last 4 digits of each phone number. 
select substring("123456789",-4) from dual;

-- 38. Display the middle 2 characters of product codes.
select substring("123456",length("123456")/2,2) from dual;

-- 39. Extract year from a date string using substring. 
select substring("10-1-2005",6,4) from dual;

-- 40. Show initials of each employee (first letter of first name + last name).
select concat(substring("prem",1,1) , substring("kumar",1,1)) from dual;



 