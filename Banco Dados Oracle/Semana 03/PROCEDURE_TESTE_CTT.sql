--------------------------------------------------------
--  DDL for Procedure TESTE_CTT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "SYSTEM"."TESTE_CTT" (
                v_id_func IN bf_func.id_func%TYPE,
                v_nome_func OUT bf_func.nome_func%TYPE,
                v_salario_func OUT bf_func.salario_func%TYPE
)
IS
    BEGIN
       SELECT f.nome_func, f.salario_func  
         INTO v_nome_func, v_salario_func  
       FROM bf_func f 
       WHERE f.id_func=v_id_func;
END teste_ctt;

/
