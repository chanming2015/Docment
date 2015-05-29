--�ַ����ͣ�

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
SELECT * FROM test1 WHERE trim(a)=b;        --ȥ��char�Ķ���ո�
SELECT * FROM test1 WHERE a=rpad(b,10,' '); --��varchar2���ո�

DROP TABLE test1_2;
CREATE TABLE test1_2
(
 a     VARCHAR(10)        --ע�⣺��varchar��ʵ���ϻ���varchar2��Ϊ�˼����ԣ�����ʹ��varchar2����
);

INSERT INTO test1_2 VALUES('һ�����������߰˾�ʮ');

INSERT INTO test1(a) VALUES('һ������');

--��ѯ�����ַ�����صĲ���
--NLS_CHARACTERSET      AL32UTF8             �����ַ���������ռ3���ֽڡ�
--NLS_LENGTH_SEMANTICS  BYTE                 ��ʾ�����ַ�����ʱ��Ĭ�ϵĳ��ȵ�λ BYTE CHAR
SELECT * FROM v$nls_parameters;           --nls National Language Support ��������֧��

CREATE TABLE test1_3
(
 a     VARCHAR2(10 CHAR)
);

INSERT INTO test1_3 VALUES('һ�����������߰˾�ʮ');

--��ѯһ�ű�ÿ���ֶε���Ϣ
SELECT * FROM user_tab_cols WHERE table_name='TEST1';
SELECT * FROM user_tab_cols WHERE table_name='TEST1_2';
SELECT * FROM user_tab_cols WHERE table_name='TEST1_3';

--�޸ĵ�ǰ�Ự���ַ����ȵ�λ
ALTER SESSION SET NLS_LENGTH_SEMANTICS=CHAR;
ALTER SESSION SET NLS_LENGTH_SEMANTICS=BYTE;

ALTER TABLE test1_2 MODIFY a VARCHAR2(10);

-----------------------------------------------------------------------------
--��ֵ���ͣ�

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

--������Կ�������ʵ��Щ����NUMBER���͵������͡�
SELECT DUMP(a), DUMP(b), DUMP(c), DUMP(d) FROM test2_2;

-----------------------------------------------------------------------------
--����ʱ�����ͣ�

CREATE TABLE test3
(
 a     DATE,
 b     Timestamp
);

--SYSDATE       ֻ��ȷ����
--SYSTIMESTAMP  ��ȷ������
INSERT INTO test3 VALUES(SYSDATE, SYSDATE);
INSERT INTO test3 VALUES(SYSDATE, SYSTIMESTAMP);

--NLS_DATE_FORMAT    DD-MON-RR
SELECT * FROM v$nls_parameters;

--��Ĭ�����ڸ�ʽ����
INSERT INTO test3(a) VALUES('3-12��-12');
INSERT INTO test3(a) VALUES('1-10��-50');       --1950
INSERT INTO test3(a) VALUES('1-10��-49');       --2049
--Ҫ��DATE�����в���ʱ�䲿�֣������õ�to_date()������
--    ���鲻Ҫ�������ݿⱾ������ڸ�ʽ
INSERT INTO test3(a) 
       VALUES( to_date('2012-12-3 18:59:59','yyyy-mm-dd hh24:mi:ss') );
       
ALTER SESSION SET NLS_DATE_FORMAT='YYYY-MM-DD HH24:MI:SS';
INSERT INTO test3(a) 
       VALUES( '2012-12-3 18:59:59' );

SELECT * FROM test3;

SELECT * FROM scott.emp;

SELECT SYSDATE FROM dual;
SELECT to_char(SYSDATE,'yyyy"��"mm"��"dd DAY hh24:mi:ss') FROM dual;

---------------------------------------------------------------------------
--LOB���ͣ�

CREATE TABLE test4
(
 a           CLOB,
 b           BLOB
);

INSERT INTO test4(a) VALUES( rpad(' ',100000,'$') );

SELECT * FROM test4;

---------------------------------------------------------------------------
