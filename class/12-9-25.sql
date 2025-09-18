

select * from 
(select rank() over (order by salary) as rank_,empid,salary from empl)as emp
where rank_ = 2;