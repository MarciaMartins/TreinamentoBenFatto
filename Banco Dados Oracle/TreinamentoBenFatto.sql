--Calcular :
  -- o tempo de casa do funcionário Ativo;
  -- A Média de salário de determinado departamento
  -- O Maior Salário da Empresa;
  -- O Menor Salário da Empresa;
  -- O valor total dos benefícios do Funcionário;
  -- As alterações nas tabelas de funcionário e Departamento devem ser logadas
  

SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, contratacao))
           -- INTO d_calc
            FROM rh_func
            WHERE id_func = 44
            AND status='S';