--------------------------------------------------------
--  DDL for Procedure SALARIO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "SYSTEM"."SALARIO" (v_status  IN bf_func.status_func%type,
                                    v_soma out NUMBER)    
IS
-- CURSOR
  CURSOR BUSCA_STATUS IS
  SELECT salario_func
  FROM bf_func
  WHERE bf_func.status_func = v_status;
    
  n_soma_sal number;
    
        BEGIN
          n_soma_sal :=10;
          
          FOR r_func_sal IN BUSCA_STATUS LOOP
            n_soma_sal := n_soma_sal + r_func_sal.salario_func;  
          END LOOP;
            
            v_soma := n_soma_sal;
    
        EXCEPTION
           WHEN OTHERS THEN
             raise;
        END;
      --END;  
--END salario;

/
