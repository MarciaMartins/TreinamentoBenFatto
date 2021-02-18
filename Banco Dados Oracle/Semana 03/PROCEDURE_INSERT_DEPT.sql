--------------------------------------------------------
--  DDL for Procedure BF_INSERT_DEPT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "SYSTEM"."BF_INSERT_DEPT" (p_nome_dept IN bf_dept.nome_dept%TYPE,
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

/
