select * from students;

select * from courses;

select * from enrollments;

--  1: A teacher wants a list of all subjects each student has enrolled in.

select name , sub from (select s.name as name , group_concat(c.title separator ',') as sub
from enrollments e join students s on e.studentid = s.studentid 
join courses c on e.courseid = c.courseId group by name) as tab;

--  2: Cleaning up user input (removing extra spaces).
select trim("           trim          ") from dual;

-- 3: Ranking employees within each department.
select * , row_number() over (partition by department_id order by department_id) as  rank_
from employees ;

-- 4: Create a view for reusable queries (high salary employees).
create or replace view high_salary_emp as
select * from employees where salary = (select max(salary) from employees);
 
-- 5: Divide students into 3 groups based on marks.
select * , ntile(3) over (order by salary) from employees;

-- 6: Correct misspelled words in a product description.
select replace("prem raj","raj","kumar") from dual;

-- 7: Format employee IDs with leading zeros (LPAD) and right padding with stars (RPAD).
select rpad(lpad(emp_id,length(emp_id)+1,0),length(emp_id) + 2,"*") from employees;

--  8: Extract first 3 letters of employee names.
select substring(name,1,3) from employees;
