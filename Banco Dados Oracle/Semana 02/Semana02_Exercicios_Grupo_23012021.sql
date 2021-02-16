-- Semana 02 Exercicio

--EXERCÍCIOS 18.01

--2. FUNÇÃO TO_CHAR
--Data em String
SELECT id_func, nome_func, data_contratacao,
   TO_CHAR(data_contratacao,'MM/YY') 
FROM bf_func;

--Númerico em String
SELECT TO_CHAR(id_func,'00'), nome_func, data_contratacao
FROM bf_func;

-- 4. ADD_MONTHS
SELECT id_func, nome_func, data_contratacao,
    ADD_MONTHS(data_contratacao,12) FERIAS 
FROM bf_func;

--5. MONTHS_BETWEEN
SELECT id_func, nome_func, data_contratacao,
    TRUNC (MONTHS_BETWEEN(SYSDATE, data_contratacao)) || ' meses' MESES
FROM bf_func;

-- 6. LAST DAY
SELECT id_func, nome_func, data_contratacao,
    LAST_DAY(data_contratacao) ULTIMO_DIA_MES
FROM bf_func;

-- 7. NEXT_DAY
SELECT id_func, nome_func, data_contratacao,
    LAST_DAY(data_contratacao) ULTIMO_DIA_MES
FROM bf_func;








