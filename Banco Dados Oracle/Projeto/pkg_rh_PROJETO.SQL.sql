--------------------------------------------------------
--  Arquivo criado - Segunda-feira-Fevereiro-22-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package PKG_BF_RH
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "SYSTEM"."PKG_BF_RH" AS 

--1--------------------------------------------------------------------------------------
-- ENTRADA: CPF, NOME, SOBRENOME, DATA NASCIMENTO;
-- PROCESSO: VALIDA SE CPF JÁ ESTÁ CADASTRADO NA BASE  (UPDATE OU INSERT)
-- RETORNO: SUCESSO: MSG PROCESSO 

PROCEDURE PROC_RH_PESSOA(p_i_cpf in rh_pessoa.cpf%type,
                           p_i_nome in rh_pessoa.nome%type,
                           p_i_sobrenome in rh_pessoa.sobrenome%type,
                           p_i_data_nascimento in rh_pessoa.nascimento%Type,
                           p_o_retorno out varchar2);
                                           
--2--------------------------------------------------------------------------------------
-- ENTRADA: NOME, LOCAÇÃO;
-- PROCESSO: VALIDA SE NOME E LOCAÇÃO, LOCAÇÃO EXISTE; (INSERT)
-- RETORNO: SUCESSO: MSG PROCESSO 
-- PONTO DE ATENÇÃO: NÃO É POSSÍVEL REALIZAR O UPDATE, POIS OS DOIS CAMPOS COMBINADOS NÃO PRECISAM SER ÚNICOS.

PROCEDURE PROC_RH_DEPT(p_i_nome IN rh_dept.nome%type,
                        p_i_locacao IN rh_dept.locacao%type,
                        p_o_retorno out varchar2);
                                         
                                         
--3--------------------------------------------------------------------------------------
-- ENTRADA: TIPO, VALOR, PONTOS;
-- PROCESSO: VALIDA TIPO DO BENEFÍCIO; (INSERT/UPDATE)
-- RETORNO: SUCESSO: MSG PROCESSO 

PROCEDURE PROC_RH_BENEF (p_i_tipo IN rh_benef.tipo%type,
                                         p_i_valor IN rh_benef.valor%type,
                                         p_i_pontos IN rh_benef.pontos%type,
                                         p_o_retorno out varchar2);
                                         
--4--------------------------------------------------------------------------------------
-- ENTRADA: ID PESSOA, ID DEPARTAMENTO, DATA CONTRATAÇÃO, SALARIO, STATUS, DATA DESLIGAMENTO
-- PROCESSO: VALIDAÇÃO PARA POSSIBILITAR A INSERÇÃO DO FUNCIONARIO; 
-- RETORNO: SUCESSO: MSG PROCESSO 

PROCEDURE PROC_RH_FUNC(p_i_id_pessoa in rh_func.id_pessoa%type,
                                         p_i_id_dept in rh_func.id_dept%type,
                                         p_i_data_contratacao in rh_func.contratacao%TYPE,
                                         p_i_salario in rh_func.salario%type,
                                         p_i_status in rh_func.status%type,
                                         p_i_data_desligamento in rh_func.desligamento%TYPE,
                                         p_o_retorno out varchar2);

--5-------------------------------------------------------------------------------------- 
-- ENTRADA: ID PESSOA, ID DEPARTAMENTO, DATA CONTRATAÇÃO, SALARIO, STATUS, DATA DESLIGAMENTO
-- PROCESSO: EFETIVA A INSERÇÃO DO FUNCIONARIO, CONFORME VALIDAÇÃO DA PROC_RH_FUNC; (INSERT/UPDATE)
-- RETORNO: SUCESSO: MSG PROCESSO 

PROCEDURE PROC_FUNC_INSERT (p_i_id_pessoa in rh_func.id_pessoa%type,
                                            p_i_id_dept in rh_func.id_dept%type,
                                            p_i_data_contratacao in rh_func.contratacao%TYPE,
                                            p_i_salario in rh_func.salario%type,
                                            p_i_status in rh_func.status%type,
                                            p_i_data_desligamento in rh_func.desligamento%TYPE);

--6-------------------------------------------------------------------------------------- 
-- ENTRADA: ID DO FUNCIONARIO, ID DO BENEFICIO, CUSTO
-- PROCESSO: VERIFICAÇÃO AS EXISTENCIAS DAS PARÂMETROS 
-- RETORNO: MSG DE UPDATE/INSERT

PROCEDURE PROC_RH_FUNC_BENEF(p_i_id_func in rh_func_benef.id_func%type,
                                p_i_id_benef in rh_func_benef.id_benef%type,
                                p_i_custo in rh_func_benef.custo%type,
                                p_o_retorno out varchar2);


--7-------------------------------------------------------------------------------------- 
-- ENTRADA: ID DO FUNCIONARIO
-- PROCESSO: IDENTIFICA SE FUNCIONARIO EXISTE; VERIFICA SE STATUS = 'S'
-- RETORNO: CALCULO DE MESES PARA FUNCIONARIO ATIVO; 0 PARA STATUS N OU FUNCIONARIO INEXISTENTE

FUNCTION RH_TEMPO_EMPRESA_FUNC(p_i_id_func IN rh_func.id_func%type)                                       
    RETURN NUMBER; 

--8-------------------------------------------------------------------------------------- 
-- ENTRADA: -
-- PROCESSO: utiliza a função para obter o maior valor 
-- RETORNO: retorno maior valor 

FUNCTION RH_FUNC_MAIOR_SAL (maior_salario out number)
    RETURN NUMBER; 

--9-------------------------------------------------------------------------------------- 
-- ENTRADA: -
-- PROCESSO: utiliza a função para obter o menor valor 
-- RETORNO: retorno menor valor 

FUNCTION RH_FUNC_MENOR_SAL (menor_salario out number)
    RETURN NUMBER; 

--10-------------------------------------------------------------------------------------- 
-- ENTRADA: id do departamento
-- PROCESSO: calcula da media de salario utilização a função avg
-- RETORNO: media de salario do departamento

FUNCTION RH_FUNC_MEDIA_SAL_DEPT (p_i_id_dept in rh_dept.id_dept%TYPE,
                                 media_salario out number) 
    RETURN NUMBER; 

--11-------------------------------------------------------------------------------------- 
-- ENTRADA: id do funcionario
-- PROCESSO: calculo da soma dos do beneficio
-- RETORNO: soma dos beneficios

FUNCTION RH_FUNC_BENEF_VALOR_TOTAL (p_i_id_func in rh_func.id_func%type)
    RETURN NUMBER; 


--12-------------------------------------------------------------------------------------- 
-- ENTRADA: ID FUNCIONARIO
-- PROCESSO: IDENTIFICAÇÃO DO ID E EXCLUSÃO QDO EXISTENTE
-- RETORNO: - 

PROCEDURE RH_EXCLUIR_FUNC(p_i_id_func IN rh_func.id_func%TYPE);
 
--13-------------------------------------------------------------------------------------- 
-- ENTRADA: ID DO DEPARTAMENTO
-- PROCESSO: IDENTIFICAÇÃO DO ID E EXCLUSÃO QDO EXISTENTE
-- RETORNO: - 

PROCEDURE RH_EXCLUIR_DEPART(p_i_id_dept IN rh_dept.id_dept%TYPE);

--14-------------------------------------------------------------------------------------- 
-- ENTRADA: ID DO BENEFICIO
-- PROCESSO: IDENTIFICAÇÃO DO ID E EXCLUSÃO QDO EXISTENTE
-- RETORNO: - 

PROCEDURE RH_EXCLUIR_FUNC_BENEF(p_i_id_func in rh_func_benef.id_func%type,
                                p_i_id_benef in rh_func_benef.id_benef%type);

--15-------------------------------------------------------------------------------------- 
-- ENTRADA: ID DO FUNCIONARIO E BENEFICIO
-- PROCESSO: IDENTIFICAÇÃO DO ID E EXCLUSÃO QDO EXISTENTE
-- RETORNO: - 

PROCEDURE RH_EXCLUIR_BENEF(p_i_id_benef in rh_func_benef.id_benef%type);
                                               
--16-------------------------------------------------------------------------------------- 
-- ENTRADA: ID DA PESSOA
-- PROCESSO: IDENTIFICAÇÃO DO ID E EXCLUSÃO QDO EXISTENTE
-- RETORNO: - 

PROCEDURE RH_EXCLUIR_PESSOA (p_i_id_pessoa in rh_pessoa.id_pessoa%TYPE);

--17-------------------------------------------------------------------------------------- 
-- ENTRADA:  ID DO DEPARTAMENTO
-- PROCESSO: PERCORRE A LISTA DE DEPARTAMENTOS
-- RETORNO: 1 SE EXISTE, 0 NÃO EXISTE
FUNCTION RH_DEPT_EXISTE (p_i_id_dept in rh_dept.id_dept%TYPE)
    RETURN NUMBER;

--18--------------------------------------------------------------------------------------  
-- ENTRADA:  ID DO PESSOA
-- PROCESSO: PERCORRE A LISTA DE PESSOA
-- RETORNO: 1 SE EXISTE, 0 NÃO EXISTE
FUNCTION RH_PESSOA_EXISTE(p_i_id_pessoa in rh_pessoa.id_pessoa%TYPE)
    RETURN NUMBER;
    
--19-------------------------------------------------------------------------------------- 
-- ENTRADA: ID PESSOA, ID DEPARTAMENTO;
-- PROCESSO: VALIDA SE EXISTE VINCULO DE PESSOA COM DEPARTAMENTO
-- RETORNO: SUCESSO: ID FUNC; INEXISTE: 0 

FUNCTION RH_FUNC_EXISTE (p_i_id_pessoa in rh_func.id_pessoa%TYPE, 
                         p_i_id_dept in rh_func.id_dept%TYPE)
    RETURN NUMBER;

--20-------------------------------------------------------------------------------------- 
-- ENTRADA: id do beneficio
-- PROCESSO: verifica
-- RETORNO: 1 se existe e 0 senão existe

FUNCTION RH_BENEF_EXISTE (p_i_id_benef in rh_benef.id_benef%TYPE)
    RETURN NUMBER; 

--21-------------------------------------------------------------------------------------- 
-- ENTRADA: id do funcionario e id do beneficio
-- PROCESSO: validação se existe registro na base
-- RETORNO: id da tabela funcionario beneficio 

FUNCTION RH_FUNC_BENEF_EXISTE (p_i_id_func in rh_func_benef.id_func%type,
                      p_i_id_benef in rh_func_benef.id_benef%type)
    RETURN NUMBER; 


--22--------------------------------------------------------------------------------------  
-- ENTRADA: ID_FUNC;
-- PROCESSO: VALIDA SE ID FUNCIONARIO EXISTE; 
-- RETORNO: SUCESSO: ID FUCIONARIO; ERRO: 0 
FUNCTION RH_FUNC_BUSCA_ID(p_i_id_func in rh_func.id_func%TYPE)
    RETURN NUMBER;


--23-------------------------------------------------------------------------------------- 
-- ENTRADA: ID_FUNC;
-- PROCESSO: VALIDA SE ID EXISTE; INNER JOIN TABELA RH_FUNC E RH_PESSOA
-- RETORNO: SUCESSO: NOME DO FUCIONARIO; ERRO: MSG DE INEXISTENCIA 
FUNCTION RH_FUNC_REC_NOME (p_i_id_func IN rh_func.id_func%TYPE)
   RETURN VARCHAR2;

--24-------------------------------------------------------------------------------------- 
-- ENTRADA: ID DO FUNCIONARIO
-- PROCESSO: VERIFICA O STATUS O FUNCIONARIO
-- RETORNO: 1 SE STATUS 'S', 0 SE STATUS 'N'  

FUNCTION RH_FUNC_STATUS(p_i_id_func in rh_func.id_func%TYPE)
    RETURN NUMBER; 






    





END PKG_BF_RH;

/
