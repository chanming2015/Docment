--简单查询
/*

EMPNO       员工号
ENAME       员工姓名
JOB         工作
MGR         该员工的经理编号
HIREDATE    入职时间
SAL         工资
COMM        补贴，奖金
DEPTNO      部门编号
*/
SELECT * FROM emp;

/*
 DEPTNO       部门编号
 DNAME        部门名称
 LOC          部门地址
*/
SELECT * FROM dept;

/*
GRADE  薪水等级
LOSAL  下限
HISAL  上限
*/
SELECT * FROM salgrade;

---------------------------------------------------------------------
--查询员工的编号，姓名和年薪 ：+ , - , * , /
--                           nvl(值1，值2) - 如果值1为NULL，则返回值2
SELECT empno,ename,sal*12+nvl(comm, 0)*12 FROM emp;

--查询月薪在1800 到 3000 之间的员工信息
SELECT * FROM emp WHERE sal>=1800 AND sal<=3000;
SELECT * FROM emp WHERE sal BETWEEN 1800 AND 3000;

--查询1982年1月1号之后入职的员工信息
SELECT * FROM emp WHERE hiredate>='1-1月-82';
SELECT * FROM emp WHERE hiredate>=to_date('1982-1-1','yyyy-mm-dd');

--查询1980年1月1日 到 1981年6月1日之间入职的员工信息
-- between and 
-- not between and
SELECT * FROM emp WHERE hiredate BETWEEN '1-1月-80' AND '1-6月-81';

--查询姓名第三个字母是 'O' 的员工信息
-- like
-- not like
SELECT * FROM emp WHERE ename LIKE '__O%';

--查询姓名中包含两个字母 'R' 的员工信息
SELECT * FROM emp WHERE ename LIKE '%R%R%';

--查询所有没有奖金的员工信息
-- is null
-- is not null
SELECT * FROM emp WHERE comm IS NULL;

--查询所有有奖金的员工信息
SELECT * FROM emp WHERE comm IS NOT NULL;

--查询所有不是经理的员工信息
SELECT * FROM emp WHERE job!='MANAGER';
SELECT * FROM emp WHERE job<>'MANAGER';

--查询部门编号为10的，或者工资大于1500的，并且名字以'K'开头的
-- and or not 的优先级问题
SELECT * FROM emp WHERE (deptno=10 OR sal>=1500) AND ename LIKE 'K%';

--将员工信息按入职时间升序输出
SELECT * FROM emp ORDER BY hiredate ASC;
SELECT * FROM emp ORDER BY hiredate DESC;

--将员工信息按部门升序，再按工资降序输出
SELECT * FROM emp ORDER BY deptno ASC,sal DESC;

---------------------------------------------------------------------
--查询员工编号，姓名，工资和工资等级：
SELECT empno,ename,sal,grade
FROM emp,salgrade
WHERE emp.sal BETWEEN salgrade.losal AND salgrade.hisal;

--inner join , left outer join , right outer join , cross join
SELECT empno,ename,sal,grade
FROM emp INNER JOIN salgrade
     ON emp.sal BETWEEN salgrade.losal AND salgrade.hisal

--查询各个部门的名称，以及部门的员工数
SELECT a2.dname,COUNT(*) AS "人数"
FROM emp a1 INNER JOIN dept a2
         ON a1.deptno=a2.deptno
GROUP BY a2.dname;

--查询人数高于5个的部门信息
SELECT a2.dname,COUNT(*) ecount
FROM emp a1 INNER JOIN dept a2
         ON a1.deptno=a2.deptno
GROUP BY a2.dname
HAVING COUNT(*)>5;

--查询哪个部门没有员工
SELECT a2.*
FROM emp a1 RIGHT JOIN dept a2
         ON a1.deptno=a2.deptno
WHERE a1.empno IS NULL;

---------------------------------------------------------------------
--查询SCOTT的经理是谁？
SELECT * FROM emp WHERE empno=(SELECT mgr FROM emp WHERE ename='SCOTT');

--查询比SCOTT工资高的所有员工信息
SELECT * FROM emp WHERE sal>(SELECT sal FROM emp WHERE ename='SCOTT');

--查询 与部门编号为20的员工工作相同的 员工信息。
SELECT * FROM emp WHERE job IN (SELECT DISTINCT job FROM emp WHERE deptno=20);

--查询与SMITH工作相同，并且是同一个部门的员工信息。
SELECT * FROM emp WHERE (job,deptno)=(SELECT job,deptno FROM emp WHERE ename='SMITH')

--分页查询---------------------------------------
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