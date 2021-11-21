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