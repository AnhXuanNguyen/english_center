use englishcenter;

delimiter $$
create procedure selectallteacher()
begin
    select * from teacher;
end $$
delimiter ;
call selectallteacher();

delimiter $$
create procedure selectteacherbyid(
    teacher_id int
)
begin
    select * from teacher where id = teacher_id;
end $$
delimiter ;
call selectteacherbyid(1);

delimiter $$
create procedure updatepasswordteacher(
    teacher_id int,
    newpass varchar(50)
)
begin
    update teacher set password = newpass where id = teacher_id;
end $$
delimiter ;
call updatepasswordteacher(?, ?);

delimiter $$
create procedure insertteacher(
    in newname varchar(50),
    newemail varchar(50),
    newdob varchar(50),
    newaddress varchar(50),
    newphone varchar(10),
    newusername varchar(50),
    newpassword varchar(50),
    out teacher_id int
)
begin
    insert into teacher(name, email, dob, address, phone, username, password) VALUES (newname, newemail, newdob, newaddress, newphone, newusername, newpassword);
    set teacher_id = LAST_INSERT_ID();
end $$
delimiter ;

call insertteacher(?, ?, ?, ?, ?, ?, ?, ?);

delimiter $$
create procedure insertcourseteacherid(
    teacher_id int,
    course_id int
)
begin
    insert into teacher_course(teacherid, courseid) VALUES (teacher_id, course_id);
end $$
delimiter ;
call insertcourseteacherid(?, ?);

delimiter $$
create procedure updateteacher(
    in teacher_id int,
    newname varchar(50),
    newemail varchar(50),
    newdob varchar(50),
    newaddress varchar(50),
    newphone varchar(10)
)
begin
    update teacher set name = newname, email = newemail, dob = newdob, address = newaddress, phone = newphone where id = teacher_id;
end $$
delimiter ;

call updateteacher(?, ?, ?, ?, ?, ?);

delimiter $$
create procedure dropteacherbyidtc(
    teacher_id int,
    course_id int
)
begin
    update grade set courseteacherid = null where courseteacherid = (select id from teacher_course where teacherid = teacher_id and courseid = course_id);
    delete from teacher_course where teacherid = teacher_id and courseid = course_id;
end $$
delimiter ;
drop procedure dropteacherbyidtc;
call dropteacherbyidtc(3,2);

delimiter $$
create procedure dropteacher(
    teacher_id int
)
begin
    delete from teacher where id = teacher_id;
end $$
delimiter ;
call dropteacher(3);


