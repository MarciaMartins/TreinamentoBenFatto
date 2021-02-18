-- SEQUENCE (30.01)
-- DEPT
CREATE SEQUENCE BF_SEQ_DEPT
MINVALUE 1
MAXVALUE 99999
START WITH 7
INCREMENT BY 1; 

-- FUNC
CREATE SEQUENCE BF_SEQ_FUNC
MINVALUE 1
MAXVALUE 99999
START WITH 16
INCREMENT BY 1;

-- estado atual 
SELECT BF_SEQ_DEPT.nextval FROM dual;

-- PROCEDURE PARA INSERT NA TABELA DEPT
create or replace PROCEDURE BF_INSERT_DEPT(p_nome_dept IN bf_dept.nome_dept%TYPE,
                                           p_loc_dept IN bf_dept.loc_dept%TYPE,
                                           p_resp IN bf_dept.responsavel%TYPE) 

AS 
BEGIN
  IF p_resp IS NOT NULL THEN 
    INSERT INTO bf_dept (id_dept, nome_dept, loc_dept, responsavel) 
        VALUES (BF_SEQ_DEPT.nextval, p_nome_dept, p_loc_dept, p_resp);
  ELSE
    INSERT INTO bf_dept (id_dept, nome_dept, loc_dept) 
        VALUES (BF_SEQ_DEPT.nextval, p_nome_dept, p_loc_dept);
  END IF;

EXCEPTION
    WHEN OTHERS THEN
           raise;

END;


-- PROCEDURE PARA INSERT NA TABELA FUNC



            
SELECT * FROM bf_dept;
SELECT * FROM bf_func;