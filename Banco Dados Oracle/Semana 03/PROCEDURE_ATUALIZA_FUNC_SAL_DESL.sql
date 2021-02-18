--------------------------------------------------------
--  DDL for Procedure ATUALIZA_FUNC_SAL_DESL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "SYSTEM"."ATUALIZA_FUNC_SAL_DESL" (p_i_status IN bf_func.status_func%type,
                                                    p_o_status OUT VARCHAR2)
                                
IS

CURSOR C_BUSCA_FUNC IS
        SELECT id_func, data_desligamento 
            FROM bf_func
            WHERE status_func = UPPER(p_i_status);

BEGIN
    IF UPPER(p_i_status) = 'S' OR UPPER(p_i_status) = 'N'  THEN
         p_o_status := 'STATUS OK';
         
         FOR r_BUSCA_FUNC IN C_BUSCA_FUNC LOOP
        
                IF UPPER(p_i_status) = 'S' THEN    
                    UPDATE bf_func
                    SET salario_func = NVL(salario_func,0)+100.11
                    WHERE id_func = 13;--r_BUSCA_FUNC.id_func;
                
                ELSE 
                      IF r_BUSCA_FUNC.data_desligamento is null THEN 
                          UPDATE bf_func
                          SET data_desligamento=sysdate
                          WHERE id_func = r_BUSCA_FUNC.id_func; 
                      END IF;   
                 
                    COMMIT;
                END IF;    
        END LOOP;  
             
    ELSE  
        p_o_status := 'STATUS INEXISTENTE';
    END IF;
    

EXCEPTION
    WHEN OTHERS THEN
        RAISE;

  
END ATUALIZA_FUNC_SAL_DESL;

/
