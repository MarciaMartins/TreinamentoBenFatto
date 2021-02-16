------------------ INSERT FUNCIONARIO -------------
select * from bf_func;

INSERT INTO bf_func(id_func, nome_func,id_dept,cpf,data_contratacao,data_desligamento,data_nascimento)
VALUES (7, '  nOmE dO fUnCiOnArIo  ', 3, '5555555555',to_date('01/01/2020'),to_date('01/01/2021'),to_date('11/09/2000'));

INSERT INTO bf_func(id_func, nome_func,id_dept,cpf,data_contratacao,data_desligamento,data_nascimento)
VALUES (8, ' espaço  nome do funcionario  espaço ', 5, '12312311901',to_date('11/11/1998'),to_date('19/04/2005'),to_date('11/09/2000'));
