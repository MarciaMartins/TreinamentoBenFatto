--------------------------------------------------------
--  DDL for Procedure SOMA_SALARIO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "SYSTEM"."SOMA_SALARIO" (v_status  IN bf_func.status_func%type,
                                    v_soma out NUMBER)    
IS
-- CURSOR
  CURSOR C_BUSCA_STATUS IS
  SELECT NVL(salario_func,0) salario_func
    FROM bf_func
    WHERE status_func = v_status;
    
  n_soma_sal number;
    
        BEGIN
          n_soma_sal :=0;
          
          FOR r_BuscaStatus IN C_BUSCA_STATUS LOOP
            n_soma_sal := n_soma_sal + r_BuscaStatus.salario_func; 
           
          END LOOP;
            
          v_soma := n_soma_sal;
    
        EXCEPTION
           WHEN OTHERS THEN
             raise;
 
END soma_salario;

/
