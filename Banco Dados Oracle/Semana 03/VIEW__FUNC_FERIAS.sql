--- QUANTOS MESES FALTAM/PASSARAM PARA OBTER O DIREITO DE FÉRIAS

CREATE OR REPLACE VIEW V_FUNC_FERIAS AS
(SELECT f.nome_func, d.nome_dept, f.data_contratacao,
    TRUNC(TRUNC(MONTHS_BETWEEN(SYSDATE, data_contratacao))/12) || ' meses' MESES_DIREITO_FERIAS,
    TRUNC(MONTHS_BETWEEN(SYSDATE, data_contratacao)) || ' meses' QTD_MESES_PASSADOS_CONTRATACAO      
         
    FROM bf_func f,
         bf_dept d
    WHERE f.id_dept = d.id_dept); 
    CREATE OR REPLACE VIEW V_FUNC_FERIAS AS
(SELECT f.nome_func, d.nome_dept, f.data_contratacao,
    TRUNC(TRUNC(MONTHS_BETWEEN(SYSDATE, data_contratacao))/12) || ' meses' MESES_DIREITO_FERIAS,
    TRUNC(MONTHS_BETWEEN(SYSDATE, data_contratacao)) || ' meses' QTD_MESES_PASSADOS_CONTRATACAO      
         
    FROM bf_func f,
         bf_dept d
    WHERE f.id_dept = d.id_dept); 







