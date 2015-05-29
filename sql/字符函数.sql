--�ַ�����

-- || ��ʾ�����ַ���
SELECT a1.ename || '�Ĺ����ǣ�' || a1.job ���ӽ��
FROM emp a1;

--UPPER��LOWER��INITCAP
SELECT UPPER(a1.ename),LOWER(a1.ename),INITCAP(a1.ename)
FROM emp a1;

SELECT * FROM emp a1 WHERE lower(a1.ename)='scott';

--RPAD, LPAD
SELECT rpad(ename,20,'.') || job
FROM emp;

SELECT ename || lpad(job,20,'.')
FROM emp;

--LTRIM��RTRIM��TRIM
SELECT LTRIM('                           ����                  ') FROM dual;
SELECT RTRIM('                           ����                  ') FROM dual;
SELECT RTRIM(LTRIM('                           ����                  ')) FROM dual;
SELECT TRIM('                           ����                  ') FROM dual;

SELECT TRIM('!' FROM '!!!!!!!!!!!!!!!!!����!!!!!!!!!!!!!!!!') FROM dual;

--REPLACE
SELECT REPLACE('JACK and JUE','J','BL') "Changes"  FROM DUAL;

--SUBSTR
SELECT SUBSTR('hello oracle',1,5) FROM dual;
SELECT SUBSTR('hello oracle',-6,6) FROM dual;

--CONCAT
SELECT 'hello ' || 'oracle' FROM dual;
SELECT CONCAT('hello ','oracle') FROM dual;

--LENGTH �ַ���
SELECT LENGTH('hello') FROM dual;
SELECT LENGTH('�й�') FROM dual;

--LENGTHB �ֽ���
SELECT LENGTHB('hello') FROM dual;
SELECT LENGTHB('�й�') FROM dual;

--INSTR
SELECT INSTR('hello oracle','oracle') FROM dual;
