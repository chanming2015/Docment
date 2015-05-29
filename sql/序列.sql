--创建序列
CREATE SEQUENCE seq_t1; --默认序列从1开始，每次增加1，最大到10的27次方

SELECT seq_t1.nextval FROM dual;
SELECT seq_t1.currval FROM dual;

CREATE TABLE t1
(
       tid            INT     PRIMARY KEY,
       tnow           DATE     DEFAULT SYSDATE NOT NULL
);

INSERT INTO t1 VALUES(seq_t1.nextval,DEFAULT);
SELECT seq_t1.currval FROM dual;

SELECT * FROM t1;

--创建序列的完整语法：
CREATE SEQUENCE seq_t2
START WITH 10
INCREMENT BY 10
                --MINVALUE 10  |  NOMINVALUE
MAXVALUE 200    --NOMAXVALUE
NOCYCLE         --CYCLE
NOCACHE;        --CACHE 5

ALTER SEQUENCE seq_t2 CYCLE;   --将序列改为可以循环使用
ALTER SEQUENCE seq_t2 MINVALUE 10;

SELECT seq_t2.nextval FROM dual;

CREATE SEQUENCE seq_t3
START WITH 100000000
INCREMENT BY -10
MINVALUE 10
MAXVALUE 100000000;

--递减的序列
SELECT seq_t3.nextval FROM dual;
