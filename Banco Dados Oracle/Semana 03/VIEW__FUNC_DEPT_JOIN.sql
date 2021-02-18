               
CREATE OR REPLACE VIEW V_FUNC_DEPT AS
(SELECT f.id_func, f.nome_func, f.cpf, d.nome_dept, d.loc_dept
FROM bf_func f,
     bf_dept d
WHERE f.id_dept = d.id_dept); 

SELECT * FROM v_func_dept;

