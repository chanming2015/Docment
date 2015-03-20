--�򵥲�ѯ
/*

EMPNO       Ա����
ENAME       Ա������
JOB         ����
MGR         ��Ա���ľ�����
HIREDATE    ��ְʱ��
SAL         ����
COMM        ����������
DEPTNO      ���ű��
*/
SELECT * FROM emp;

/*
 DEPTNO       ���ű��
 DNAME        ��������
 LOC          ���ŵ�ַ
*/
SELECT * FROM dept;

/*
GRADE  нˮ�ȼ�
LOSAL  ����
HISAL  ����
*/
SELECT * FROM salgrade;

---------------------------------------------------------------------
--��ѯԱ���ı�ţ���������н ��+ , - , * , /
--                           nvl(ֵ1��ֵ2) - ���ֵ1ΪNULL���򷵻�ֵ2
SELECT empno,ename,sal*12+nvl(comm, 0)*12 FROM emp;

--��ѯ��н��1800 �� 3000 ֮���Ա����Ϣ
SELECT * FROM emp WHERE sal>=1800 AND sal<=3000;
SELECT * FROM emp WHERE sal BETWEEN 1800 AND 3000;

--��ѯ1982��1��1��֮����ְ��Ա����Ϣ
SELECT * FROM emp WHERE hiredate>='1-1��-82';
SELECT * FROM emp WHERE hiredate>=to_date('1982-1-1','yyyy-mm-dd');

--��ѯ1980��1��1�� �� 1981��6��1��֮����ְ��Ա����Ϣ
-- between and 
-- not between and
SELECT * FROM emp WHERE hiredate BETWEEN '1-1��-80' AND '1-6��-81';

--��ѯ������������ĸ�� 'O' ��Ա����Ϣ
-- like
-- not like
SELECT * FROM emp WHERE ename LIKE '__O%';

--��ѯ�����а���������ĸ 'R' ��Ա����Ϣ
SELECT * FROM emp WHERE ename LIKE '%R%R%';

--��ѯ����û�н����Ա����Ϣ
-- is null
-- is not null
SELECT * FROM emp WHERE comm IS NULL;

--��ѯ�����н����Ա����Ϣ
SELECT * FROM emp WHERE comm IS NOT NULL;

--��ѯ���в��Ǿ����Ա����Ϣ
SELECT * FROM emp WHERE job!='MANAGER';
SELECT * FROM emp WHERE job<>'MANAGER';

--��ѯ���ű��Ϊ10�ģ����߹��ʴ���1500�ģ�����������'K'��ͷ��
-- and or not �����ȼ�����
SELECT * FROM emp WHERE (deptno=10 OR sal>=1500) AND ename LIKE 'K%';

--��Ա����Ϣ����ְʱ���������
SELECT * FROM emp ORDER BY hiredate ASC;
SELECT * FROM emp ORDER BY hiredate DESC;

--��Ա����Ϣ�����������ٰ����ʽ������
SELECT * FROM emp ORDER BY deptno ASC,sal DESC;

---------------------------------------------------------------------
--��ѯԱ����ţ����������ʺ͹��ʵȼ���
SELECT empno,ename,sal,grade
FROM emp,salgrade
WHERE emp.sal BETWEEN salgrade.losal AND salgrade.hisal;

--inner join , left outer join , right outer join , cross join
SELECT empno,ename,sal,grade
FROM emp INNER JOIN salgrade
     ON emp.sal BETWEEN salgrade.losal AND salgrade.hisal

--��ѯ�������ŵ����ƣ��Լ����ŵ�Ա����
SELECT a2.dname,COUNT(*) AS "����"
FROM emp a1 INNER JOIN dept a2
         ON a1.deptno=a2.deptno
GROUP BY a2.dname;

--��ѯ��������5���Ĳ�����Ϣ
SELECT a2.dname,COUNT(*) ecount
FROM emp a1 INNER JOIN dept a2
         ON a1.deptno=a2.deptno
GROUP BY a2.dname
HAVING COUNT(*)>5;

--��ѯ�ĸ�����û��Ա��
SELECT a2.*
FROM emp a1 RIGHT JOIN dept a2
         ON a1.deptno=a2.deptno
WHERE a1.empno IS NULL;

---------------------------------------------------------------------
--��ѯSCOTT�ľ�����˭��
SELECT * FROM emp WHERE empno=(SELECT mgr FROM emp WHERE ename='SCOTT');

--��ѯ��SCOTT���ʸߵ�����Ա����Ϣ
SELECT * FROM emp WHERE sal>(SELECT sal FROM emp WHERE ename='SCOTT');

--��ѯ �벿�ű��Ϊ20��Ա��������ͬ�� Ա����Ϣ��
SELECT * FROM emp WHERE job IN (SELECT DISTINCT job FROM emp WHERE deptno=20);

--��ѯ��SMITH������ͬ��������ͬһ�����ŵ�Ա����Ϣ��
SELECT * FROM emp WHERE (job,deptno)=(SELECT job,deptno FROM emp WHERE ename='SMITH')

--��ҳ��ѯ---------------------------------------
SELECT * FROM emp ORDER BY empno;

SELECT * FROM 
(SELECT emp.*,ROWNUM rn FROM emp WHERE ROWNUM<=10 ORDER BY empno) a1
WHERE a1.rn>=6

SELECT a2.* FROM 
(SELECT a1.*,ROWNUM rn FROM 
(SELECT * FROM emp ORDER BY empno) a1
WHERE ROWNUM<=15) a2
WHERE a2.rn>=11

SELECT a2.* FROM 
(SELECT a1.*,ROWNUM rn FROM 
(SELECT emp.empno,emp.ename,dept.dname FROM emp,dept WHERE emp.deptno=dept.deptno ORDER BY empno) a1
WHERE ROWNUM<=10) a2
WHERE a2.rn>=6