use englishcenter;

delimiter $$
create procedure selectallteacher()
begin
    select * from teacher;
end $$
delimiter ;
call selectallteacher();