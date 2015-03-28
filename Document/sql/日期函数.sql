--日期函数

--ORACLE中的日期可以进行加，减
--天计算
SELECT SYSDATE+1 FROM dual;
SELECT SYSDATE-1 FROM dual;
--小时计算
SELECT SYSDATE+8/24 FROM dual;
SELECT SYSDATE-8/24 FROM dual;
--分钟计算
SELECT SYSDATE+10/24/60 FROM dual;
SELECT SYSDATE-10/24/60 FROM dual;
--秒计算
SELECT SYSDATE+10/24/60/60 FROM dual;

--现在的1小时30分钟20秒之后
SELECT SYSDATE+1/24+30/24/60+20/24/60/60 FROM dual;

--SYSDATE、SYSTIMESTAMP
SELECT SYSDATE,SYSTIMESTAMP FROM dual;

--ADD_MONTHS
SELECT add_months(SYSDATE,1) FROM dual;
SELECT add_months(SYSDATE,-1) FROM dual;
SELECT add_months(SYSDATE,5*12) FROM dual;    --加年
SELECT add_months(SYSDATE,-5*12) FROM dual;

--MONTHS_BETWEEN
SELECT MONTHS_BETWEEN('6-12月-12','6-3月-12') FROM dual;

--输出每位员工已经工作的月数
SELECT empno,ename,round(months_between(SYSDATE,hiredate)/12) FROM emp;

--ROUND、TRUNC
SELECT round(SYSDATE) FROM dual;
SELECT round( to_date('2012-6-30','yyyy-mm-dd') ,'year') FROM dual;
SELECT round( to_date('2012-7-1','yyyy-mm-dd') ,'year') FROM dual;

SELECT round( to_date('2012-6-15','yyyy-mm-dd') ,'month') FROM dual;
SELECT round( to_date('2012-6-16','yyyy-mm-dd') ,'MON') FROM dual;

SELECT round( to_date('2012-6-15 11:59:59','yyyy-mm-dd hh24:mi:ss') ,'ddd') FROM dual;
SELECT round( to_date('2012-6-15 12:00:00','yyyy-mm-dd hh24:mi:ss') ,'ddd') FROM dual;

SELECT TRUNC( to_date('2012-7-1','yyyy-mm-dd') ,'year') FROM dual;

--LAST_DAY 当月的最后一天
SELECT last_day(SYSDATE) FROM dual;
SELECT last_day( to_date('2012-2-1','yyyy-mm-dd') ) FROM dual;

--查询EMP表中在一个月的倒数第三天入职的员工信息
SELECT * FROM emp WHERE hiredate=last_day(hiredate)-2;

--NEXT_DAY
SELECT next_day(SYSDATE,'星期三') FROM dual;



