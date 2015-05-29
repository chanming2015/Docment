--字符函数

-- || 表示连接字符串
SELECT a1.ename || '的工作是：' || a1.job 连接结果
FROM emp a1;

--UPPER、LOWER、INITCAP
SELECT UPPER(a1.ename),LOWER(a1.ename),INITCAP(a1.ename)
FROM emp a1;

SELECT * FROM emp a1 WHERE lower(a1.ename)='scott';

--RPAD, LPAD
SELECT rpad(ename,20,'.') || job
FROM emp;

SELECT ename || lpad(job,20,'.')
FROM emp;

--LTRIM、RTRIM、TRIM
SELECT LTRIM('                           哈哈                  ') FROM dual;
SELECT RTRIM('                           哈哈                  ') FROM dual;
SELECT RTRIM(LTRIM('                           哈哈                  ')) FROM dual;
SELECT TRIM('                           哈哈                  ') FROM dual;

SELECT TRIM('!' FROM '!!!!!!!!!!!!!!!!!哈哈!!!!!!!!!!!!!!!!') FROM dual;

--REPLACE
SELECT REPLACE('JACK and JUE','J','BL') "Changes"  FROM DUAL;

--SUBSTR
SELECT SUBSTR('hello oracle',1,5) FROM dual;
SELECT SUBSTR('hello oracle',-6,6) FROM dual;

--CONCAT
SELECT 'hello ' || 'oracle' FROM dual;
SELECT CONCAT('hello ','oracle') FROM dual;

--LENGTH 字符数
SELECT LENGTH('hello') FROM dual;
SELECT LENGTH('中国') FROM dual;

--LENGTHB 字节数
SELECT LENGTHB('hello') FROM dual;
SELECT LENGTHB('中国') FROM dual;

--INSTR
SELECT INSTR('hello oracle','oracle') FROM dual;
