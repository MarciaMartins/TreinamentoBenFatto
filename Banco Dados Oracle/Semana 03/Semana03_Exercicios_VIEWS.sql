-- VIEWS (29.01)
--CRIAR UMA VIEW QUE TRAGA id_func, nome_func, cpf, nomedept, local
CREATE OR REPLACE VIEW V_FUNC_DEPT AS
(SELECT f.id_func, f.nome_func, f.cpf, d.nome_dept, d.loc_dept
FROM bf_func f,
     bf_dept d
WHERE f.id_dept = d.id_dept);


--CRIAR UMA VIEW QUE TRAGA OS FUNCIONARIOS ATIVOS 

CREATE OR REPLACE VIEW V_FUNC_ATIVO_DEPT AS
(SELECT f.id_func, f.nome_func, f.cpf, d.nome_dept, d.loc_dept, f.data_contratacao, f.sal
FROM bf_func f,
     bf_dept d
WHERE f.id_dept = d.id_dept
AND f.status_func='S'); 

-- (29.01)
--- TRAGA NOME DO DEPT, MAIOR SALARIO, MENOR SALARIO E MEDIA DE SALARIOS

 CREATE OR REPLACE VIEW BF_V_FUNC_MAIOR_MENOR_MEDIA AS
  (SELECT d.id_dept, 
        TRUNC(MAX(f.salario_func),2) maior_salario,
        TRUNC(MIN(f.salario_func),2) menor_salario,
        TRUNC(AVG(f.salario_func),2) media_salario 
       
    FROM bf_func f,
         bf_dept d
    WHERE f.id_dept = d.id_dept
    GROUP BY d.id_dept);
    
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
    
-- 

