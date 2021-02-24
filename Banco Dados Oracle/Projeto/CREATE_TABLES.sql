--benef---------------------------
CREATE TABLE RH_BENEF (
        ID_BENEF NUMBER(2) NOT NULL, 
        TIPO VARCHAR2(20) NOT NULL, 
	    VALOR NUMBER(9,2), 
	    PONTOS NUMBER(3));
        
ALTER TABLE RH_BENEF
      ADD CONSTRAINT PK_ID_BENEF
      PRIMARY KEY(ID_BENEF);
      
---dept--------------------------
        
CREATE TABLE RH_DEPT(
    ID_DEPT NUMBER(2) NOT NULL, 
	NOME VARCHAR2(20) NOT NULL, 
	LOCACAO VARCHAR2(2) NOT NULL);
    
ALTER TABLE RH_DEPT
    ADD CONSTRAINT PK_RH_ID_DEPT
   PRIMARY KEY(ID_DEPT);
   
--pessoa--------------
CREATE TABLE RH_PESSOA( 
    ID_PESSOA NUMBER(5) NOT NULL, 
	CPF NUMBER(11) NOT NULL, 
	NOME VARCHAR2(20), 
	SOBRENOME VARCHAR2(30), 
	NASCIMENTO DATE); 
    
ALTER TABLE  RH_PESSOA
    ADD CONSTRAINT PK_RH_ID_PESSOA
   PRIMARY KEY(ID_PESSOA);    

--func------------------

CREATE TABLE RH_FUNC(
    ID_FUNC NUMBER(5) NOT NULL, 
	CONTRATACAO DATE, 
	DESLIGAMENTO DATE, 
	SALARIO NUMBER(9,2), 
	STATUS VARCHAR2(1), 
	ID_PESSOA NUMBER(5), 
	ID_DEPT NUMBER(2));   
    
ALTER TABLE RH_FUNC
    ADD CONSTRAINT PK_RH_ID_FUNC
   PRIMARY KEY(ID_FUNC);  
   
ALTER TABLE rh_func
    ADD CONSTRAINT fk_rh_id_dept
    FOREIGN KEY(id_dept)
    REFERENCES rh_dept(id_dept);
    
ALTER TABLE RH_FUNC
    ADD CONSTRAINT fk_rh_PESSOA
    FOREIGN KEY(ID_PESSOA)
    REFERENCES RH_PESSOA(ID_PESSOA);  
    
---func benef------

CREATE TABLE RH_FUNC_BENEF(
    ID_FUNC NUMBER(5) NOT NULL, 
	ID_BENEF NUMBER(2) NOT NULL, 
	CUSTO NUMBER(9,2)); 

   
ALTER TABLE RH_FUNC_BENEF
    ADD CONSTRAINT fk_ID_BENEF
    FOREIGN KEY(ID_BENEF)
    REFERENCES rh_benef(ID_BENEF);
    
ALTER TABLE RH_FUNC_BENEF
    ADD CONSTRAINT fk_id_func
    FOREIGN KEY(ID_FUNC)
    REFERENCES rh_func(ID_FUNC);  
    
------------
ALTER TABLE rh_pessoa ADD CONSTRAINT AK_RH_FUNC_CPF UNIQUE (CPF) ENABLE;

---------------------
-------------- sequences -------------

-- pessoa
CREATE SEQUENCE SEQ_rh_Pessoa
MINVALUE 1
MAXVALUE 99999
START WITH 1
INCREMENT BY 1; 

-- dept
CREATE SEQUENCE SEQ_rh_dept
MINVALUE 1
MAXVALUE 99999
START WITH 1
INCREMENT BY 1;

---- func
CREATE SEQUENCE SEQ_rh_func
MINVALUE 1
MAXVALUE 99999
START WITH 1
INCREMENT BY 1;

---- beneficio
CREATE SEQUENCE SEQ_rh_benef
MINVALUE 1
MAXVALUE 99999
START WITH 1
INCREMENT BY 1;



    
   