--------------------------------------------------------
--  DDL for Function RETURN_NAME
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "SYSTEM"."RETURN_NAME" (p_i_id_func IN bf_func.id_func%TYPE)

RETURN VARCHAR2 
IS

p_o_nome_func VARCHAR2(50);

BEGIN
    SELECT nome_func
    INTO p_o_nome_func
    FROM bf_func
    WHERE id_func = p_i_id_func;
    
    RETURN p_o_nome_func;

EXCEPTION
    WHEN OTHERS THEN
        RETURN (null);
  
END RETURN_NAME;

/
