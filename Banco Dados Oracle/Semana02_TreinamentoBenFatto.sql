--SEMANA 02 - (Documento de referência GIT Semana02_ConteúdoBancoDadosOracle)

--FUNÇÃO SYSDATE (ITEM 1 GIT Semana02_BancoDadosOracle)
SELECT sysdate FROM dual; 

-- 2. FUNÇÃO TO_CHAR 
--2.1. Transformando um campo do tipo data em String 
SELECT nome_func, TO_CHAR(data_contratacao, 'mm/yyyy') from bf_func;

--1.2.2. Transformando um campo númerico em String
SELECT nome_func, TO_CHAR(id_func, '00') from bf_func;
SELECT nome_func, TO_CHAR(cpf, '999g999g999g99') from bf_func;

-- 3 FUNÇÃO TO_DATE
-- 3.1. Calculo com TO_TADE
SELECT TO_DATE('18/01/2015','DD-MM-YYYY') + 5 FROM DUAL

-- 3.2. Subtração entre duas datas
SELECT TO_DATE ('30/01/2015','DD/MM/YYYY') - TO_DATE ('01/01/2015','DD/MM/YYYY') subtracao_datas FROM DUAL; 

--3.3. Formatação da data e hora 
SELECT TO_DATE ('30/01/2015','DD/MM/YYYY') + 6/24 data_hora FROM DUAL; 

-- 4. ADD_MONTHS
SELECT ADD_MONTHS(sysdate,1) mes_que_vem FROM DUAL; 

--5. MONTHS_BETWEEN
SELECT id_func, nome_func, data_contratacao,
    TRUNC (MONTHS_BETWEEN(SYSDATE, data_contratacao)) || ' meses' MESES
FROM bf_func;

-- 6. LAST DAY
SELECT id_func, nome_func, data_contratacao,
    LAST_DAY(data_contratacao) ULTIMO_DIA_MES
FROM bf_func;

-- 7. NEXT_DAY
SELECT NEXT_DAY(SYSDATE,6) PROXIMO_SEIS_DIAS
FROM DUAL;






-- detalhamento das tabelas
DESC bf_dept;
DESC bf_func;

SELECT * FROM bf_dept;
SELECT * FROM bf_func;

DESC testes_funcoes;
SELECT * FROM testes_funcoes;