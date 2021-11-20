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