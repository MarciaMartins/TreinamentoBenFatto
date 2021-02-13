-- Exercicios para pr�tica conhecimento primeira semana
DESC bf_dept;
DESC bf_func;

-- 1. Recuperar todos os registros
-- ## Tabela Departamento
SELECT *
FROM bf_dept; 

-- ## Tabela Funcionario
SELECT *
FROM bf_func; 

-- 2. Recuperar Departamento: 
-- 2.1. Que n�o possui respons�vel
SELECT id_dept, nome_dept, responsavel
FROM bf_dept
WHERE responsavel is null;

-- 2.1. Que possui respons�vel e seu nome atrav�s da tabela funcion�rio
SELECT d.id_dept, d.nome_dept, d.responsavel, f.id_func, f.nome_func 
FROM bf_dept d,
     bf_func f
WHERE d.responsavel = f.id_func;

-- 3. Recuperar um funcion�rio:
-- 3.1. CPF  especifico
SELECT *
FROM bf_func
where cpf = 11111111111;

-- 3.2. CPF possuir numero 1 no campo
SELECT *
FROM bf_func
where cpf
LIKE '%1%';

-- 3.3. Nome especifico
SELECT *
FROM bf_func
where nome_func = 'MICHAEL';

-- 3.4. Nome comece com RO
SELECT *
FROM bf_func
where nome_func
LIKE 'RO%';

-- 3.5. Departamento Espec�fico
SELECT *
FROM bf_func
where id_dept=3;

-- 3.4 Respons�vel por algum departamento, trazendo as informa��es do nome e id do respons�vel
SELECT f.id_func, f.nome_func, CPF, d.id_dept, d.nome_dept, d.responsavel 
FROM bf_func f,
     bf_dept d
WHERE d.responsavel = f.id_func;
