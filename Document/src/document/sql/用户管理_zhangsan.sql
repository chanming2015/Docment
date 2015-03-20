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

INSERT INTO test1 VALUES(1,'张三');

SELECT * FROM test1;

SELECT * FROM scott.emp;

DELETE FROM scott.emp WHERE empno=7369;

UPDATE scott.emp SET ename='大王' WHERE empno=7839;

DROP TABLE scott.emp;

--自己的东西可以授权给别人使用
GRANT ALL ON test1 TO lisi;