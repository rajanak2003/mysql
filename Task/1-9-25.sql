use hr;

create table store1 (product_id int primary key,
 vegitable_name varchar(20) , 
 vegitable_price int);
 
 create table store2 (product_id int primary key,
 vegitable_name varchar(20) , 
 vegitable_price int);
 
 insert into store1 values (1,"broccoli",50),(2,"cabbage",20),(3,"carrot",30),(4,"beetroot",50);
 
 insert into store2 values (1,"broccoli",50),(2,"sweet potato",20),(3,"carrot",30),(4,"radish",50);
 
 select * from store1 join store2 on store1.vegitable_name = store2.vegitable_name;
 
 