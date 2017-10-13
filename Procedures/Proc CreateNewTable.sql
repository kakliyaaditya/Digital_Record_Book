delimiter //

CREATE PROCEDURE aa(tbl_name VARCHAR(255), group_name varchar(255), username varchar(255)) NOT DETERMINISTIC READS SQL DATA SQL SECURITY DEFINER
BEGIN
  SET @table_name = tbl_name;
  set @grpname = group_name;
  set @usrname = username;
    SET @grpcode := (select GroupCode from GroupTable where 
(GroupTable.GroupName = @grpname));

	set @q = 'INSERT INTO AssignmentExist values ( @table_name, @grpname, @usrname)';

  PREPARE sam1 FROM @q;
  EXECUTE sam1;
  DEALLOCATE PREPARE sam1;


SET @subcode := (select UserInfo.SubjectCode from UserInfo where 
(UserInfo.UserID = @usrname and UserInfo.GroupCode = @grpcode));

 
  SET @i := (select GroupStart.StartRollno from GroupStart,GroupTable where 
(GroupTable.GroupName = @grpname and GroupStart.GroupID =GroupTable.GroupCode));
  set @c=0;


 
 SET @sql_text1 = concat( 'CREATE TABLE IF NOT EXISTS ',@table_name,' (Rollno int(4), SubjectCode int(3), GroupCode int (4), ScheduledDate varchar(20), SubmissionDate varchar(20), Marks int(4), Approved int(1))');


  PREPARE stmt1 FROM @sql_text1;
  EXECUTE stmt1;
  DEALLOCATE PREPARE stmt1;

set @st = concat('SELECT count(*) INTO @var1 FROM ',@table_name,' WHERE SubjectCode = ',@subcode,' and GroupCode = ',@grpcode);
prepare smt from @st;
	execute smt;
	deallocate prepare smt;

if(@var1 = 0) then
some_label:LOOP
        set @st = concat( 'INSERT INTO ',@table_name,' (Rollno, SubjectCode, Groupcode, ScheduledDate, SubmissionDate, Marks, Approved) VALUES (@i+@c,@subcode,@grpcode,"dd-mm-yyyy","dd-mm-yyyy", 0,0)');
	prepare smt from @st;
	execute smt;
	deallocate prepare smt;
	set @c = @c + 1;
        IF @c > 19 THEN LEAVE some_label; END IF;
    END LOOP;

end if;
END
//
delimiter ;


