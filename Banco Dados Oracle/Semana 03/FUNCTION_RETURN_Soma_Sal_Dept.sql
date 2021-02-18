--------------------------------------------------------
--  DDL for Function RETURN_SOMA_SAL_IDDEPT
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "SYSTEM"."RETURN_SOMA_SAL_IDDEPT" (p_i_id_dept IN bf_func.id_dept%Type)

RETURN NUMBER 
AS 

CURSOR C_BUSCAFUNC IS
    SELECT NVL(salario_func,0) salario_func
    FROM bf_func
    WHERE id_dept = p_i_id_dept;

n_existe number;
n_soma_sal number;

BEGIN
    BEGIN
        SELECT 1
        INTO n_existe
        FROM bf_dept
        WHERE id_dept = p_i_id_dept;
    
    EXCEPTION 
        WHEN OTHERS THEN
        n_existe:=0;
    END;  

    IF (n_existe = 1) THEN
        n_soma_sal:=0;
        FOR r_C_BUSCAFUNC IN C_BUSCAFUNC LOOP
            n_soma_sal := n_soma_sal + r_C_BUSCAFUNC.salario_func;
          END LOOP;
        RETURN  n_soma_sal;
    else 
        n_soma_sal:=-1;
        RETURN n_soma_sal;
    END IF;    
    EXCEPTION
       WHEN OTHERS THEN
            RETURN null;
    
                
END RETURN_SOMA_SAL_IDDEPT;

/
