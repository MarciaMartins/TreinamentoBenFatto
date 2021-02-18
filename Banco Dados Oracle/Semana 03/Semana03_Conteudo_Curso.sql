--SEMANA 03 - (Documento de referência GIT Semana03_ConteúdoBancoDadosOracle)

--1. PROCEDURES(25.01)

--- TESTE_CTT

create or replace PROCEDURE teste_ctt (
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

-- LOOP (26.01)
--Conforme exercícios de Loop

--  (26.01)
--Conforme exercícios de FUNCOES

--  (26.01)
--Conforme exercícios de FUNCOES

-- VIEWS (29.01)
--Conforme exercícios de VIEWS

-- SEQUENCE (30.01)

-- views (01.02)


