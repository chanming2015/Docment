--字符类型：

CREATE TABLE test1
(
 a     CHAR(10),
 b     VARCHAR2(10)
);

INSERT INTO test1 VALUES('abc','abc');
SELECT * FROM test1;
SELECT DUMP(a),DUMP(b) FROM test1;

SELECT * FROM test1 WHERE a='abc';
SELECT * FROM test1 WHERE b='abc';

SELECT * FROM test1 WHERE a=b;
SELECT * FROM test1 WHERE trim(a)=b;        --去掉char的多余空格
SELECT * FROM test1 WHERE a=rpad(b,10,' '); --给varchar2填充空格

DROP TABLE test1_2;
CREATE TABLE test1_2
(
 a     VARCHAR(10)        --注意：用varchar，实际上还是varchar2。为了兼容性，尽量使用varchar2类型
);

INSERT INTO test1_2 VALUES('一二三四五六七八九十');

INSERT INTO test1(a) VALUES('一二三四');

--查询关于字符集相关的参数
--NLS_CHARACTERSET      AL32UTF8             这种字符集，汉字占3个字节。
--NLS_LENGTH_SEMANTICS  BYTE                 表示声明字符类型时，默认的长度单位 BYTE CHAR
SELECT * FROM v$nls_parameters;           --nls National Language Support 国际语言支持

CREATE TABLE test1_3
(
 a     VARCHAR2(10 CHAR)
);

INSERT INTO test1_3 VALUES('一二三四五六七八九十');

--查询一张表每个字段的信息
SELECT * FROM user_tab_cols WHERE table_name='TEST1';
SELECT * FROM user_tab_cols WHERE table_name='TEST1_2';
SELECT * FROM user_tab_cols WHERE table_name='TEST1_3';

--修改当前会话的字符长度单位
ALTER SESSION SET NLS_LENGTH_SEMANTICS=CHAR;
ALTER SESSION SET NLS_LENGTH_SEMANTICS=BYTE;

ALTER TABLE test1_2 MODIFY a VARCHAR2(10);

-----------------------------------------------------------------------------
--数值类型：

CREATE TABLE test2
(
 a     NUMBER(10,5),
 b     NUMBER(10,2),
 c     NUMBER(10),
 d     NUMBER(10,-2),
 e     NUMBER(10,-5)
);

INSERT INTO test2 VALUES(12345.12345,
                         12345.12345,
                         12345.12345,
                         12345.12345,
                         12345.12345);
INSERT INTO test2(a) VALUES(12345.123456);
INSERT INTO test2(b) VALUES(12345.125);

SELECT * FROM test2;

CREATE TABLE test2_2
(
 a     NUMBER,
 b     INT,
 c     FLOAT,
 d     REAL
);

INSERT INTO test2_2 VALUES(1,1,1,1);

--这里可以看到，其实这些都是NUMBER类型的子类型。
SELECT DUMP(a), DUMP(b), DUMP(c), DUMP(d) FROM test2_2;

-----------------------------------------------------------------------------
--日期时间类型：

CREATE TABLE test3
(
 a     DATE,
 b     Timestamp
);

--SYSDATE       只精确到秒
--SYSTIMESTAMP  精确到毫秒
INSERT INTO test3 VALUES(SYSDATE, SYSDATE);
INSERT INTO test3 VALUES(SYSDATE, SYSTIMESTAMP);

--NLS_DATE_FORMAT    DD-MON-RR
SELECT * FROM v$nls_parameters;

--按默认日期格式插入
INSERT INTO test3(a) VALUES('3-12月-12');
INSERT INTO test3(a) VALUES('1-10月-50');       --1950
INSERT INTO test3(a) VALUES('1-10月-49');       --2049
--要在DATE类型中插入时间部分，必须用到to_date()函数，
--    建议不要依赖数据库本身的日期格式
INSERT INTO test3(a) 
       VALUES( to_date('2012-12-3 18:59:59','yyyy-mm-dd hh24:mi:ss') );
       
ALTER SESSION SET NLS_DATE_FORMAT='YYYY-MM-DD HH24:MI:SS';
INSERT INTO test3(a) 
       VALUES( '2012-12-3 18:59:59' );

SELECT * FROM test3;

SELECT * FROM scott.emp;

SELECT SYSDATE FROM dual;
SELECT to_char(SYSDATE,'yyyy"年"mm"月"dd DAY hh24:mi:ss') FROM dual;

---------------------------------------------------------------------------
--LOB类型：

CREATE TABLE test4
(
 a           CLOB,
 b           BLOB
);

INSERT INTO test4(a) VALUES( rpad(' ',100000,'$') );

SELECT * FROM test4;

---------------------------------------------------------------------------
