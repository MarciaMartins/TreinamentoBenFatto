--SEMANA 03 - (Documento de refer�ncia GIT Semana03_Conte�doBancoDadosOracle)

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
--Conforme exerc�cios de Loop

--  (26.01)
--Conforme exerc�cios de FUNCOES

--  (26.01)
--Conforme exerc�cios de FUNCOES

-- VIEWS (29.01)
--Conforme exerc�cios de VIEWS

-- SEQUENCE (30.01)

-- views (01.02)


