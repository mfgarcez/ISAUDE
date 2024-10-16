BEGIN

  --################################# Inicio da inclusão dos comandos #################################
  /*Refs: PK:-02260;FK-02275;IDX:-00955;IST,UPD,DEL,COMM:-00001;C_TB:-00955;M_COL:-02260;GRAN,A_COL:-01430*/

  -- Apenas para HOMOLOGAÇÃO e PRODUÇÃO
   -- 01917 bypass de usuário não existem para DBDATAREADER em desenvolvimento
   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ACCESS_CONTROL.AC_ACTION TO DBDATAREADER');
   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ACCESS_CONTROL.AC_ADDRESS TO DBDATAREADER');
   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ACCESS_CONTROL.AC_CONTACT TO DBDATAREADER');
   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ACCESS_CONTROL.AC_CONTACT_TYPE TO DBDATAREADER');
   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ACCESS_CONTROL.AC_DEPARTMENT TO DBDATAREADER');
   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ACCESS_CONTROL.AC_FUNCTIONALITY TO DBDATAREADER');
   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ACCESS_CONTROL.AC_LOG TO DBDATAREADER');
   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ACCESS_CONTROL.AC_LOGIN TO DBDATAREADER');
   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ACCESS_CONTROL.AC_MODULE TO DBDATAREADER');
   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ACCESS_CONTROL.AC_PROFILE TO DBDATAREADER');
   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ACCESS_CONTROL.AC_PROFILE_ACTION TO DBDATAREADER');
   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ACCESS_CONTROL.AC_PROVIDER TO DBDATAREADER');
   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ACCESS_CONTROL.AC_SESSION TO DBDATAREADER');
   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ACCESS_CONTROL.AC_SYSTEM TO DBDATAREADER');
   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ACCESS_CONTROL.AC_SYSTEM_PROVIDER TO DBDATAREADER');
   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ACCESS_CONTROL.AC_USER TO DBDATAREADER');
   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ACCESS_CONTROL.AC_USER_ACTION TO DBDATAREADER');
   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ACCESS_CONTROL.AC_USER_AS_GRANT TO DBDATAREADER');
   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ACCESS_CONTROL.AC_USER_AS_GRANT_ACTION TO DBDATAREADER');
   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ACCESS_CONTROL.AC_USER_AS_GRANT_PROFILE TO DBDATAREADER');
   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ACCESS_CONTROL.AC_USER_DEPT TO DBDATAREADER');
   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ACCESS_CONTROL.AC_USER_MODULE TO DBDATAREADER');
   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ACCESS_CONTROL.AC_USER_PROFILE TO DBDATAREADER');
   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ACCESS_CONTROL.AC_USER_SYSTEM TO DBDATAREADER');

   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ISAUDE.CONFIGURACAO TO DBDATAREADER');
   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ISAUDE.CONSULTA TO DBDATAREADER');

   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ISAUDE.CRUD_BOTAO TO DBDATAREADER');
   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ISAUDE.CRUD_CAMPO TO DBDATAREADER');
   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ISAUDE.CRUD_DASHBOARD TO DBDATAREADER');
   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ISAUDE.CRUD_DROPDOWN TO DBDATAREADER');
   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ISAUDE.CRUD_FILTRO TO DBDATAREADER');
   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ISAUDE.CRUD_GRID TO DBDATAREADER');
   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ISAUDE.CRUD_MENU TO DBDATAREADER');
   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ISAUDE.CRUD_PARAMETROS TO DBDATAREADER');
   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ISAUDE.CRUD_SUMARIO TO DBDATAREADER');
   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ISAUDE.CRUD_TABELA TO DBDATAREADER');
   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ISAUDE.CRUD_VALIDACAO TO DBDATAREADER');

   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ISAUDE.EMAIL_TEMPLATE TO DBDATAREADER');
   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ISAUDE.INSTITUICAO TO DBDATAREADER');
   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ISAUDE.INSTITUICAO_DS TO DBDATAREADER');
   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ISAUDE.INTEGRACAO_TMP TO DBDATAREADER');
   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ISAUDE.PBI_RELATORIO TO DBDATAREADER');
   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ISAUDE.PBI_RELATORIO_PUBLICO TO DBDATAREADER');
   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ISAUDE.PBI_USUARIO TO DBDATAREADER');
   ISAUDE.PKG_ADMINISTRACAO.EXEC_COMANDO(-01917, 'GRANT SELECT ON ISAUDE.PBI_USU_RELATORIO TO DBDATAREADER');

  COMMIT;  
END;
/