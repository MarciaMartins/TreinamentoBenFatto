--EXERCICIOS SALA SEMANA 03
-- 26.01; 28.01

/*
EXERCICIO 01
ENTADA:STATUS 
SAIDA: SOMATorIO SALARIO
*/
create or replace PROCEDURE soma_salario(v_status  IN bf_func.status_func%type,
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

/*
EXERCICIO 02
ENTADA:STATUS 
CONDIÇÃO: SE STATUS = 'S', ATUALIZAR O SALARIO COM MAIS 100 REAIS
          SE STATUS= 'N' E DATA DE DESLIGAMENTO IGUAL A NULL, ATUALIZAR O SYSDATE
SAIDA: status existe
*/

create or replace PROCEDURE ATUALIZA_FUNC_SAL_DESL(p_i_status IN bf_func.status_func%type,
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