--��������
CREATE SEQUENCE seq_t1; --Ĭ�����д�1��ʼ��ÿ������1�����10��27�η�

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

--�������е������﷨��
CREATE SEQUENCE seq_t2
START WITH 10
INCREMENT BY 10
                --MINVALUE 10  |  NOMINVALUE
MAXVALUE 200    --NOMAXVALUE
NOCYCLE         --CYCLE
NOCACHE;        --CACHE 5

ALTER SEQUENCE seq_t2 CYCLE;   --�����и�Ϊ����ѭ��ʹ��
ALTER SEQUENCE seq_t2 MINVALUE 10;

SELECT seq_t2.nextval FROM dual;

CREATE SEQUENCE seq_t3
START WITH 100000000
INCREMENT BY -10
MINVALUE 10
MAXVALUE 100000000;

--�ݼ�������
SELECT seq_t3.nextval FROM dual;
