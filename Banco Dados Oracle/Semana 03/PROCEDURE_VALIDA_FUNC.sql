--------------------------------------------------------
--  DDL for Procedure VALIDA_FUNC
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "SYSTEM"."VALIDA_FUNC" (v_id_func in bf_func.id_func%type,
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

/
