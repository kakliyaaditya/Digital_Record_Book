delimiter //
create trigger trig4 before delete on GroupTable
for each row
begin
delete from UserInfo where GroupCode=old.GroupCode;
delete from FileDatabase where GroupName=old.GroupName;
end//
