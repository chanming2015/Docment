--���ں���

--ORACLE�е����ڿ��Խ��мӣ���
--�����
SELECT SYSDATE+1 FROM dual;
SELECT SYSDATE-1 FROM dual;
--Сʱ����
SELECT SYSDATE+8/24 FROM dual;
SELECT SYSDATE-8/24 FROM dual;
--���Ӽ���
SELECT SYSDATE+10/24/60 FROM dual;
SELECT SYSDATE-10/24/60 FROM dual;
--�����
SELECT SYSDATE+10/24/60/60 FROM dual;

--���ڵ�1Сʱ30����20��֮��
SELECT SYSDATE+1/24+30/24/60+20/24/60/60 FROM dual;

--SYSDATE��SYSTIMESTAMP
SELECT SYSDATE,SYSTIMESTAMP FROM dual;

--ADD_MONTHS
SELECT add_months(SYSDATE,1) FROM dual;
SELECT add_months(SYSDATE,-1) FROM dual;
SELECT add_months(SYSDATE,5*12) FROM dual;    --����
SELECT add_months(SYSDATE,-5*12) FROM dual;

--MONTHS_BETWEEN
SELECT MONTHS_BETWEEN('6-12��-12','6-3��-12') FROM dual;

--���ÿλԱ���Ѿ�����������
SELECT empno,ename,round(months_between(SYSDATE,hiredate)/12) FROM emp;

--ROUND��TRUNC
SELECT round(SYSDATE) FROM dual;
SELECT round( to_date('2012-6-30','yyyy-mm-dd') ,'year') FROM dual;
SELECT round( to_date('2012-7-1','yyyy-mm-dd') ,'year') FROM dual;

SELECT round( to_date('2012-6-15','yyyy-mm-dd') ,'month') FROM dual;
SELECT round( to_date('2012-6-16','yyyy-mm-dd') ,'MON') FROM dual;

SELECT round( to_date('2012-6-15 11:59:59','yyyy-mm-dd hh24:mi:ss') ,'ddd') FROM dual;
SELECT round( to_date('2012-6-15 12:00:00','yyyy-mm-dd hh24:mi:ss') ,'ddd') FROM dual;

SELECT TRUNC( to_date('2012-7-1','yyyy-mm-dd') ,'year') FROM dual;

--LAST_DAY ���µ����һ��
SELECT last_day(SYSDATE) FROM dual;
SELECT last_day( to_date('2012-2-1','yyyy-mm-dd') ) FROM dual;

--��ѯEMP������һ���µĵ�����������ְ��Ա����Ϣ
SELECT * FROM emp WHERE hiredate=last_day(hiredate)-2;

--NEXT_DAY
SELECT next_day(SYSDATE,'������') FROM dual;



