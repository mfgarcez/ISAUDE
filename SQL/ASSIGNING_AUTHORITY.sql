SELECT L.ID ID_LOGIN, l.login, l.status STATUS_LOGIN, U.ID ID_USER, u.name NAME_USER, u.status STATUS_USER, P.ID ID_PROVIDER, p.name,P.CD CD_PROVIDER, p.status STATUS_PRIV, c.cd CD_CONTACT, ct.cd CD_CONTACTTYPE,d.name NAME_DEPT,D.CD CD_DEPT
FROM ACCESS_CONTROL.AC_LOGIN L
LEFT JOIN ACCESS_CONTROL.AC_USER U ON u.id = l.id_user
LEFT JOIN ACCESS_CONTROL.AC_PROVIDER P ON P.id = l.id_provider
LEFT JOIN ACCESS_CONTROL.ac_contact C ON c.id_user = u.id
LEFT JOIN ACCESS_CONTROL.ac_contact_type CT ON CT.id = c.id_type
LEFT JOIN ACCESS_CONTROL.ac_user_dept UD ON ud.id_user = u.id
LEFT JOIN ACCESS_CONTROL.ac_department D ON d.id = ud.id_dept
where d.id >= 6
;