use englishcenter;

delimiter $$
create procedure selectallgrade()
begin
    select g.id, g.name, tc.teacherid, tc.courseid
    from grade g left join teacher_course tc on tc.id = g.courseteacherid;
end $$

delimiter ;
drop procedure selectallgrade;
call selectallgrade();

delimiter $$
create procedure insertgrade(
    newname varchar(50)
)
begin
    insert into grade(name) values (newname);
end $$
delimiter ;
call insertgrade(?);

delimiter $$
create procedure selectgradebyid(
    grade_id int
)
begin
    select * from grade where id = grade_id;
end $$

delimiter ;
call selectgradebyid(1);

delimiter $$
create procedure updategrade(
    teacher_id int,
    course_id int,
    grade_id int,
    newname varchar(50)
)
begin
    update grade set name = newname, courseteacherid = (select id from teacher_course where teacherid = teacher_id and courseid = course_id) where id = grade_id;
end $$

delimiter ;

call updategrade(14,8,3,'cuc cu');

delimiter $$
create procedure dropgrade(
    grade_id int
)
begin
    delete from grade where id = grade_id;
end $$
delimiter ;

call dropgrade(3);