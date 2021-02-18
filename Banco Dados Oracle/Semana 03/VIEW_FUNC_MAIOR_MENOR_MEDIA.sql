CREATE OR REPLACE VIEW V_FUNC_MAIOR_MENOR_MEDIA AS
(SELECT d.id_dept, 
        TRUNC(MAX(f.salario_func),2) maior_salario,
        TRUNC(MIN(f.salario_func),2) menor_salario,
        TRUNC(AVG(f.salario_func),2) media_salario 
       
    FROM bf_func f,
         bf_dept d
    WHERE f.id_dept = d.id_dept
    GROUP BY d.id_dept); 

--- TRAGA NOME DO DEPT, MAIOR SALARIO, MENOR SALARIO E MEDIA DE SALARIOS

SELECT * FROM V_FUNC_MAIOR_MENOR_MEDIA;