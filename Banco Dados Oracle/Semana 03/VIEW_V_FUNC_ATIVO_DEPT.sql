-- SOMENTE FUNCIONARIOS ATIVOS, DATA DE CONTRATAÇ~SO E SALARIO
CREATE OR REPLACE VIEW V_FUNC_ATIVO_DEPT AS
(SELECT f.id_func, f.nome_func, f.cpf, d.nome_dept, d.loc_dept, f.data_contratacao, f.sal
FROM bf_func f,
     bf_dept d
WHERE f.id_dept = d.id_dept
AND f.status_func='S'); 

--SELECT * FROM V_FUNC_ATIVO_DEPT;
