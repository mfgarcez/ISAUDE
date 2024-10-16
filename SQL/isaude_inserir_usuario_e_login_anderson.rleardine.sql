--@STATEMENT
declare
    v_usuario varchar2(30):= 'anderson.rleardine';
    v_nome varchar2(30):= 'Anderson Rodrigo Leardine';
    v_senha varchar2(30):= '@Anderson';
	v_email varchar(100):= 'anderson.rleardine@apoioprodesp.sp.gov.br';
    
	V_USERID NUMBER :=0;
    V_MAX_ID NUMBER := 0;

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
    select coalesce(max(id), 0) INTO V_MAX_ID from access_control.AC_LOGIN;
	SEQ_ATUALIZAR_VALOR(P_SEQ_NOME => 'ACCESS_CONTROL.SQ_AC_LOGIN', P_MAX_ID => V_MAX_ID);
	select coalesce(max(id), 0) INTO V_MAX_ID from access_control.AC_USER;
	SEQ_ATUALIZAR_VALOR(P_SEQ_NOME => 'ACCESS_CONTROL.SQ_AC_USER', P_MAX_ID => V_MAX_ID);
	select coalesce(max(id), 0) INTO V_MAX_ID from access_control.AC_CONTACT;
	SEQ_ATUALIZAR_VALOR(P_SEQ_NOME => 'ACCESS_CONTROL.SQ_AC_CONTACT', P_MAX_ID => V_MAX_ID);

    INSERT INTO ACCESS_CONTROL.AC_USER (ID, CD, NAME, STATUS, DT_CREATE, DT_UPDATE, ID_USER_UPDATE) VALUES (ACCESS_CONTROL.SQ_AC_USER.NEXTVAL, UPPER(v_usuario), v_nome, '1', SYSDATE, SYSDATE, '1') RETURNING id INTO V_USERID;
    dbms_output.put_line('USUARIO INSERIDO '||v_usuario||' - '||v_nome||' WITH ID '||V_USERID);
    INSERT INTO ACCESS_CONTROL.AC_LOGIN (ID,CD,LOGIN,PASSWORD,ID_USER,ID_PROVIDER,STATUS,DT_CREATE,DT_UPDATE,ID_USER_UPDATE) 
        values (ACCESS_CONTROL.SQ_AC_LOGIN.NEXTVAL, UPPER(v_usuario), UPPER(v_usuario), lower(standard_hash(UPPER(v_usuario)||v_senha, 'MD5')), (SELECT ID FROM ACCESS_CONTROL.AC_USER WHERE CD = UPPER(v_usuario)), '1', '1',SYSDATE, SYSDATE, '1');
    dbms_output.put_line('LOGIN INSERIDO '||v_usuario);
	Insert into ACCESS_CONTROL.AC_CONTACT (ID,CD,ID_USER,ID_DEPT,ID_TYPE,DESCRIPTION,STATUS,DT_CREATE,DT_UPDATE,ID_USER_UPDATE) values (ACCESS_CONTROL.SQ_AC_CONTACT.NEXTVAL,v_email,V_USERID,null,'1','E-mail principal','1',SYSDATE,SYSDATE,'1');
    dbms_output.put_line('CONTATO INSERIDO '||v_email);
    COMMIT;
END;
/
