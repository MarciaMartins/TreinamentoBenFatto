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

----------------------- funções de caracteres (19.02)-------------------
--8. LOWER
SELECT LOWER(f.nome_func), LOWER(d.nome_dept)
FROM bf_func f
    INNER JOIN bf_dept d
    ON f.id_dept = d.id_dept; 

--9. UPPER
SELECT UPPER(f.nome_func), UPPER(d.nome_dept)
FROM bf_func f
    INNER JOIN bf_dept d
    ON f.id_dept = d.id_dept
WHERE UPPER(d.nome_dept) = UPPER('Financeiro');

--10. INITCAP
SELECT INITCAP(f.nome_func), INITCAP(d.nome_dept)
FROM bf_func f
    INNER JOIN bf_dept d
    ON f.id_dept = d.id_dept
WHERE UPPER(d.nome_dept) = UPPER('Financeiro');

--11. CONCAT
SELECT CONCAT(f.data_contratacao, INITCAP(f.nome_func)), d.nome_dept 
FROM bf_func f
    INNER JOIN bf_dept d
    ON f.id_dept = d.id_dept
ORDER BY f.data_contratacao;

--12. LPAD
SELECT LPAD(f.id_func,5,'0'),
       INITCAP(f.nome_func), 
       LPAD(f.cpf,11,'0')    
FROM bf_func f;

--13. RPAD
SELECT CONCAT(LPAD(f.id_func,5,'0'),INITCAP(f.nome_func)),  
        RPAD(f.cpf,20,'0') 
FROM bf_func f
    INNER JOIN bf_dept d
    ON f.id_dept = d.id_dept;      

--14. INSTR
SELECT INITCAP(f.nome_func), UPPER(d.nome_dept),
       INSTR(UPPER(f.nome_func), 'FUNC')
FROM bf_func f
    INNER JOIN bf_dept d
    ON f.id_dept = d.id_dept;

--15. LTRIM
SELECT INITCAP(f.nome_func), 
       LTRIM(f.nome_func)
FROM bf_func f
    INNER JOIN bf_dept d
    ON f.id_dept = d.id_dept;

--16. RTRIM
SELECT INITCAP(f.nome_func), 
       RTRIM(f.nome_func)
FROM bf_func f
    INNER JOIN bf_dept d
    ON f.id_dept = d.id_dept;
    
--17. TRIM
SELECT INITCAP(f.nome_func), 
       TRIM(f.nome_func)
FROM bf_func f
    INNER JOIN bf_dept d
    ON f.id_dept = d.id_dept;    

--18. LENGTH: 
SELECT LENGTH(f.cpf),  
       LENGTH(RPAD(f.cpf,20,'0')) 
FROM bf_func f;   

19. REPLACE: .
SELECT nome_func, REPLACE(TO_CHAR(RPAD(cpf,11,'0'), '999g999g999g99'),'.','-')from bf_func;

20. SUBSTR: .  
21. DECODE: .
22. TRANSLATE: .

----------------------- funções de caracteres (21.02)-------------------

-- 23. NVL
SELECT id_func, nome_func, NVL(salario_func,0), status_func
FROM bf_func
WHERE status_func = 'S';

-- 24. ROUND
SELECT id_func, nome_func, status_func, NVL(salario_func,0), ROUND(salario_func)
FROM bf_func
WHERE status_func = 'S';

-- 25. TRUNC
SELECT id_func, nome_func, status_func, NVL(salario_func,0), ROUND(salario_func), TRUNC(salario_func)
FROM bf_func
WHERE status_func = 'S';

-- trunc definindo o numero de casas
SELECT id_func, nome_func, status_func, NVL(salario_func,0), ROUND(salario_func, 1), TRUNC(salario_func,1)
FROM bf_func
WHERE status_func = 'S';

-- 26. MOD 
SELECT mod(13,2) FROM DUAL;


----------------------- funções de grupo (22.02)-------------------
select * from  bf_func;

-- 27. AVG: 
SELECT TRUNC(AVG(salario_func),2)
FROM bf_func;

-- trazer a media por departamento específico
SELECT TRUNC(AVG(salario_func),2)
FROM bf_func
WHERE id_dept=5;

-- 28. COUNT: 
SELECT count(*)
FROM bf_func
WHERE id_dept=4;

-- 29. MAX
SELECT TRUNC(AVG(salario_func),2), MAX(salario_func)
FROM bf_func
WHERE id_dept=5;

-- 30. MIN
SELECT TRUNC(AVG(salario_func),2), MAX(salario_func), MIN(salario_func)
FROM bf_func
WHERE id_dept=5;

-- 31. SUM
SELECT TRUNC(AVG(salario_func),2), MAX(salario_func), MIN(salario_func), SUM(salario_func)
FROM bf_func
WHERE id_dept=5;
 
-- 32. GROUP BY:.
SELECT d.nome_dept, TRUNC(AVG(f.salario_func),2), MAX(f.salario_func), MIN(f.salario_func)
FROM bf_func f,
     bf_dept d
WHERE f.id_dept=d.id_dept     
GROUP BY f.id_dept, d.nome_dept;

SELECT f.id_dept, d.nome_dept, count(*)
FROM bf_func f,
     bf_dept d
WHERE f.id_dept=d.id_dept     
GROUP BY f.id_dept, d.nome_dept;














-- detalhamento das tabelas
DESC bf_dept;
DESC bf_func;

SELECT * FROM bf_dept;
SELECT * FROM bf_func;

DESC testes_funcoes;
SELECT * FROM testes_funcoes;