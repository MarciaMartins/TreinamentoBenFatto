DESC rh_pessoa;
desc rh_dept;
DESC rh_func;

select * from rh_pessoa;
drop table rh_pessoa;

-- create dept
CREATE TABLE RH_dept(
          id_dept NUMBER(2) NOT NULL,
          nome VARCHAR2(50),
          locacao VARCHAR2(30)
      );

-- alter table pessoa
ALTER TABLE rh_pessoa ADD CONSTRAINT AK_RH_FUNC_CPF UNIQUE (CPF) ENABLE;

-- alter table pk_func
ALTER TABLE rh_func
    ADD CONSTRAINT pk_rh_func
    PRIMARY KEY(id_func);

   
ALTER TABLE rh_func
    ADD CONSTRAINT fk_id_pessoa
    FOREIGN KEY(id_pessoa)
    REFERENCES rh_pessoa(id_pessoa);    

ALTER TABLE rh_func
    ADD CONSTRAINT fk_id_dept
    FOREIGN KEY(id_dept)
    REFERENCES bf_dept(id_dept);

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

--


