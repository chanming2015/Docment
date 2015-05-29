--��ռ����

--������ռ䣨ֻ��һ�������ļ��ı�ռ䣩
CREATE TABLESPACE myspace01 
DATAFILE 'D:\oracletablespace\myspace01.dbf' SIZE 1M REUSE;

--�޸ı�ռ������ļ�Ϊ������ÿ������1M�����3M
ALTER DATABASE DATAFILE 'D:\oracletablespace\myspace01.dbf'
AUTOEXTEND ON NEXT 1M
MAXSIZE 3M;

--�޸������ļ�������Ϊ���޴�С
ALTER DATABASE DATAFILE 'D:\oracletablespace\myspace01.dbf'
AUTOEXTEND ON MAXSIZE UNLIMITED;

--����һ�������������ı�ռ䣬���Ҵ�С���ޣ����ã�
CREATE TABLESPACE myspace01
DATAFILE 'D:\oracletablespace\myspace01.dbf' SIZE 2m 
AUTOEXTEND ON NEXT 2m 
MAXSIZE UNLIMITED; --50m;

--���������������ļ����ɵı�ռ�
CREATE TABLESPACE myspace03
DATAFILE 'd:\myspace03.dbf' SIZE 2m AUTOEXTEND ON NEXT 2m MAXSIZE 50m,
                'd:\myspace3_2.dbf' SIZE 5m;
                
--����һ����ʱ��ռ�(��ʱ��ռ���Ҫ����������Ȳ���)
CREATE TEMPORARY TABLESPACE mytemp01
TEMPFILE 'd:\mytemp01.dbf' SIZE 2m AUTOEXTEND ON;

--����һ��������ռ�
CREATE UNDO TABLESPACE myundo01
   DATAFILE 'd:\myundo01.dbf'
   SIZE 10M AUTOEXTEND ON
                
-------------------------------------------------------------------------
--ʹ��ռ�����
ALTER TABLESPACE myspace01 OFFLINE;

--�޸������ļ���λ��
ALTER TABLESPACE myspace01 
RENAME DATAFILE 'd:\myspace01.dbf' TO 'c:\myspace01.dbf';

--ʹ��ռ�����
ALTER TABLESPACE myspace01 ONLINE;

-------------------------------------------------------------------------
--ɾ����ռ�(���������ռ��ǿյ�)
DROP TABLESPACE myspace01;

--ɾ����ռ䣬��ͬ����һ��
DROP TABLESPACE myspace01 INCLUDING CONTENTS;

--ɾ����ռ䣬��ͬ���ݺ��ļ�һ��ɾ��
DROP TABLESPACE myspace01 INCLUDING CONTENTS AND DATAFILES;

-------------------------------------------------------------------------
CREATE TABLE test01
(
       str                  VARCHAR2(100)   NOT NULL
)
TABLESPACE myspace01;

INSERT INTO test01 VALUES('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');

INSERT INTO test01 SELECT * FROM test01;
COMMIT;

SELECT COUNT(1) FROM test01;
