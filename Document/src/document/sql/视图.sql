--创建视图
CREATE OR REPLACE VIEW empview1
AS
  SELECT * FROM emp;

SELECT * FROM empview1;

--证明：视图如果与表结构完全相同，可以进行增、删、改操作
INSERT INTO empview1 VALUES(7999,'ZHANGSAN','KILLER',NULL,SYSDATE,200,NULL,10);

---------------------------------------------------
--部分字段的视图
CREATE OR REPLACE VIEW empview2
AS
  SELECT empno,ename,job,mgr,hiredate,sal,comm FROM emp;
  
SELECT * FROM empview2;
INSERT INTO empview2 VALUES(8001,'ZHANGSAN','KILLER',NULL,SYSDATE,200,NULL);

---------------------------------------------------
--有字段采用了表达式的视图
CREATE OR REPLACE VIEW empview3
AS
  SELECT empno,ename,sal*12 salyear FROM emp;
  
SELECT * FROM empview3;
INSERT INTO empview3 VALUES(8080,'LISI',80000);

---------------------------------------------------
--带筛选条件的视图
CREATE OR REPLACE VIEW empview4
AS
  SELECT empno,ename,deptno FROM emp WHERE deptno=10
WITH CHECK OPTION CONSTRAINT empview4_deptno;  --这个用来保护视图的查询条件
  
SELECT * FROM empview4;
UPDATE empview4 SET deptno=20 WHERE empno=7839;     --这里就无法修改了
UPDATE empview4 SET ename='总裁' WHERE empno=7839;

---------------------------------------------------
--带筛选条件的视图
CREATE OR REPLACE VIEW empview5
AS
  SELECT empno,ename,deptno FROM emp WHERE deptno=10
WITH READ ONLY;             --设置视图为只读的

SELECT * FROM empview5;
UPDATE empview5 SET ename='KING' WHERE empno=7839;
