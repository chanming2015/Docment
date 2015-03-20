--复制一张表
CREATE TABLE zhangsan.emp
AS
  SELECT * FROM scott.emp;
  
SELECT * FROM zhangsan.emp;

--复制一张表的部分字段
CREATE TABLE zhangsan.emp2
AS
  SELECT empno,ename,job FROM scott.emp;
  
SELECT * FROM zhangsan.emp2;

--复制一张表的部分字段，字段名自己定义
CREATE TABLE zhangsan.emp3
(eid,en,job)
AS
  SELECT empno,ename,job FROM scott.emp;
  
SELECT * FROM zhangsan.emp3;

------------------------------------------------------------------
--仅仅复制表结构
CREATE TABLE zhangsan.emp4
AS
  SELECT * FROM scott.emp WHERE 1<>1;
  
SELECT * FROM zhangsan.emp4;

--------------------------------------------------------------------
--将一张表的数据插入到另一张表中
INSERT INTO zhangsan.emp4 SELECT * FROM scott.emp WHERE deptno=10;

UPDATE zhangsan.emp4 SET (job,sal,deptno)=
       (SELECT job,sal,deptno FROM zhangsan.emp4 WHERE ename='KING')
WHERE ename='ZHANGSAN';
