select crut_id as "id", crut_nome as "nome", crut_nm_tabela as "nomeTabela" from crud_tabela order by 1;


with tc_id_tabela as (select cruc_id_tabela from crud_campo where cruc_id = '60001')
    ,tc_id_campos as (select cruc_id from crud_campo where cruc_id_tabela = (select cruc_id_tabela from tc_id_tabela))
select * from crud_grid where crug_id_usuario in (1) and crug_id_campo not in (-1) and crug_id_campo in (
    select cruc_id from tc_id_campos
);

select
      maiorid.id + rownum as crug_id,
      crug_id_campo,
      2 crug_id_usuario,
      crug_nome,
      crug_gridposition,
      crug_gridwidth,
      crug_gridalign,
      crug_gridfilter,
      ' PADRAO ' user_id_inc,
      user_id_alt
    from
      isaude.crud_grid CG full
      outer join (
        select
          max(crug_id) as id
        from
          isaude.crud_grid
      ) maiorid on maiorid.id > 0
    where
      crug_id_usuario = 1
      and CG.crug_id_campo between 87000
      and 90999
      AND NOT EXISTS (
        SELECT
          1
        FROM
          isaude.crud_grid I_CG
        WHERE
          I_CG.CRUG_ID_CAMPO = CG.CRUG_ID_CAMPO
          AND I_CG.CRUG_ID_USUARIO = 2
      )
;