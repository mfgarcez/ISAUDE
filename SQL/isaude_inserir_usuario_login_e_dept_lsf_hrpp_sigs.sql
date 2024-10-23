-- @STATEMENT
declare
/*
OSS: Lar São Francisco
Hospital: Hospital Regional Presidente Prudente
Assigning_Authority: lsf:hrpp_sigs
Id Instituição: 12
Usuário: lsf_hrpp_sigs
Senha: lsf!hrpp12sigs
Ambiente: Desenvolvimento
*/
    v_usuario varchar2(30):= 'lsf_hrpp_sigs';
    v_nome varchar2(100):= 'LSF - Hospital Regional Presidente Prudente';
    v_senha varchar2(30):= 'lsf!hrpp12sigs';
    v_dept_cd varchar2(30):= '12';
    v_login_cd varchar2(30):= 'lsf:hrpp_sigs';
	v_email varchar(100):= 'mfgarcez@sp.gov.br';
	
	V_MAX_ID NUMBER := 0;
	
	V_DEPTID NUMBER :=0;
	V_USERID NUMBER :=0;

	PROCEDURE SEQ_ATUALIZAR_VALOR(P_SEQ_NOME IN VARCHAR2, P_MAX_ID IN NUMBER) IS 
		V_QUERY VARCHAR2(200);
	BEGIN
		DBMS_OUTPUT.PUT_LINE('INICIO DA CORRECAO PARA A SEQ '||P_SEQ_NOME||' E P_MAX_ID '||P_MAX_ID);
		V_QUERY := 'DROP SEQUENCE '||P_SEQ_NOME;
		EXECUTE IMMEDIATE V_QUERY;
		V_QUERY := 'CREATE SEQUENCE '||P_SEQ_NOME||' INCREMENT BY 1 START WITH '||(P_MAX_ID+1);
		EXECUTE IMMEDIATE V_QUERY;
	END;
BEGIN
	select max(id) INTO V_MAX_ID from access_control.ac_department;
	SEQ_ATUALIZAR_VALOR(P_SEQ_NOME => 'ACCESS_CONTROL.sq_ac_department', P_MAX_ID => V_MAX_ID);
	select max(id) INTO V_MAX_ID from access_control.AC_LOGIN;
	SEQ_ATUALIZAR_VALOR(P_SEQ_NOME => 'ACCESS_CONTROL.SQ_AC_LOGIN', P_MAX_ID => V_MAX_ID);
	select max(id) INTO V_MAX_ID from access_control.AC_USER;
	SEQ_ATUALIZAR_VALOR(P_SEQ_NOME => 'ACCESS_CONTROL.SQ_AC_USER', P_MAX_ID => V_MAX_ID);
	select max(id) INTO V_MAX_ID from access_control.AC_CONTACT;
	SEQ_ATUALIZAR_VALOR(P_SEQ_NOME => 'ACCESS_CONTROL.SQ_AC_CONTACT', P_MAX_ID => V_MAX_ID);

	INSERT INTO ACCESS_CONTROL.AC_DEPARTMENT (ID, CD, NAME, STATUS, DT_CREATE, DT_UPDATE, ID_USER_UPDATE) VALUES (access_control.sq_ac_department.nextval, v_dept_cd, v_nome, '1', SYSDATE, SYSDATE, 1) RETURNING id INTO V_DEPTID;
	dbms_output.put_line('DEPARTAMENTO INSERIDO '||v_dept_cd||' - '||v_nome||' WITH ID '||V_DEPTID);
    INSERT INTO ACCESS_CONTROL.AC_USER (ID, CD, NAME, STATUS, DT_CREATE, DT_UPDATE, ID_USER_UPDATE) VALUES (ACCESS_CONTROL.SQ_AC_USER.NEXTVAL, UPPER(v_usuario), v_nome, '1', SYSDATE, SYSDATE, '1') RETURNING id INTO V_USERID;
    dbms_output.put_line('USUARIO INSERIDO '||v_usuario||' - '||v_nome||' WITH ID '||V_USERID);
    INSERT INTO ACCESS_CONTROL.AC_LOGIN (ID,CD,LOGIN,PASSWORD,ID_USER,ID_PROVIDER,STATUS,DT_CREATE,DT_UPDATE,ID_USER_UPDATE) 
        values (ACCESS_CONTROL.SQ_AC_LOGIN.NEXTVAL,UPPER(v_login_cd),UPPER(v_usuario), lower(standard_hash(UPPER(v_usuario)||v_senha, 'MD5')), (SELECT ID FROM ACCESS_CONTROL.AC_USER WHERE CD = UPPER(v_usuario)), '1', '1',SYSDATE, SYSDATE, '1');
    --SELECT * FROM DUAL;
    dbms_output.put_line('LOGIN INSERIDO '||v_usuario);
	INSERT INTO ACCESS_CONTROL.AC_USER_DEPT (ID_USER, ID_DEPT) VALUES (V_USERID, V_DEPTID);
    dbms_output.put_line('USER_DEPT INSERIDO COM IDUSER '||V_USERID||' E IDDEPT '||V_DEPTID);
	Insert into ACCESS_CONTROL.AC_CONTACT (ID,CD,ID_USER,ID_DEPT,ID_TYPE,DESCRIPTION,STATUS,DT_CREATE,DT_UPDATE,ID_USER_UPDATE) values (ACCESS_CONTROL.SQ_AC_CONTACT.NEXTVAL,v_email,V_USERID,V_DEPTID,'1','E-mail principal','1',SYSDATE,SYSDATE,'1');
    dbms_output.put_line('CONTATO INSERIDO '||v_email);
    COMMIT;
END;
/