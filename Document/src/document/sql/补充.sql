--����һ�ű�
CREATE TABLE zhangsan.emp
AS
  SELECT * FROM scott.emp;
  
SELECT * FROM zhangsan.emp;

--����һ�ű�Ĳ����ֶ�
CREATE TABLE zhangsan.emp2
AS
  SELECT empno,ename,job FROM scott.emp;
  
SELECT * FROM zhangsan.emp2;

--����һ�ű�Ĳ����ֶΣ��ֶ����Լ�����
CREATE TABLE zhangsan.emp3
(eid,en,job)
AS
  SELECT empno,ename,job FROM scott.emp;
  
SELECT * FROM zhangsan.emp3;

------------------------------------------------------------------
--�������Ʊ�ṹ
CREATE TABLE zhangsan.emp4
AS
  SELECT * FROM scott.emp WHERE 1<>1;
  
SELECT * FROM zhangsan.emp4;

--------------------------------------------------------------------
--��һ�ű�����ݲ��뵽��һ�ű���
INSERT INTO zhangsan.emp4 SELECT * FROM scott.emp WHERE deptno=10;

UPDATE zhangsan.emp4 SET (job,sal,deptno)=
       (SELECT job,sal,deptno FROM zhangsan.emp4 WHERE ename='KING')
WHERE ename='ZHANGSAN';
