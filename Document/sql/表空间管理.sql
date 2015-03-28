--这是一个固定大小的表空间
CREATE TABLESPACE myspace1
DATAFILE 'f:\myspace1.dbf' SIZE 2m;

--这是一个可以自增长的表空间
CREATE TABLESPACE myspace2
DATAFILE 'f:\myspace2.dbf' SIZE 2m 
AUTOEXTEND ON 
NEXT 2m 
MAXSIZE UNLIMITED; --50m;

--这是由两个数据文件构成的表空间
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

INSERT INTO test1 VALUES(1,'张三');
INSERT INTO test1 VALUES(2,'李四');
COMMIT;

SELECT COUNT(*) FROM test1;

TRUNCATE TABLE test1;

--用来填满表空间
INSERT INTO test1 SELECT * FROM test1;

--修改数据文件大小
ALTER DATABASE DATAFILE 'f:\myspace1.dbf' RESIZE 4m;
ALTER DATABASE DATAFILE 'f:\myspace1_2.dbf' RESIZE 4m;

--修改数据文件自增长
ALTER DATABASE DATAFILE 'f:\myspace1.dbf' AUTOEXTEND ON
NEXT 2m MAXSIZE 50m;

ALTER DATABASE DATAFILE 'f:\myspace1_2.dbf' AUTOEXTEND ON
NEXT 2m MAXSIZE 50m;

--数据文件关闭自增长
ALTER DATABASE DATAFILE 'f:\myspace1.dbf' AUTOEXTEND OFF;

--为表空间添加一个文件
ALTER TABLESPACE myspace1 
ADD DATAFILE 'f:\myspace1_2.dbf' SIZE 10m;

--删除表空间中的数据文件（文件必须是空的）
ALTER TABLESPACE myspace1 
DROP DATAFILE 'f:\myspace1_2.dbf';

--总结：如果表空间容量不足，可以增大原有的数据文件，或者添加新的数据文件。

-------------------------------------------------------------------------

--表空间的几种状态：只读、可读写、离线，上线

--将表空间设为只读
ALTER TABLESPACE myspace1 READ ONLY;
--将表空间设为可读写
ALTER TABLESPACE myspace1 READ WRITE;

--将表空间离线（为了做备份或表空间的迁移）
ALTER TABLESPACE myspace1 OFFLINE;

ALTER TABLESPACE myspace1 
RENAME DATAFILE 'f:\myspace1.dbf' TO 'C:\myspace1.dbf';

ALTER TABLESPACE myspace1 
RENAME DATAFILE 'f:\myspace1_2.dbf' TO 'C:\myspace1_2.dbf';

ALTER TABLESPACE myspace1 
RENAME DATAFILE 
       'c:\myspace1.dbf','C:\myspace1_2.dbf' TO 
       'f:\myspace1.dbf','f:\myspace1_2.dbf';

--将表空间上线
ALTER TABLESPACE myspace1 ONLINE;

-------------------------------------------------------------------------

--创建一个临时表空间(临时表空间主要用来做排序等操作)
CREATE TEMPORARY TABLESPACE mytemp1
TEMPFILE 'f:\mytemp1.dbf' SIZE 2m AUTOEXTEND ON;

-------------------------------------------------------------------------

--删除表空间(必须这个表空间是空的)
DROP TABLESPACE mytemp1;

--删除表空间，连同内容一起
DROP TABLESPACE mytemp1 INCLUDING CONTENTS;

--删除表空间，连同内容和文件一起删除
DROP TABLESPACE mytemp1 INCLUDING CONTENTS AND DATAFILES;