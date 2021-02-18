--EXERCICIOS SALA SEMANA 03
-- 26.01; 28.01

/*
EXERCICIO 01
ENTADA:ID FUNC 
SAIDA: NOME
*/

CREATE OR REPLACE FUNCTION RETURN_NAME (p_i_id_func IN bf_func.id_func%TYPE)

RETURN VARCHAR2 
IS

p_o_nome_func VARCHAR2(50);

BEGIN
    SELECT nome_func
    INTO p_o_nome_func
    FROM bf_func
    WHERE id_func = p_i_id_func;
    
    RETURN p_o_nome_func;

EXCEPTION
    WHEN OTHERS THEN
        RETURN (null);
  
END RETURN_NAME;

/*
EXERCICIO 02
ENTADA:ID DEPT 
SAIDA: SOMA DOS SALARIOS POR DEPARTAMENTO
*/

CREATE OR REPLACE FUNCTION RETURN_SOMA_SAL_IDDEPT (p_i_id_dept IN bf_func.id_dept%Type)

RETURN NUMBER 
AS 

CURSOR C_BUSCAFUNC IS
    SELECT NVL(salario_func,0) salario_func
    FROM bf_func
    WHERE id_dept = p_i_id_dept;

n_existe number;
n_soma_sal number;

BEGIN
    BEGIN
        SELECT 1
        INTO n_existe
        FROM bf_dept
        WHERE id_dept = p_i_id_dept;
    
    EXCEPTION 
        WHEN OTHERS THEN
        n_existe:=0;
    END;  

    IF (n_existe = 1) THEN
        n_soma_sal:=0;
        FOR r_C_BUSCAFUNC IN C_BUSCAFUNC LOOP
            n_soma_sal := n_soma_sal + r_C_BUSCAFUNC.salario_func;
          END LOOP;
        RETURN  n_soma_sal;
    else 
        n_soma_sal:=-1;
        RETURN n_soma_sal;
    END IF;    
    EXCEPTION
       WHEN OTHERS THEN
            RETURN null;
    
                
END RETURN_SOMA_SAL_IDDEPT;



