--表空间管理

--创建表空间（只有一个数据文件的表空间）
CREATE TABLESPACE myspace01 
DATAFILE 'D:\oracletablespace\myspace01.dbf' SIZE 1M REUSE;

--修改表空间数据文件为自增，每次增加1M，最大3M
ALTER DATABASE DATAFILE 'D:\oracletablespace\myspace01.dbf'
AUTOEXTEND ON NEXT 1M
MAXSIZE 3M;

--修改数据文件，设置为无限大小
ALTER DATABASE DATAFILE 'D:\oracletablespace\myspace01.dbf'
AUTOEXTEND ON MAXSIZE UNLIMITED;

--这是一个可以自增长的表空间，而且大小不限（常用）
CREATE TABLESPACE myspace01
DATAFILE 'D:\oracletablespace\myspace01.dbf' SIZE 2m 
AUTOEXTEND ON NEXT 2m 
MAXSIZE UNLIMITED; --50m;

--这是由两个数据文件构成的表空间
CREATE TABLESPACE myspace03
DATAFILE 'd:\myspace03.dbf' SIZE 2m AUTOEXTEND ON NEXT 2m MAXSIZE 50m,
                'd:\myspace3_2.dbf' SIZE 5m;
                
--创建一个临时表空间(临时表空间主要用来做排序等操作)
CREATE TEMPORARY TABLESPACE mytemp01
TEMPFILE 'd:\mytemp01.dbf' SIZE 2m AUTOEXTEND ON;

--创建一个重做表空间
CREATE UNDO TABLESPACE myundo01
   DATAFILE 'd:\myundo01.dbf'
   SIZE 10M AUTOEXTEND ON
                
-------------------------------------------------------------------------
--使表空间离线
ALTER TABLESPACE myspace01 OFFLINE;

--修改数据文件的位置
ALTER TABLESPACE myspace01 
RENAME DATAFILE 'd:\myspace01.dbf' TO 'c:\myspace01.dbf';

--使表空间上线
ALTER TABLESPACE myspace01 ONLINE;

-------------------------------------------------------------------------
--删除表空间(必须这个表空间是空的)
DROP TABLESPACE myspace01;

--删除表空间，连同内容一起
DROP TABLESPACE myspace01 INCLUDING CONTENTS;

--删除表空间，连同内容和文件一起删除
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
