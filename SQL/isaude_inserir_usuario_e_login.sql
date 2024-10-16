--@STATEMENT
declare
    v_usuario varchar2(30):= 'jfmoreira';
    v_nome varchar2(30):= 'Joao Fernandes Moreira';
    v_senha varchar2(30):= '@jfmoreira9';
BEGIN
    INSERT INTO ACCESS_CONTROL.AC_USER 
        (ID, CD, NAME, STATUS, DT_CREATE, DT_UPDATE, ID_USER_UPDATE) 
        VALUES (ACCESS_CONTROL.SQ_AC_USER.NEXTVAL, UPPER(v_usuario), v_nome, '1', SYSDATE, SYSDATE, '1');
    dbms_output.put_line('USUARIO INSERIDO '||v_usuario||' - '||v_nome);
    INSERT INTO ACCESS_CONTROL.AC_LOGIN 
        (ID,CD,LOGIN,PASSWORD,ID_USER,ID_PROVIDER,STATUS,DT_CREATE,DT_UPDATE,ID_USER_UPDATE) 
        values (ACCESS_CONTROL.SQ_AC_LOGIN.NEXTVAL,'ALIAS',UPPER(v_usuario), lower(standard_hash(UPPER(v_usuario)||v_senha, 'MD5')), (SELECT ID FROM ACCESS_CONTROL.AC_USER WHERE CD = UPPER(v_usuario)), '1', '1',SYSDATE, SYSDATE, '1');
    --SELECT * FROM DUAL;
    dbms_output.put_line('LOGIN INSERIDO '||v_usuario);
    COMMIT;
END;
/