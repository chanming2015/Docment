--转换函数

--字符和数字可以自动转换的
insert INTO dept VALUES('80','学术部','歇台子');
insert INTO dept VALUES('90',8080,'歇台子');
SELECT * FROM dept;

--字符串和日期格式也可以自动转换
SELECT add_months('6-12月-12',1) FROM dual;

------------------------------------------------------------------
--TO_DATE 字符串转换成日期
SELECT to_date('2012-6-1 18:30:20','yyyy-mm-dd hh24:mi:ss')-1 FROM dual;

--TO_CHAR 日期转换字符串
SELECT ename,to_char(hiredate,'yyyy"年"mm"月"dd"日" DAY') FROM emp;
SELECT ename,to_char(hiredate,'yyyy"年"mm"月"dd"日" DAY') FROM emp;

--TO_CHAR 数字转换字符串
SELECT ename,to_char(sal,'L999,999,999.9999') FROM emp;

--查询EMP表中的员工为公司工作了多少年 零多少月，零多少天。
--查询EMP表中员工姓名中包含 ‘COT' 的员工信息：用字符函数
--得到2012年每个月15号后的第一个星期五是几号。
