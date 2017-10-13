delimiter //
create trigger trig3 before delete on AssignmentExist
for each row
begin
call deleteA(old.SubjectCode,old.AssignmentName);
end//


