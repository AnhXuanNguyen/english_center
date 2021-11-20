use englishcenter;
delimiter $$
create procedure selectadmin()
begin
    select * from admin;
end $$
delimiter ;
call selectadmin();

delimiter $$
create procedure updateadmin(
    newname nvarchar(50),
    newemail varchar(50),
    newdob varchar(20),
    newaddress varchar(50),
    newphone varchar(10),
    user_name varchar(50)
)
begin
    update admin set name = newname, email = newemail, dob = newdob, address = newaddress, phone = newphone where username = user_name;
end $$
delimiter ;
drop procedure updateadmin;
call updateadmin(?, ?, ?, ?, ?, ?);

delimiter $$
create procedure changepasswordadmin(
    user_name varchar(50),
    newpassword varchar(50)
)
begin
    update admin set password = newpassword where username = user_name;
end $$
delimiter ;
drop  procedure changepasswordadmin;
call changepasswordadmin(?, ?);