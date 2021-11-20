use englishcenter;
delimiter $$
create procedure selectallministry()
begin
    select * from ministry;
end $$
delimiter ;
call selectallministry();

delimiter $$
create procedure selectministrybyid(
    ministry_id int
)
begin
    select * from ministry where id = ministry_id;
end $$
delimiter ;
call selectministrybyid(1);

delimiter $$
create procedure updateministry(
    ministry_id int,
    newname varchar(50),
    newemail varchar(50),
    newdob varchar(50),
    newaddress varchar(50),
    newphone varchar(50)
)
begin
    update ministry set name = newname, email = newemail, dob = newdob, address = newaddress, phone = newphone where id = ministry_id;
end $$
delimiter ;
call updateministry(?, ?, ?, ?, ?, ?);

delimiter $$
create procedure updatepasswordministry(
    ministry_id int,
    newpass varchar(50)
)
begin
    update ministry set password = newpass where id = ministry_id;
end $$
delimiter ;
call updatepasswordministry(?, ?);

delimiter $$
create procedure dropministry(
    ministry_id int
)
begin
    delete from ministry where id = ministry_id;
end $$
delimiter ;
call dropministry(?);

delimiter $$
create procedure insertministry(
    newname varchar(50),
    newemail varchar(50),
    newdob varchar(50),
    newaddress varchar(50),
    newphone varchar(50),
    newusername varchar(50),
    newpassword varchar(50)
)
begin
    insert into ministry(name, email, dob, address, phone, username, password) VALUES (newname, newemail, newdob, newaddress, newphone, newusername, newpassword);
end $$
delimiter ;
call insertministry(?, ?, ?, ?, ?, ?, ?);

