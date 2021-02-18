--------------------------------------------------------
--  DDL for Procedure BUSCA_NOME
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "SYSTEM"."BUSCA_NOME" (v_id_func IN bf_func.id_func%TYPE,
                            v_nome_func OUT bf_func.nome_func%type)
IS
b_existe NUMBER;
s_retorno varchar2(10);

BEGIN
    BEGIN
        SELECT 1
        INTO b_existe
        FROM bf_func
        WHERE id_func = v_id_func;
    EXCEPTION
        when others then
          b_existe := 0;
    END;
    
 IF b_existe = 0 THEN
   v_nome_func := 'FUNCIONARIO INEXISTENTE';
 ELSE
    SELECT nome_func
    INTO v_nome_func
    FROM bf_func 
    WHERE id_func = v_id_func;
 END IF;

END busca_nome;

/
