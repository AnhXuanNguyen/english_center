use englishcenter;

delimiter $$
create procedure selectallcourse()
begin
    select * from course;
end $$
delimiter ;
call selectallcourse();

delimiter $$
create procedure selectallcoursebyteacherid(
    teacher_id int
)
begin
    select c.id, c.name
        from course c join teacher_course tc on c.id = tc.courseid join teacher t on tc.teacherid = t.id where t.id = teacher_id;
end $$
delimiter ;
call selectallcoursebyteacherid(1);

delimiter $$
create procedure selectcoursebyid(
    course_id int
)
begin
    select * from course where id = course_id;
end $$
delimiter ;

call selectcoursebyid(1);

delimiter $$
create procedure updatecourse(
    course_id int,
    newname varchar(50)
)
begin
    update course set name = newname where id = course_id;
end $$
delimiter ;
call updatecourse(1, 'Toeic 450');
delimiter $$

select * from course;
create procedure insertcourse(
    newname varchar(50)
)
begin
    insert into course (name) values (newname);
end $$
delimiter ;
call  insertcourse(?);

delimiter $$
create procedure selectteacherbycourseid(
    course_id int
)
begin
    select t.id, t.name, t.email, t.dob, t.address, t.phone, t.username, t.password
    from teacher t join teacher_course tc on t.id = tc.teacherid join course c on c.id = tc.courseid where c.id = course_id;
end $$
delimiter ;
call selectteacherbycourseid(3);
drop procedure selectteacherbycourseid;

delimiter $$
create procedure dropcoursebyid(
    teacher_id int,
    course_id int
)
begin
    update grade set courseteacherid = null where courseteacherid = (select id from teacher_course where teacherid = teacher_id and courseid = course_id);
    delete from teacher_course where teacherid = teacher_id and courseid = course_id;
    delete from course where id = course_id;
end $$
delimiter ;
drop procedure dropcoursebyid;
call dropcoursebyid(8, 2);

delimiter $$
create procedure dropcoursebycid(
    course_id int
)
begin
    delete from course where id = course_id;
end $$
delimiter ;

call dropcoursebycid(1);
