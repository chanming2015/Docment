--����һ���̶���С�ı�ռ�
CREATE TABLESPACE myspace1
DATAFILE 'f:\myspace1.dbf' SIZE 2m;

--����һ�������������ı�ռ�
CREATE TABLESPACE myspace2
DATAFILE 'f:\myspace2.dbf' SIZE 2m 
AUTOEXTEND ON 
NEXT 2m 
MAXSIZE UNLIMITED; --50m;

--���������������ļ����ɵı�ռ�
CREATE TABLESPACE myspace3
DATAFILE 'f:\myspace3.dbf' SIZE 2m AUTOEXTEND ON NEXT 2m MAXSIZE 50m,
         'f:\myspace3_2.dbf' SIZE 5m;

-------------------------------------------------------

CREATE TABLE test1
(
  tid INT,
  tname VARCHAR2(20)
)
TABLESPACE myspace1;

INSERT INTO test1 VALUES(1,'����');
INSERT INTO test1 VALUES(2,'����');
COMMIT;

SELECT COUNT(*) FROM test1;

TRUNCATE TABLE test1;

--����������ռ�
INSERT INTO test1 SELECT * FROM test1;

--�޸������ļ���С
ALTER DATABASE DATAFILE 'f:\myspace1.dbf' RESIZE 4m;
ALTER DATABASE DATAFILE 'f:\myspace1_2.dbf' RESIZE 4m;

--�޸������ļ�������
ALTER DATABASE DATAFILE 'f:\myspace1.dbf' AUTOEXTEND ON
NEXT 2m MAXSIZE 50m;

ALTER DATABASE DATAFILE 'f:\myspace1_2.dbf' AUTOEXTEND ON
NEXT 2m MAXSIZE 50m;

--�����ļ��ر�������
ALTER DATABASE DATAFILE 'f:\myspace1.dbf' AUTOEXTEND OFF;

--Ϊ��ռ����һ���ļ�
ALTER TABLESPACE myspace1 
ADD DATAFILE 'f:\myspace1_2.dbf' SIZE 10m;

--ɾ����ռ��е������ļ����ļ������ǿյģ�
ALTER TABLESPACE myspace1 
DROP DATAFILE 'f:\myspace1_2.dbf';

--�ܽ᣺�����ռ��������㣬��������ԭ�е������ļ�����������µ������ļ���

-------------------------------------------------------------------------

--��ռ�ļ���״̬��ֻ�����ɶ�д�����ߣ�����

--����ռ���Ϊֻ��
ALTER TABLESPACE myspace1 READ ONLY;
--����ռ���Ϊ�ɶ�д
ALTER TABLESPACE myspace1 READ WRITE;

--����ռ����ߣ�Ϊ�������ݻ��ռ��Ǩ�ƣ�
ALTER TABLESPACE myspace1 OFFLINE;

ALTER TABLESPACE myspace1 
RENAME DATAFILE 'f:\myspace1.dbf' TO 'C:\myspace1.dbf';

ALTER TABLESPACE myspace1 
RENAME DATAFILE 'f:\myspace1_2.dbf' TO 'C:\myspace1_2.dbf';

ALTER TABLESPACE myspace1 
RENAME DATAFILE 
       'c:\myspace1.dbf','C:\myspace1_2.dbf' TO 
       'f:\myspace1.dbf','f:\myspace1_2.dbf';

--����ռ�����
ALTER TABLESPACE myspace1 ONLINE;

-------------------------------------------------------------------------

--����һ����ʱ��ռ�(��ʱ��ռ���Ҫ����������Ȳ���)
CREATE TEMPORARY TABLESPACE mytemp1
TEMPFILE 'f:\mytemp1.dbf' SIZE 2m AUTOEXTEND ON;

-------------------------------------------------------------------------

--ɾ����ռ�(���������ռ��ǿյ�)
DROP TABLESPACE mytemp1;

--ɾ����ռ䣬��ͬ����һ��
DROP TABLESPACE mytemp1 INCLUDING CONTENTS;

--ɾ����ռ䣬��ͬ���ݺ��ļ�һ��ɾ��
DROP TABLESPACE mytemp1 INCLUDING CONTENTS AND DATAFILES;