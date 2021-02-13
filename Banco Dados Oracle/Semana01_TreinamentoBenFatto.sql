-- aula 14.01.2021
-- Criação da tabela - ## Tabela de departamento (ITEM 3 GIT Semana01_BancoDadosOracle)
CREATE TABLE bf_dept(
    id_dept NUMBER(2) NOT NULL,
    nome_dept VARCHAR2(50),
    loc_dept VARCHAR2(30)
);

-- Alteração da tabela para a criação da chave primária - ## Tabela de departamento (ITEM 3.2. GIT Semana01_BancoDadosOracle)
ALTER TABLE bf_dept 
ADD CONSTRAINT PK_DEPT
PRIMARY KEY(id_dept);

-- Criação da Tabela - ## Tabela de Funcionário (ITEM 3.3. GIT Semana01_BancoDadosOracle)
CREATE TABLE bf_func(
    id_func NUMBER(2) NOT NULL,
    nome_func VARCHAR2(50),
    id_dept NUMBER(2)
);

-- Alteração da tabela para a criação da chave primária  - ## Tabela de Funcionário (ITEM 3.4. GIT Semana01_BancoDadosOracle)
ALTER TABLE bf_func
ADD CONSTRAINT pk_func
PRIMARY KEY(id_func);

-- Alteração da tabela para a criação da chave estrangeira - ## Tabela de Funcionário (ITEM 3.5. GIT Semana01_BancoDadosOracle)
ALTER TABLE bf_func
ADD CONSTRAINT fk_id_dept
FOREIGN KEY(id_dept)
REFERENCES bf_dept(id_dept);

----------------DML Iniciais ---------
-- INSERT (5 departamentos) - ## Tabela de departamento (ITEM 4.1.  GIT Semana01_BancoDadosOracle)

INSERT INTO bf_dept(id_dept, nome_dept,loc_dept) 
VALUES (1,'RH','CPS');

INSERT INTO bf_dept(id_dept, nome_dept,loc_dept) 
VALUES (2,'COMERCIAL','SP');

INSERT INTO bf_dept(id_dept, nome_dept,loc_dept) 
VALUES(3,'FINANCEIRO','RIO DE JANEIRO');

INSERT INTO bf_dept(id_dept, nome_dept,loc_dept)
VALUES(4,'TI','MANUAUS');

INSERT INTO bf_dept(id_dept, nome_dept,loc_dept)
VALUES(5,'SAC','RECIFE');

-- aula 15.01.2021

----------------DDL  ---------

-- ALTER TABLE  - ## Tabela de departamento (ITEM 5 GIT Semana01_BancoDadosOracle)
ALTER TABLE bf_dept ADD responsavel VARCHAR2(50);  
-- ALTER -## Tabela de Funcionário 
ALTER TABLE bf_func ADD data_contratacao DATE; 
ALTER TABLE bf_func ADD data_desligamento DATE;
ALTER TABLE bf_func ADD cpf NUMBER(11) NOT NULL;
ALTER TABLE bf_func ADD data_nascimento DATE;

----------------DML Iniciais ---------
-- INSERT (5 funcionários) -- ## Tabela de funcionario (ITEM 4.1. GIT Semana01_BancoDadosOracle)

INSERT INTO bf_func(id_func, nome_func,id_dept,cpf,data_contratacao,data_desligamento,data_nascimento) 
VALUES(1,'MICHAEL',4,'11111111111',to_date('10/09/2000'),NULL,to_date('25/09/1987'));

INSERT INTO bf_func(id_func, nome_func,id_dept,cpf,data_contratacao,data_desligamento,data_nascimento) 
VALUES (2,'VITORIA',5,'22222222222',sysdate,NULL,to_date('12/03/2000'));

INSERT INTO bf_func(id_func, nome_func,id_dept,cpf,data_contratacao,data_desligamento,data_nascimento) 
VALUES(3,'PAULA',2,'33333333333',sysdate,NULL,to_date('01/08/1951'));

INSERT INTO bf_func(id_func, nome_func,id_dept,cpf,data_contratacao,data_desligamento,data_nascimento)
VALUES(4,'ROGERIO',3,'44444444444',to_date('01/12/2019'),NULL,to_date('15/11/2007'));

INSERT INTO bf_func(id_func, nome_func,id_dept,cpf,data_contratacao,data_desligamento,data_nascimento)
VALUES(5,'RODRIGO',3,'55555555555',to_date('01/01/2020'),NULL,to_date('11/09/1984'));

INSERT INTO bf_func(id_func, nome_func,id_dept,cpf,data_contratacao,data_desligamento,data_nascimento)
VALUES(6,' Funcionario ',1,'01234567891',to_date('01/01/2020'),('05/01/2021'),to_date('11/09/2000'));


-- CHAVE PRIMÁRIA REPETIDA -- ## Tabela de departamento (ITEM 4.1.1. GIT Semana01_BancoDadosOracle)
INSERT INTO bf_dept(id_dept, nome_dept,loc_dept) 
VALUES (1,'RH','RIO DE JANEIRO');

-- CADASTRO DE DEPARTAMENTO INEXISTENTE - ## Tabela de funcionario (ITEM 4.1.2. GIT Semana01_BancoDadosOracle)
INSERT INTO bf_func(id_func, nome_func,id_dept,cpf,data_contratacao,data_desligamento,data_nascimento)
VALUES (7, 'Nome do funcionario', 6, '55555555555',to_date('01/01/2020'),to_date('01/01/2021'),to_date('11/09/2000'));


-- UPDATE -## Tabela de Departamento (ITEM 4.2. GIT Semana01_BancoDadosOracle)
UPDATE bf_dept
SET responsavel = 'MICHAEL'
WHERE id_dept=1;

UPDATE bf_dept
SET responsavel = 'VICTORIA'
WHERE id_dept=5;


-- INNER JOIN (ITEM 6.1. GIT Semana01_BancoDadosOracle)
SELECT f.nome_func, f.cpf,f.data_contratacao, d.nome_dept, d.responsavel 
FROM bf_dept d,
     bf_func f
WHERE d.id_dept = f.id_dept
    AND d.id_dept=4;

--  OUTER JOIN (ITEM 6.2. GIT Semana01_BancoDadosOracle)
SELECT f.nome_func, f.cpf,f.data_contratacao, d.nome_dept, d.responsavel 
FROM bf_dept d,
     bf_func f
WHERE d.id_dept = f.id_dept (+); 

--  LEFT JOIN (ITEM 6.3. GIT Semana01_BancoDadosOracle)
SELECT f.nome_func, f.cpf,f.data_contratacao, d.nome_dept, d.responsavel 
FROM bf_dept d
LEFT JOIN bf_func f
ON d.id_dept = f.id_dept; 

-- RIGHT JOIN (ITEM 6.4. GIT Semana01_BancoDadosOracle)
SELECT f.nome_func, f.cpf,f.data_contratacao, d.nome_dept, d.responsavel 
FROM bf_dept d
RIGHT JOIN bf_func f
ON d.id_dept = f.id_dept;

-- detalhamento das tabelas

DESC bf_dept;
DESC bf_func;

-- (ITEM 4.4. GIT Semana01_BancoDadosOracle)

SELECT * FROM bf_dept; 
SELECT * FROM bf_func;

-- Deletar as tabelas do banco
DROP TABLE bf_func;
DROP TABLE bf_dept;

