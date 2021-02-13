 
CREATE TABLE testes_funcoes(
    id_tabela number(2) not null,
    din_texto varchar2(10),
    din_num number(9,2),
    data_texto varchar2(8),
    data_num date,
    data_num_futura date);
    
INSERT INTO testes_funcoes (id_tabela, din_texto, din_num, data_texto, data_num, data_num_futura)
VALUES (1, '1000,00', 100.00, '01012021', to_date('10/09/2000'), to_date('10/12/2020')); 

INSERT INTO testes_funcoes (id_tabela, din_texto, din_num, data_texto, data_num, data_num_futura)
VALUES (2, '10', 10.023, '01012012', to_date('10/01/2021'), SYSDATE); 


--2. FUNÇÃO TO_CHAR
--2.1. Transformando um campo do tipo data em String
-- campo data da tabela testes_funcoes
SELECT id_tabela, din_texto, din_num, data_texto, data_num, TO_CHAR(data_num, 'mm/yyyy') from testes_funcoes;
--2.2. Transformando um campo númerico em String
-- alterar a formatação do campo dinheiro numerico para string
SELECT id_tabela, din_texto, data_texto, data_num, din_num, TO_CHAR(din_num, '999d99') from testes_funcoes;

--3 FUNÇÃO TO_DATE: converte um determinado texto em uma data válida
SELECT id_tabela, din_texto, data_num, din_num, data_texto, TO_DATE(data_texto, 'dd/mm/yy') FROM testes_funcoes;

-- 4. ADD_MONTHS
SELECT id_tabela, din_texto, din_num, data_texto, data_num, 
    ADD_MONTHS(data_num,12) proximo_ano FROM testes_funcoes; 

--5. MONTHS_BETWEEN
SELECT id_tabela, din_texto, din_num, data_texto, data_num, 
    TRUNC (MONTHS_BETWEEN(SYSDATE, data_num)) || ' meses' MESES
FROM testes_funcoes;

-- 6. LAST DAY
SELECT id_tabela, din_texto, din_num, data_texto, data_num, 
    LAST_DAY(SYSDATE) ULTIMO_DIA_MES_ATUAL
FROM testes_funcoes;

-- 7. NEXT_DAY
SELECT id_tabela, din_texto, din_num, data_texto, data_num, 
    NEXT_DAY(data_num, 4) FIM_CONTRATO_EXPERIENCIA
FROM testes_funcoes;

-- detalhamento das tabelas
DESC testes_funcoes;
SELECT * FROM testes_funcoes;

-- drop table

DROP TABLE testes_funcoes;