CREATE TABLE test1
(
 tid INT,
 tname VARCHAR2(20)
);

CREATE TABLE test2
(
 tid INT,
 tname VARCHAR2(20)
)
TABLESPACE users;

CREATE TABLE test3
(
 tid INT,
 tname VARCHAR2(20)
);

INSERT INTO test1 VALUES(1,'����');

SELECT * FROM test1;

SELECT * FROM scott.emp;

DELETE FROM scott.emp WHERE empno=7369;

UPDATE scott.emp SET ename='����' WHERE empno=7839;

DROP TABLE scott.emp;

--�Լ��Ķ���������Ȩ������ʹ��
GRANT ALL ON test1 TO lisi;