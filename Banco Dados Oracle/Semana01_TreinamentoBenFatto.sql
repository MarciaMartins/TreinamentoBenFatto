drop table bf_dept;
drop table bf_func;

-- 3. Manipulando tabelas
-- 3.1. Criação da tabela 
-- ## Tabela de departamento
CREATE TABLE bf_dept(
    id_dept NUMBER(2) NOT NULL,
    nome_dept VARCHAR2(50),
    loc_dept VARCHAR2(30)
);

-- 3.2.Alteração da tabela para a criação da chave primária
-- ## Tabela de departamento
ALTER TABLE bf_dept 
ADD CONSTRAINT PK_DEPT
PRIMARY KEY(id_dept);

-- 3.3. Criação da Tabela
-- ## Tabela de Funcionário
CREATE TABLE bf_func(
    id_func NUMBER(2) NOT NULL,
    nome_func VARCHAR2(50),
    id_dept NUMBER(2)
);

-- 3.4.Alteração da tabela para a criação da chave primária
-- ## Tabela de Funcionário
ALTER TABLE bf_func
ADD CONSTRAINT pk_func
PRIMARY KEY(id_func);

-- 3.5.Alteração da tabela para a criação da chave estrangeira
-- 3.5.1. Criação da FK na tabela Funcionário
-- ## Tabela de Funcionário
ALTER TABLE bf_func
ADD CONSTRAINT fk_id_dept
FOREIGN KEY(id_dept)
REFERENCES bf_dept(id_dept);

-- 3.5.2. Criação da FK na tabela de Departamento
-- ## Tabela de Departamento
ALTER TABLE bf_dept
ADD CONSTRAINT fk_id_func
FOREIGN KEY(responsavel)
REFERENCES bf_func(id_func);
-- aula 15.01.2021

-- 4. Alteração da tabela 
-- 4.1. Criação do campo responsável
--## Tabela de departamento 
ALTER TABLE bf_dept ADD responsavel NUMBER(2) NULL; 

-- Alteração da tabela para incluir ID de responsável na tabela de Departamento
--## Tabela de Funcionário
ALTER TABLE bf_func ADD data_contratacao DATE; 
ALTER TABLE bf_func ADD data_desligamento DATE;
ALTER TABLE bf_func ADD cpf NUMBER(11) NOT NULL;
ALTER TABLE bf_func ADD data_nascimento DATE;

-- 5.2. Update:
--## Tabela de Departamento 
UPDATE bf_dept
SET responsavel = 1
WHERE id_dept=1;

UPDATE bf_dept
SET responsavel = 2
WHERE id_dept=5;

-- 5.1.1. Exemplo de inserção de dados nas tabelas (5 departamentos)
-- ## Tabela de departamento 

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

-- 5.1.2. Inserção de dados REPETINDO CHAVE PRIMÁRIA 
-- ## Tabela de departamento 

INSERT INTO bf_dept(id_dept, nome_dept,loc_dept) 
VALUES (1,'RH','RIO DE JANEIRO');

-- 5.1.1. Exemplo de inserção de dados nas tabelas (5 funcionários)
-- ## Tabela de funcionario 
INSERT INTO bf_func(id_func, nome_func,id_dept,cpf,data_contratacao,data_desligamento,data_nascimento) 
VALUES(1,'MICHAEL',4,'11111111111',to_date('10/09/2000'),NULL,to_date('25/09/2000'));

INSERT INTO bf_func(id_func, nome_func,id_dept,cpf,data_contratacao,data_desligamento,data_nascimento) 
VALUES (2,'VITORIA',5,'22222222222',sysdate,NULL,to_date('01/09/2000'));

INSERT INTO bf_func(id_func, nome_func,id_dept,cpf,data_contratacao,data_desligamento,data_nascimento) 
VALUES(3,'PAULA',2,'33333333333',sysdate,NULL,to_date('01/08/2000'));

INSERT INTO bf_func(id_func, nome_func,id_dept,cpf,data_contratacao,data_desligamento,data_nascimento)
VALUES(4,'ROGERIO',3,'44444444444',to_date('01/12/2019'),NULL,to_date('01/09/2000'));

INSERT INTO bf_func(id_func, nome_func,id_dept,cpf,data_contratacao,data_desligamento,data_nascimento)
VALUES(5,'RODRIGO',3,'55555555555',to_date('01/01/2020'),NULL,to_date('11/09/2000'));

INSERT INTO bf_func(id_func, nome_func,id_dept,cpf,data_contratacao,data_desligamento,data_nascimento)
VALUES(6,' Funcionario ',1,'01234567891',to_date('01/01/2020'),('05/01/2021'),to_date('11/09/2000'));


-- 5.1.3. Inserção de dados para um funcionário com CADASTRO DE DEPARTAMENTO INEXISTENTE
-- ## Tabela de funcionario 
INSERT INTO bf_func(id_func, nome_func,id_dept,cpf,data_contratacao,data_desligamento,data_nascimento)
VALUES (7, 'Nome do funcionario', 6, '55555555555',to_date('01/01/2020'),to_date('01/01/2021'),to_date('11/09/2000'));

-- 7.1. INNER JOIN 

SELECT f.nome_func, f.cpf,f.data_contratacao, d.nome_dept, d.responsavel 
FROM bf_dept d,
     bf_func f
WHERE d.id_dept = f.id_dept
    AND d.id_dept=4;

-- 7.2. OUTER JOIN 

SELECT f.nome_func, f.cpf,f.data_contratacao, d.nome_dept, d.responsavel 
FROM bf_dept d,
     bf_func f
WHERE d.id_dept = f.id_dept (+); 

-- 7.3. LEFT JOIN
SELECT f.nome_func, f.cpf,f.data_contratacao, d.nome_dept, d.responsavel 
FROM bf_dept d
LEFT JOIN bf_func f
ON d.id_dept = f.id_dept; 

-- 7.4. RIGHT JOIN 
SELECT f.nome_func, f.cpf,f.data_contratacao, d.nome_dept, d.responsavel 
FROM bf_dept d
RIGHT JOIN bf_func f
ON d.id_dept = f.id_dept;




-- detalhamento das tabelas

DESC bf_dept;
DESC bf_func;

SELECT * FROM bf_dept;
SELECT * FROM bf_func;