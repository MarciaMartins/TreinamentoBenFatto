--Calcular :
  -- o tempo de casa do funcion�rio Ativo;
  -- A M�dia de sal�rio de determinado departamento
  -- O Maior Sal�rio da Empresa;
  -- O Menor Sal�rio da Empresa;
  -- O valor total dos benef�cios do Funcion�rio;
  -- As altera��es nas tabelas de funcion�rio e Departamento devem ser logadas
  

SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, contratacao))
           -- INTO d_calc
            FROM rh_func
            WHERE id_func = 44
            AND status='S';