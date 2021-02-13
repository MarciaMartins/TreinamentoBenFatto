-- Exercicios para prática conhecimento primeira semana
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
-- 2.1. Que não possui responsável
SELECT id_dept, nome_dept, responsavel
FROM bf_dept
WHERE responsavel is null;

-- 2.1. Que possui responsável e seu nome através da tabela funcionário
SELECT d.id_dept, d.nome_dept, d.responsavel, f.id_func, f.nome_func 
FROM bf_dept d,
     bf_func f
WHERE d.responsavel = f.id_func;

-- 3. Recuperar um funcionário:
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

-- 3.5. Departamento Específico
SELECT *
FROM bf_func
where id_dept=3;

-- 3.4 Responsável por algum departamento, trazendo as informações do nome e id do responsável
SELECT f.id_func, f.nome_func, CPF, d.id_dept, d.nome_dept, d.responsavel 
FROM bf_func f,
     bf_dept d
WHERE d.responsavel = f.id_func;
