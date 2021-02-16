------------------ ALTER TABLE FUNCIONARIO (21.02) -------------
select * from bf_func;

ALTER TABLE bf_func ADD salario_func NUMBER(10,2);
ALTER TABLE bf_func ADD status_func CHAR(1);

------------------ UPDATE TABLE FUNCIONARIO  -------------
UPDATE bf_func 
    SET salario_func =25330 
WHERE id_dept = 4;

UPDATE bf_func 
    SET status_func ='S' 
WHERE id_dept = 3
OR id_dept =1
OR id_dept=4;

UPDATE bf_func 
    SET status_func ='N' 
WHERE id_func = 10
or id_func = 3;

UPDATE bf_func 
    SET status_func ='S' 
WHERE status_func is null;

------------------ INSERT TABLE FUNCIONARIO  -------------

INSERT INTO bf_func(id_func, nome_func,id_dept,cpf,data_contratacao, data_nascimento)
VALUES (9, 'nOmE dO fUnCiOnArIo  ', 4, '12399909876',to_date('10/03/2021'),to_date('18/09/1900'));

INSERT INTO bf_func(id_func, nome_func,id_dept,cpf,data_contratacao, data_nascimento)
VALUES (10, 'A nOmE dO fUnCiOnArIo  ', 5, '1239993876',to_date('10/03/2021'),to_date('18/09/1900'));

INSERT INTO bf_func(id_func, nome_func,id_dept,cpf,data_contratacao, data_nascimento, salario_func)
VALUES (11, 'A nOmE dO fUnCiOnArIo  ', 5, '1239993876',to_date('10/03/2021'),to_date('17/04/1980'), 1988.91);

INSERT INTO bf_func(id_func, nome_func,id_dept,cpf,data_contratacao, data_nascimento, salario_func, status_func)
VALUES (12, 'A nOmE dO fUnCiOnArIo  ', 5, '1239993876',to_date('10/03/2021'),to_date('17/04/1980'), 1988.91, 'N');

------------------ SELECT ORDERBY/ GROUP BY   -------------
-- ORDENAR FUNCIONARIOS PELO ID DEPARTAMENTO SEGUIDO DO ID DO FUNCIONARIO
SELECT * FROM bf_func ORDER BY id_dept, id_func;
-- ORDENAR FUNCIONARIOS PELO NOME FUNCIONARIO
SELECT * FROM bf_func ORDER BY nome_func;

-- RECUPERAR FUNCIONARIOS COM STATUS ATIVO
SELECT * FROM bf_func 
WHERE status_func='S'
ORDER BY id_dept;

-- RECUPERAR OS FUNCIONÁRIO COM SALARIO MAIOR QUE 5 MIL REAIS
SELECT * FROM bf_func
WHERE salario_func>5000;

-- RECUPERAR OS FUNCIONÁRIO COM SALARIO MENOR QUE 5 MIL REAIS DOS FUNCIONARIOS ATIVOS
SELECT * FROM bf_func
WHERE salario_func<5000
AND status_func='S';