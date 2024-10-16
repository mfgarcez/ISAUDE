WITH base_ref AS (
    SELECT 'RES_ISAUDE' AS table_schema, 'LEITOS_HIST' AS table_name FROM dual
),
REF_COLUMNS AS (
    SELECT 
        BR.table_schema,
        br.table_name,
        c.column_name,
        CASE 
            WHEN pk.column_name IS NOT NULL THEN 'Yes'
            ELSE 'No'
        END AS is_pk,
        CASE 
            WHEN c.data_type = 'CHAR' THEN c.data_type || '(' || c.char_length || DECODE(c.char_used, 'B', ' BYTE', 'C', ' CHAR', NULL) || ')'
            WHEN c.data_type = 'VARCHAR' THEN c.data_type || '(' || c.char_length || DECODE(c.char_used, 'B', ' BYTE', 'C', ' CHAR', NULL) || ')'
            WHEN c.data_type = 'VARCHAR2' THEN c.data_type || '(' || c.char_length || DECODE(c.char_used, 'B', ' BYTE', 'C', ' CHAR', NULL) || ')'
            WHEN c.data_type = 'NCHAR' THEN c.data_type || '(' || c.char_length || DECODE(c.char_used, 'B', ' BYTE', 'C', ' CHAR', NULL) || ')'
            WHEN c.data_type = 'NUMBER' THEN
                CASE 
                    WHEN c.data_precision IS NULL AND c.data_scale IS NULL THEN 'NUMBER'
                    WHEN c.data_precision IS NULL AND c.data_scale IS NOT NULL THEN 'NUMBER(38,' || c.data_scale || ')'
                    ELSE c.data_type || '(' || c.data_precision || ',' || c.data_scale || ')' 
                END
            WHEN c.data_type = 'NVARCHAR' THEN c.data_type || '(' || c.char_length || DECODE(c.char_used, 'B', ' BYTE', 'C', ' CHAR', NULL) || ')'
            WHEN c.data_type = 'NVARCHAR2' THEN c.data_type || '(' || c.char_length || DECODE(c.char_used, 'B', ' BYTE', 'C', ' CHAR', NULL) || ')'
            ELSE c.data_type
        END AS data_type,
        DECODE(c.nullable, 'Y', 'Yes', 'No') AS nullable,
        c.data_default,
        c.column_id,
        com.comments
    FROM sys.all_tab_columns c
    JOIN sys.all_col_comments com ON c.owner = com.owner AND c.table_name = com.table_name AND c.column_name = com.column_name
    LEFT JOIN (
        SELECT acc.OWNER, ACC.TABLE_NAME, ACC.COLUMN_NAME
        FROM all_cons_columns acc
        JOIN all_constraints ac ON acc.constraint_name = ac.constraint_name
        JOIN base_ref br ON ac.owner = br.table_schema AND ac.table_name = br.table_name
        WHERE ac.constraint_type = 'P'
    ) pk ON c.owner = PK.owner AND c.table_name = PK.table_name AND c.column_name = PK.column_name
    JOIN base_ref br ON c.owner = br.table_schema AND c.table_name = br.table_name
    ORDER BY c.column_id
)
SELECT 
  --R.TABLE_SCHEMA, R.TABLE_NAME, COUNT(*) QTD
  *
FROM REF_COLUMNS R
--GROUP BY R.TABLE_SCHEMA, R.TABLE_NAME
ORDER BY R.TABLE_SCHEMA, R.TABLE_NAME, R.column_id
;



-- CREATE TABLE RES.SPL_LOG_LOGIN_BKP2 AS SELECT * FROM RES.SPL_LOG_LOGIN;
