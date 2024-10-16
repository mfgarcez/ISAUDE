SELECT * FROM ACCESS_CONTROL.AC_LOGIN WHERE LOGIN = 'L2D';
SELECT * FROM ACCESS_CONTROL.AC_USER WHERE name LIKE '%L2D%';
SELECT * FROM ACCESS_CONTROL.ac_department;
SELECT * FROM ISAUDE.instituicao where inst_cd like '%EMRI%';

INSERT INTO ACCESS_CONTROL.AC_DEPARTMENT (ID, CD, NAME, STATUS, DT_CREATE, DT_UPDATE, ID_USER_UPDATE) VALUES (access_control.sq_ac_department.nextval, '6', 'Instituto de Infectologia Emilio Ribas', '1', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1);

SELECT L.ID ID_LOGIN, l.login, l.status STATUS_LOGIN, U.ID ID_USER, u.name NAME_USER, u.status STATUS_USER, P.ID ID_PROVIDER, p.name,P.CD CD_PROVIDER, p.status STATUS_PRIV, c.cd CD_CONTACT, ct.cd CD_CONTACTTYPE,d.name NAME_DEPT,D.CD CD_DEPT
FROM ACCESS_CONTROL.AC_LOGIN L
LEFT JOIN ACCESS_CONTROL.AC_USER U ON u.id = l.id_user
LEFT JOIN ACCESS_CONTROL.AC_PROVIDER P ON P.id = l.id_provider
LEFT JOIN ACCESS_CONTROL.ac_contact C ON c.id_user = u.id
LEFT JOIN ACCESS_CONTROL.ac_contact_type CT ON CT.id = c.id_type
LEFT JOIN ACCESS_CONTROL.ac_user_dept UD ON ud.id_user = u.id
LEFT JOIN ACCESS_CONTROL.ac_department D ON d.id = ud.id_dept
;


SET SERVEROUTPUT ON;


DELETE FROM ACCESS_CONTROL.AC_SESSION;


select * from isaude.pbi_relatorio;



SELECT L.ID ID_LOGIN, l.login, l.status STATUS_LOGIN, U.ID ID_USER, u.name NAME_USER, u.status STATUS_USER, P.ID ID_PROVIDER, p.name,P.CD CD_PROVIDER, p.status STATUS_PRIV, c.cd CD_CONTACT, ct.cd CD_CONTACTTYPE,d.name NAME_DEPT,D.CD CD_DEPT
FROM ACCESS_CONTROL.AC_LOGIN L
LEFT JOIN ACCESS_CONTROL.AC_USER U ON u.id = l.id_user
LEFT JOIN ACCESS_CONTROL.AC_PROVIDER P ON P.id = l.id_provider
LEFT JOIN ACCESS_CONTROL.ac_contact C ON c.id_user = u.id
LEFT JOIN ACCESS_CONTROL.ac_contact_type CT ON CT.id = c.id_type
LEFT JOIN ACCESS_CONTROL.ac_user_dept UD ON ud.id_user = u.id
LEFT JOIN ACCESS_CONTROL.ac_department D ON d.id = ud.id_dept
where upper(l.login) like '%WEIS%'


WEISLEY.GLORIA

weisley.gloria@saude.sp.gov.br
weisley@sp.gov.br

marcelo.rocha@apoioprodesp.sp.gov.br
mborota@saude.sp.gov.br

select * from ACCESS_CONTROL.ac_contact where id_user = '21'

select * from ACCESS_CONTROL.ac_contact where id_user = '81'



--Select para apresentar os usuários e instituição que estão configurado no ISAUDE
SELECT L.ID ID_LOGIN, l.cd assigningAuthority, l.login, l.status STATUS_LOGIN, U.ID ID_USER, u.name NAME_USER, u.status STATUS_USER, c.cd CD_CONTACT, ct.cd CD_CONTACTTYPE,d.name NAME_DEPT,D.CD DEPT_instituicao
FROM ACCESS_CONTROL.AC_LOGIN L
LEFT JOIN ACCESS_CONTROL.AC_USER U ON u.id = l.id_user
LEFT JOIN ACCESS_CONTROL.AC_PROVIDER P ON P.id = l.id_provider
LEFT JOIN ACCESS_CONTROL.ac_contact C ON c.id_user = u.id
LEFT JOIN ACCESS_CONTROL.ac_contact_type CT ON CT.id = c.id_type
LEFT JOIN ACCESS_CONTROL.ac_user_dept UD ON ud.id_user = u.id
LEFT JOIN ACCESS_CONTROL.ac_department D ON d.id = ud.id_dept
where d.id>=6;


