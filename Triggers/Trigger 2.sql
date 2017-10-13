delimiter //
create trigger trig2 before delete on SubjectTable
for each row
begin
delete from UserInfo where SubjectCode=old.SubjectCode;
delete from SubjectCoordinator where SubjectCode=old.SubjectCode;
delete from AssignmentExist where SubjectCode=old.SubjectCode;
delete from UnitTest where SubjectCode=old.SubjectCode;
delete from SubmissionTicket where SubjectCode=old.SubjectCode;
delete from FileDatabase where SubjectName=old.SubjectName;
end//

