use englishcenter;

delimiter $$
create procedure selectallcourse()
begin
    select * from course;
end $$
delimiter ;
call selectallcourse();