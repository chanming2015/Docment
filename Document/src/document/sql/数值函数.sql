--数值函数

--ABS
SELECT ABS(-20) FROM dual;

--CEIL、FLOOR
SELECT CEIL(12.7),FLOOR(12.7) FROM dual;

--ROUND 四舍五入
SELECT ROUND(12.5),ROUND(12.4),ROUND(12.3456, 2) FROM dual;

--TRUNC 截取
SELECT TRUNC(12.5),TRUNC(12.4),TRUNC(12.3456, 2) FROM dual;

--MOD
SELECT MOD(20,3) FROM dual;

--NVL 空值置换函数
SELECT empno,ename,(sal+nvl(comm,0))*12 FROM emp;
