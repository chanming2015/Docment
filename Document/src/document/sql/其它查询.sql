--ORACLE�����Ӳ�ѯ��SQL86��׼��SQL99��׼

--������
SELECT * FROM emp a1,dept a2 WHERE a1.deptno=a2.deptno;
SELECT * FROM emp a1 INNER JOIN dept a2 ON a1.deptno = a2.deptno;

--using(�ֶ���) �����������ӱ��������ű���ͬ�����ֶ�
SELECT * FROM emp a1 INNER JOIN dept a2 USING(deptno);
--NATURAL ��Ȼ���ӣ��������ű�����һ��ͬ���ֶ�������������ͬ
SELECT * FROM emp NATURAL JOIN dept;

ALTER TABLE emp ADD abc VARCHAR2(20);
ALTER TABLE dept ADD abc VARCHAR2(20);
ALTER TABLE emp DROP COLUMN abc;
ALTER TABLE dept DROP COLUMN abc;

--��������
SELECT * FROM dept a1,emp a2 WHERE a1.deptno=a2.deptno(+);
SELECT * FROM dept a1 LEFT OUTER JOIN emp a2 ON a1.deptno=a2.deptno;

--��������
SELECT * FROM emp a1,dept a2 WHERE a1.deptno(+)=a2.deptno;
SELECT * FROM emp a1 RIGHT OUTER JOIN dept a2 ON a1.deptno=a2.deptno;

--��ȫ������
--SQL86�в���ʵ����ȫ������
--SELECT * FROM emp a1,dept a2 WHERE a1.deptno(+)=a2.deptno(+);
SELECT * FROM emp a1 FULL OUTER JOIN dept a2 ON a1.deptno=a2.deptno;

--��������
SELECT COUNT(*) FROM emp;
SELECT COUNT(*) FROM dept;
SELECT * FROM emp,dept;
SELECT * FROM emp CROSS JOIN dept;
-----------------------------------------------------------------------------
--ORACLE�е��Ӳ�ѯ��������Ӳ�ѯ
--��ѯ������������������Ա����Ϣ
SELECT * FROM emp;

SELECT mgr,COUNT(*) FROM emp WHERE mgr IS NOT NULL GROUP BY mgr HAVING COUNT(*)>1;

--����ǲ�����Ӳ�ѯ
SELECT *
FROM emp a1
WHERE a1.empno IN
(SELECT mgr FROM emp WHERE mgr IS NOT NULL 
GROUP BY mgr HAVING COUNT(*)>1);

--�����������Ӳ�ѯ���ص㣺�ڲ��ѯ�õ�������ѯ���ֶ�
SELECT *
FROM emp a1
WHERE a1.empno =
(
  SELECT a2.mgr FROM emp a2 WHERE a2.mgr=a1.empno 
  GROUP BY a2.mgr HAVING COUNT(*)>1
);

--��ѯ�����й��ʸ��ڲ���ƽ�����ʵ�Ա����Ϣ(����Ӳ�ѯ)
SELECT deptno,AVG(sal) FROM emp GROUP BY deptno;

SELECT * 
FROM emp a1
WHERE a1.sal>
(
 SELECT AVG(a2.sal) FROM emp a2 WHERE a2.deptno=a1.deptno
);

--exists��������ʹ��
--��ѯ��ֻ��һ��������Ա����Ϣ
SELECT *
FROM emp a1
WHERE EXISTS
(
  SELECT a2.mgr FROM emp a2 WHERE a2.mgr=a1.empno 
  GROUP BY a2.mgr HAVING COUNT(*)=1
);

--��ѯ��û��������Ա����Ϣ(���飺����EXISTS��������IN��> <����)
SELECT *
FROM emp a1
WHERE NOT EXISTS
(
  SELECT * FROM emp a2 WHERE a2.mgr=a1.empno
);

-----------------------------------------------------------------------
--ALL , ANY , SOME ������������
--��ѯ����30�Ų��������˹��ʸߵ�Ա����Ϣ
SELECT *
FROM emp a1
WHERE a1.sal >(SELECT MAX(sal) FROM emp WHERE deptno=30);

SELECT *
FROM emp a1
WHERE a1.sal >ALL(SELECT sal FROM emp WHERE deptno=30);

--��ѯ����30�Ų�������һ���˹��ʸߵ�Ա����Ϣ
SELECT *
FROM emp a1
WHERE a1.sal >(SELECT MIN(sal) FROM emp WHERE deptno=30)
ORDER BY a1.empno;

SELECT *
FROM emp a1
WHERE a1.sal >ANY (SELECT sal FROM emp WHERE deptno=30)
ORDER BY a1.empno;

--SOME�����õ�ͬ��ANY
SELECT *
FROM emp a1
WHERE a1.sal >SOME (SELECT sal FROM emp WHERE deptno=30)
ORDER BY a1.empno;

-----------------------------------------------------------------------
--UNION ALL , UNION , INTERSECT , MINUS ���ϲ�����
/*
1	7782	CLARK	MANAGER	7839	1981-6-9	2450.00		10
2	7839	KING	PRESIDENT		1981-11-17	5000.00		10
3	7934	MILLER	CLERK	7782	1982-1-23	1300.00		10

1	7566	JONES	MANAGER	7839	1981-4-2	2975.00		20
2	7698	BLAKE	MANAGER	7839	1981-5-1	2850.00		30
3	7782	CLARK	MANAGER	7839	1981-6-9	2450.00		10
4	7788	SCOTT	ANALYST	7566	1987-4-19	3000.00		20
5	7839	KING	PRESIDENT		1981-11-17	5000.00		10
6	7902	FORD	ANALYST	7566	1981-12-3	3000.00		20
*/
-- ��������ȥ�ظ���
SELECT * FROM emp a1 WHERE a1.deptno = 10
UNION ALL
SELECT * FROM emp a1 WHERE a1.sal>2000;

-- ������ȥ�ظ���
SELECT * FROM emp a1 WHERE a1.deptno = 10
UNION
SELECT * FROM emp a1 WHERE a1.sal>2000;

-- ����
SELECT * FROM emp a1 WHERE a1.deptno = 10
INTERSECT
SELECT * FROM emp a1 WHERE a1.sal>2000;

-- ����
SELECT * FROM emp a1 WHERE a1.deptno = 10
MINUS
SELECT * FROM emp a1 WHERE a1.sal>2000;

-- ����
SELECT * FROM emp a1 WHERE a1.sal>2000
MINUS
SELECT * FROM emp a1 WHERE a1.deptno = 10;

SELECT * FROM emp a1 WHERE a1.sal>2000 AND a1.deptno<>10;


