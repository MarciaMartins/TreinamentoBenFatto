--------------------------------------------------------
--  DDL for Procedure RETORNA_NOME_FUNC_E_DEPT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "SYSTEM"."RETORNA_NOME_FUNC_E_DEPT" (v_id_func IN bf_func.id_func%TYPE,
                                            v_nome_func OUT bf_func.nome_func%TYPE,
                                            v_nome_dept OUT bf_dept.nome_dept%TYPE)

AS
n_existe NUMBER;
BEGIN
    BEGIN
        SELECT 1
        INTO n_existe
        FROM bf_func
        WHERE id_func = v_id_func;
    EXCEPTION
        when others then
        n_existe:=0;
    END;
    
    IF n_existe=1 THEN
        SELECT f.nome_func, d.nome_dept
        INTO v_nome_func, v_nome_dept
        FROM bf_func f,
             bf_dept d
        WHERE f.id_func = v_id_func
        AND f.id_dept = d.id_dept;
      ELSE
        v_nome_func := 'FUNCIONARIO INEXISTENTE';
      END IF;
END RETORNA_NOME_FUNC_E_DEPT;

/
