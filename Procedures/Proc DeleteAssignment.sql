delimiter //
drop procedure deleteA;
create procedure deleteA(IN username varchar(5),IN tablename varchar(25))
begin
set @tblname=tablename;
set @subcode=(select SubjectCode from SubjectCoordinator where UserID=username);
select @subcode;

delete from AssignmentExist where AssignmentName=tablename and SubjectCode=@subcode;

set @q=concat('delete from ',@tblname,' where SubjectCode=',@subcode,';');

  PREPARE sam1 FROM @q;
  EXECUTE sam1;
  DEALLOCATE PREPARE sam1;

end//
