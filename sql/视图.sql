--������ͼ
CREATE OR REPLACE VIEW empview1
AS
  SELECT * FROM emp;

SELECT * FROM empview1;

--֤������ͼ������ṹ��ȫ��ͬ�����Խ�������ɾ���Ĳ���
INSERT INTO empview1 VALUES(7999,'ZHANGSAN','KILLER',NULL,SYSDATE,200,NULL,10);

---------------------------------------------------
--�����ֶε���ͼ
CREATE OR REPLACE VIEW empview2
AS
  SELECT empno,ename,job,mgr,hiredate,sal,comm FROM emp;
  
SELECT * FROM empview2;
INSERT INTO empview2 VALUES(8001,'ZHANGSAN','KILLER',NULL,SYSDATE,200,NULL);

---------------------------------------------------
--���ֶβ����˱��ʽ����ͼ
CREATE OR REPLACE VIEW empview3
AS
  SELECT empno,ename,sal*12 salyear FROM emp;
  
SELECT * FROM empview3;
INSERT INTO empview3 VALUES(8080,'LISI',80000);

---------------------------------------------------
--��ɸѡ��������ͼ
CREATE OR REPLACE VIEW empview4
AS
  SELECT empno,ename,deptno FROM emp WHERE deptno=10
WITH CHECK OPTION CONSTRAINT empview4_deptno;  --�������������ͼ�Ĳ�ѯ����
  
SELECT * FROM empview4;
UPDATE empview4 SET deptno=20 WHERE empno=7839;     --������޷��޸���
UPDATE empview4 SET ename='�ܲ�' WHERE empno=7839;

---------------------------------------------------
--��ɸѡ��������ͼ
CREATE OR REPLACE VIEW empview5
AS
  SELECT empno,ename,deptno FROM emp WHERE deptno=10
WITH READ ONLY;             --������ͼΪֻ����

SELECT * FROM empview5;
UPDATE empview5 SET ename='KING' WHERE empno=7839;
