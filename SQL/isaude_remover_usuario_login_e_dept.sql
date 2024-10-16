--@STATEMENT
declare
    v_cd_usuario varchar2(30):= 'emri';
	v_cd_dept varchar2(30):= '6';
	
	V_MAX_USERID NUMBER := 0;
	V_MAX_DEPTID NUMBER := 0;

BEGIN
	select COALESCE(max(id), 0) INTO V_MAX_USERID from access_control.AC_USER where upper(cd) = upper(v_cd_usuario);
	select COALESCE(max(id), 0) INTO V_MAX_DEPTID from access_control.AC_DEPARTMENT where upper(cd) = upper(v_cd_dept);
	
	delete from ACCESS_CONTROL.ac_session where id_login in (select id from ACCESS_CONTROL.AC_LOGIN where id_user = V_MAX_USERID);
	delete from ACCESS_CONTROL.AC_LOGIN where id_user = V_MAX_USERID;
	delete from ACCESS_CONTROL.ac_contact where id_user = V_MAX_USERID;
	delete from ACCESS_CONTROL.ac_user_dept where id_user = V_MAX_USERID;
	delete from ACCESS_CONTROL.AC_USER where id = V_MAX_USERID;

	delete from ACCESS_CONTROL.ac_user_dept where id_dept = V_MAX_DEPTID;
	delete from ACCESS_CONTROL.AC_DEPARTMENT where id = V_MAX_DEPTID;
    --COMMIT;
END;
/