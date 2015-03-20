--ORACLE中连接查询：SQL86标准，SQL99标准

--内连接
SELECT * FROM emp a1,dept a2 WHERE a1.deptno=a2.deptno;
SELECT * FROM emp a1 INNER JOIN dept a2 ON a1.deptno = a2.deptno;

--using(字段名) ，这种内连接必须是两张表有同名的字段
SELECT * FROM emp a1 INNER JOIN dept a2 USING(deptno);
--NATURAL 自然连接，必须两张表中有一个同名字段且数据类型相同
SELECT * FROM emp NATURAL JOIN dept;

ALTER TABLE emp ADD abc VARCHAR2(20);
ALTER TABLE dept ADD abc VARCHAR2(20);
ALTER TABLE emp DROP COLUMN abc;
ALTER TABLE dept DROP COLUMN abc;

--左外连接
SELECT * FROM dept a1,emp a2 WHERE a1.deptno=a2.deptno(+);
SELECT * FROM dept a1 LEFT OUTER JOIN emp a2 ON a1.deptno=a2.deptno;

--右外连接
SELECT * FROM emp a1,dept a2 WHERE a1.deptno(+)=a2.deptno;
SELECT * FROM emp a1 RIGHT OUTER JOIN dept a2 ON a1.deptno=a2.deptno;

--完全外连接
--SQL86中不能实现完全外连接
--SELECT * FROM emp a1,dept a2 WHERE a1.deptno(+)=a2.deptno(+);
SELECT * FROM emp a1 FULL OUTER JOIN dept a2 ON a1.deptno=a2.deptno;

--交叉连接
SELECT COUNT(*) FROM emp;
SELECT COUNT(*) FROM dept;
SELECT * FROM emp,dept;
SELECT * FROM emp CROSS JOIN dept;
-----------------------------------------------------------------------------
--ORACLE中的子查询——相关子查询
--查询出至少有两个下属的员工信息
SELECT * FROM emp;

SELECT mgr,COUNT(*) FROM emp WHERE mgr IS NOT NULL GROUP BY mgr HAVING COUNT(*)>1;

--这个是不相关子查询
SELECT *
FROM emp a1
WHERE a1.empno IN
(SELECT mgr FROM emp WHERE mgr IS NOT NULL 
GROUP BY mgr HAVING COUNT(*)>1);

--这个就是相关子查询，特点：内层查询用到了外层查询的字段
SELECT *
FROM emp a1
WHERE a1.empno =
(
  SELECT a2.mgr FROM emp a2 WHERE a2.mgr=a1.empno 
  GROUP BY a2.mgr HAVING COUNT(*)>1
);

--查询出所有工资高于部门平均工资的员工信息(相关子查询)
SELECT deptno,AVG(sal) FROM emp GROUP BY deptno;

SELECT * 
FROM emp a1
WHERE a1.sal>
(
 SELECT AVG(a2.sal) FROM emp a2 WHERE a2.deptno=a1.deptno
);

--exists操作符的使用
--查询出只有一个下属的员工信息
SELECT *
FROM emp a1
WHERE EXISTS
(
  SELECT a2.mgr FROM emp a2 WHERE a2.mgr=a1.empno 
  GROUP BY a2.mgr HAVING COUNT(*)=1
);

--查询出没有下属的员工信息(建议：能用EXISTS尽量不用IN或> <条件)
SELECT *
FROM emp a1
WHERE NOT EXISTS
(
  SELECT * FROM emp a2 WHERE a2.mgr=a1.empno
);

-----------------------------------------------------------------------
--ALL , ANY , SOME 这三个操作符
--查询出比30号部门所有人工资高的员工信息
SELECT *
FROM emp a1
WHERE a1.sal >(SELECT MAX(sal) FROM emp WHERE deptno=30);

SELECT *
FROM emp a1
WHERE a1.sal >ALL(SELECT sal FROM emp WHERE deptno=30);

--查询出比30号部门任意一个人工资高的员工信息
SELECT *
FROM emp a1
WHERE a1.sal >(SELECT MIN(sal) FROM emp WHERE deptno=30)
ORDER BY a1.empno;

SELECT *
FROM emp a1
WHERE a1.sal >ANY (SELECT sal FROM emp WHERE deptno=30)
ORDER BY a1.empno;

--SOME的作用等同于ANY
SELECT *
FROM emp a1
WHERE a1.sal >SOME (SELECT sal FROM emp WHERE deptno=30)
ORDER BY a1.empno;

-----------------------------------------------------------------------
--UNION ALL , UNION , INTERSECT , MINUS 集合操作符
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
-- 并集（不去重复）
SELECT * FROM emp a1 WHERE a1.deptno = 10
UNION ALL
SELECT * FROM emp a1 WHERE a1.sal>2000;

-- 并集（去重复）
SELECT * FROM emp a1 WHERE a1.deptno = 10
UNION
SELECT * FROM emp a1 WHERE a1.sal>2000;

-- 交集
SELECT * FROM emp a1 WHERE a1.deptno = 10
INTERSECT
SELECT * FROM emp a1 WHERE a1.sal>2000;

-- 减集
SELECT * FROM emp a1 WHERE a1.deptno = 10
MINUS
SELECT * FROM emp a1 WHERE a1.sal>2000;

-- 减集
SELECT * FROM emp a1 WHERE a1.sal>2000
MINUS
SELECT * FROM emp a1 WHERE a1.deptno = 10;

SELECT * FROM emp a1 WHERE a1.sal>2000 AND a1.deptno<>10;


