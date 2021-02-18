--EXERCICIOS SEMANA 03 - (Documento de referência GIT Semana03_ConteúdoBancoDadosOracle)
-- DIAS (25.01)
/*
EXERCICIO 01
ENTADA: ID FUNCIONARIO
SAIDA: NOME
*/

CREATE OR REPLACE PROCEDURE busca_nome(v_id_func IN bf_func.id_func%TYPE,
                            v_nome_func OUT bf_func.nome_func%type)
IS
b_existe NUMBER;
s_retorno varchar2(10);

BEGIN
    BEGIN
        SELECT 1
        INTO b_existe
        FROM bf_func
        WHERE id_func = v_id_func;
    EXCEPTION
        when others then
          b_existe := 0;
    END;
    
 IF b_existe = 0 THEN
   v_nome_func := 'FUNCIONARIO INEXISTENTE';
 ELSE
    SELECT nome_func
    INTO v_nome_func
    FROM bf_func 
    WHERE id_func = v_id_func;
 END IF;

END busca_nome;
 
 
 
 /*
EXERCICIO 02
ENTADA: ID FUNCIONARIO
SAIDAS: NOME, NOME DEPARTAMENTO
        
*/


CREATE OR REPLACE PROCEDURE RETORNA_NOME_FUNC_E_DEPT (v_id_func IN bf_func.id_func%TYPE,
                                            v_nome_func OUT bf_func.nome_func%TYPE,
                                            v_nome_dept OUT bf_dept.nome_dept%TYPE)

AS
n_existe NUMBER;
BEGIN
    BEGIN
        SELECT 1
        INTO n_existe
        FROM bf_func
        WHERE id_func = v_id_func;
    EXCEPTION
        when others then
        n_existe:=0;
    END;
    
    IF n_existe=1 THEN
        SELECT f.nome_func, d.nome_dept
        INTO v_nome_func, v_nome_dept
        FROM bf_func f,
             bf_dept d
        WHERE f.id_func = v_id_func
        AND f.id_dept = d.id_dept;
      ELSE
        v_nome_func := 'FUNCIONARIO INEXISTENTE';
      END IF;
END RETORNA_NOME_FUNC_E_DEPT;

 /*
EXERCICIO 03
ENTADA: ID FUNCIONARIO
SAIDAS: ATUALIZA A TABELA FUNCIONARIO
        
*/

create or replace procedure valida_func (v_id_func in bf_func.id_func%type,
                                         v_cpf in bf_func.cpf%type,
                                         v_nome in bf_func.nome_func%type,
                                         v_id_dept in bf_func.id_dept%type,
                                         v_data_contratacao in bf_func.data_contratacao%TYPE,
                                         v_data_nascimento in bf_func.data_nascimento%Type,
                                         v_salario in bf_func.salario_func%type,
                                         v_status in bf_func.status_func%type,
                                         v_data_desligamento in bf_func.data_desligamento%TYPE)
is
n_cpf NUMBER;

begin
  BEGIN
   select 1
   into n_cpf
   from bf_func
   where id_func = v_id_func;
 exception
    when others then
      n_cpf := 0;
    end;

  if n_cpf = 0 then
    insert into bf_func (id_func, cpf, nome_func, id_dept, data_contratacao, data_nascimento, salario_func, status_func, data_desligamento)
        values (v_id_func, v_cpf, v_nome, v_id_dept, v_data_contratacao, v_data_nascimento,v_salario,v_status, v_data_desligamento);
  else
     update bf_func
     set cpf = v_cpf,
         nome_func = v_nome,
         id_dept = v_id_dept, 
         data_contratacao = v_data_contratacao, 
         data_nascimento = v_data_nascimento,
         salario_func = v_salario,
         status_func = v_status,
         data_desligamento = v_data_desligamento
     where id_func = v_id_func;
    end if;  
    commit; 
end valida_func;