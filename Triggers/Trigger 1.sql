

delimiter //


create trigger trig1 before delete on LoginTable
for each row
begin
delete from UserInfo where UserID=old.UserID;
delete from SubjectCoordinator where UserID=old.UserID;
end//


