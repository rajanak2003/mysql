create table students(
studentId int,
name varchar(20),
email varchar(20),
city varchar(20),
joindate date);

INSERT INTO Students (StudentID, Name, Email, City, JoinDate) VALUES
('1', 'Anika', 'anika@email.com', 'Chennai', '2025-01-15'),
('2', 'Rohan', 'rohan@email.com', 'Bangalore', '2025-02-10'),
('3', 'Priya', 'priya@email.com', 'Hyderabad', '2025-03-05'),
('4', 'Karthik', 'karthik@email.com', 'Pune', '2025-04-01');

create table courses (
courseId int,
title varchar(20),
category varchar(20),
price int);

INSERT INTO Courses (CourseID, Title, Category, Price) VALUES
('201', 'React for Beginners', 'Frontend', 2500),
('202', 'Mastering Spring Boot', 'Backend', 3000),
('203', 'Flutter App Development', 'Mobile Dev', 2800),
('204', 'SQL & Database Design', 'Database', 2200);

create table enrollments(
enrollid int,
studentid int references students(studentid),
courseid int references course(courseid),
enrolldate date,
status varchar(20));

INSERT INTO Enrollments (EnrollID, StudentID, CourseID, EnrollDate, Status) VALUES
('301', '1', '201', '2025-01-20', 'Active'),
('302', '2', '202', '2025-02-15', 'Completed'),
('303', '3', '203', '2025-03-10', 'Active'),
('304', '4', '204', '2025-04-05', 'Dropped');


create table payments(
paymentid int,
studentid int references students(studentid),
amount int,
paydate date);
INSERT INTO Payments (PaymentID, StudentID, Amount, PayDate) VALUES
('401', '1', 2500, '2025-01-21'),
('402', '2', 3000, '2025-02-16'),
('403', '3', 2800, '2025-03-11'),
('404', '4', 1000, '2025-04-06');


-- 1.Add a new student who joined today. 
insert into students values (5,'prem','prem@gmail.com','chennai',current_date());

-- 2.Insert 3 new courses into the Courses table.
 INSERT INTO Courses (CourseID, Title, Category, Price) VALUES
('201', 'React', 'Frontend', 2500),
('202', 'Spring Boot', 'Backend', 3000),
('203', 'Flutter', 'Mobile Dev', 2800),
('204', 'SQL', 'Database', 2200);

-- 3.A student enrolls in 2 courses — insert into Enrollments.
insert into enrollments values(305,5,203,'2024-03-15','completed');

-- 4. Record a payment for a student in the Payments table.
INSERT INTO Payments (PaymentID, StudentID, Amount, PayDate) VALUES
('401', '1', 2500, '2025-01-21'),
('402', '2', 3000, '2025-02-16'),
('403', '3', 2800, '2025-03-11'),
('404', '4', 1000, '2025-04-06');

-- 5.Insert multiple rows of students in a single query.
INSERT INTO Students (StudentID, Name, Email, City, JoinDate) VALUES
('1', 'Anika', 'anika@email.com', 'Chennai', '2025-01-15'),
('2', 'Rohan', 'rohan@email.com', 'Bangalore', '2025-02-10'),
('3', 'Priya', 'priya@email.com', 'Hyderabad', '2025-03-05'),
('4', 'Karthik', 'karthik@email.com', 'Pune', '2025-04-01');

-- 6–9: UPDATE Scenarios

-- 6.Update a student’s city from Chennai to Bangalore.
update students set city = "bangalore" where studentid = 1;

-- 7.Increase the price of all Programming courses by 10%.
update courses set price = price* 1.10;

-- 8.Update enrollment status to Completed for a student who finished a course.
update enrollments set status = 'completed' where enrollid = 301;

-- 9.Correct a wrongly typed student email.
update students set email = 'prem.kumar@gmail.com' where name = 'prem';

-- 10-12 DELETE & TRUNCATE Scenarios

-- 10.Delete a student who requested account removal.
delete from students where studentid = 3;

-- 11.Delete all enrollments for a specific course.
delete from enrollments where studentid = 3;

-- 12.Truncate the Payments table before re-importing fresh data.
truncate table payments;

INSERT INTO Payments (PaymentID, StudentID, Amount, PayDate) VALUES
('401', '1', 2500, '2025-01-21'),
('402', '2', 3000, '2025-02-16'),
('403', '4', 1000, '2025-04-06');

-- 13–14: ALTER & DROP Scenarios
-- 13.Add a new column PhoneNumber to the Students table.
alter table students add column phone_number int;

-- 14.Drop the Payments table (assume migrating to another system).
create table dummy_payment as select * from payments;
drop table payments;

-- 15–17: Aggregate Function Scenarios

-- 15.Find the total number of students enrolled in all courses.
select count(distinct studentid) as total from enrollments;

-- 16.Calculate the average price of courses by category.
select avg(price) from courses;

-- 17.Get the highest payment made by any student.
select studentid from payments where  amount = 
(select max(amount) from payments);

-- 18–20: Subquery Scenarios
-- 18.Find students who enrolled in more than 2 courses.
select * from students where studentid in
(select studentid  from enrollments group by studentid having count(*) >= 2);


-- 19.List courses that no one has enrolled in (use NOT IN subquery).
select * from students where studentid not in
(select studentid from enrollments);

-- 20.Find the student who paid the maximum amount (nested subquery).
select * from students where studentid = 
(select studentid from payments where amount = (select max(amount) from payments));


-- 21–22: Stored Procedure Scenarios
-- 21.Write a stored procedure to add a new student (with Name, Email, City).
delimiter $$
create procedure add_students(in name varchar(20),in city varchar(20),in email varchar(30))
begin
declare current_student_count int;
select max(studentid) into current_student_count from students;
insert into students values(current_student_count + 1,name,email,city,curdate(),1234567);
end $$
delimiter ;

call add_students('asdf','wesdcx','aesrdfyg');


-- 22.Write a stored procedure that takes StudentID and returns all courses enrolled by that student.
delimiter $$
create procedure get_courses_by_id(in studentid_ int)
begin
select  title from courses where courseid in 
( select courseid from enrollments where studentid =studentid_);
end $$
delimiter ;

call get_courses_by_id(1);

-- 23–24: Trigger Scenarios
-- 23.Create a trigger on Enrollments that automatically updates Status = 'Active' when a new row is inserted
delimiter $$
create trigger enrollments_for_status before insert on enrollments for each row
begin
set new.status = 'Active';
end $$
delimiter ;

insert into enrollments(enrollid,studentid,courseid,enrolldate) values(307,1,204,curdate());

-- 24.Create a trigger on Payments that prevents inserting negative amounts.
delimiter $$
create trigger payment_neg_amount before insert on payments for each row
begin
if(new.amount <= 0) then
	signal sqlstate '45000'
	set message_text = 'not applicable';
end if;
end $$
delimiter ;

insert into payments values(405,5,-100,curdate());

