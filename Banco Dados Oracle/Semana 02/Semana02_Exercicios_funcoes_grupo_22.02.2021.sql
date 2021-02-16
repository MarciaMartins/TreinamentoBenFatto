----------------------- funções de grupo exercicios (22.02)-------------------
-- soma de salario de todos os funcionarios, agrupado por cpf (cpf, soma salario)

SELECT SUM(f.salario_func), f.cpf 
FROM bf_func f,
     bf_dept d
GROUP BY f.cpf;       

-- media dos salarios somente dos ativos
SELECT f.id_dept, NVL(TRUNC(AVG(f.salario_func),2),0)
FROM bf_func f
WHERE f.status_func='S'
GROUP BY f.id_dept;  

-- media de salario somente para inativos
SELECT f.id_dept, NVL(TRUNC(AVG(f.salario_func),2),0)
FROM bf_func f
WHERE f.status_func='N'
GROUP BY f.id_dept; 

-- conta de quantos funcionarios ativos e quantos inativos
SELECT COUNT(*)
FROM bf_func
GROUP BY status_func;

-- Apresentando o agrupamento por ativo/inativo, departamente
SELECT f.id_dept, d.nome_dept, f.status_func, COUNT(*)
FROM bf_func f,
     bf_dept d
WHERE f.id_dept = d.id_dept     
GROUP BY f.id_dept, d.nome_dept ,f.status_func
ORDER BY f.id_dept;

--SOMA DOS SALARIOS DOS FUNCIONARIOS CONTRATADOS EM 2020
SELECT SUM(f.salario_func)
FROM bf_func f
WHERE TO_CHAR(data_contratacao, 'yyyy') >= 2020;

-- SOMA DO SALARIO AGRUPADO POR ANO DE CONTRATAÇÃO
SELECT TO_CHAR(data_contratacao, 'yyyy'), SUM(f.salario_func)
FROM bf_func f
GROUP BY TO_CHAR(data_contratacao, 'yyyy');

-- SOMA DOS SALARIOS, TEM DATA DE DESLIGAMENTO
SELECT SUM(f.salario_func)
FROM bf_func f
WHERE f.data_desligamento is not null;

-- SOMA DOS SALARIOS, não TEM DATA DE DESLIGAMENTO
SELECT SUM(f.salario_func)
FROM bf_func f
WHERE f.data_desligamento is null;



