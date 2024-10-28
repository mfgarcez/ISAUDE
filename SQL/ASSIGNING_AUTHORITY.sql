SELECT  --L.ID ID_LOGIN, l.login, L.PASSWORD, l.status STATUS_LOGIN, U.ID ID_USER, u.name NAME_USER ,u.status STATUS_USER, P.ID ID_PROVIDER, p.name,P.CD CD_PROVIDER, p.status STATUS_PRIV, c.cd CD_CONTACT, ct.cd CD_CONTACTTYPE,d.name NAME_DEPT,D.CD CD_DEPT
l.id ,  l.login, 'senha', c.id_dept, l.CD cd_login, l.password
FROM ACCESS_CONTROL.AC_LOGIN L
LEFT JOIN ACCESS_CONTROL.AC_USER U ON u.id = l.id_user
LEFT JOIN ACCESS_CONTROL.AC_PROVIDER P ON P.id = l.id_provider
LEFT JOIN ACCESS_CONTROL.ac_contact C ON c.id_user = u.id
LEFT JOIN ACCESS_CONTROL.ac_contact_type CT ON CT.id = c.id_type
LEFT JOIN ACCESS_CONTROL.ac_user_dept UD ON ud.id_user = u.id
LEFT JOIN ACCESS_CONTROL.ac_department D ON d.id = ud.id_dept
where c.id_dept is not null
order by c.id_dept desc
;

UPDATE ACCESS_CONTROL.AC_LOGIN
SET    
       PASSWORD       = lower( standard_hash(  UPPER('FUABC_HEMC_MV') ||'fuabc!hemc10mv', 'MD5') )
WHERE  ID             = 28;



        values (ACCESS_CONTROL.SQ_AC_LOGIN.NEXTVAL,UPPER(v_login_cd),UPPER(v_usuario), lower(standard_hash(UPPER(v_usuario)||v_senha, 'MD5')), (SELECT ID FROM ACCESS_CONTROL.AC_USER WHERE CD = UPPER(v_usuario)), '1', '1',SYSDATE, SYSDATE, '1');
