delimiter $$
create function avgmark(mark1 int , mark2 int, mark3 int,mark4 int, mark5 int)
returns  int
deterministic
begin
	declare total int;
    set total = mark1 + mark2 + mark3 + mark4 + mark5;
    return total/5;
end $$
delimiter ;

select avgmark(20,20,20,20,20);