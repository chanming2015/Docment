--查询所有的数据字典以及简单说明
SELECT * FROM DICTIONARY;
SELECT * FROM DICT ORDER BY table_name;      --DICT是DICTIONARY的同义词。

/*
  数据字典有三个范围：
  DBA_*               这是所有的*
  ALL_*               这是用户能访问的所有的*
  USER_*              这是用户拥有的所有的*
*/

SELECT * FROM dba_tables;
SELECT * FROM all_tables;
SELECT * FROM user_tables;

---------------------------------------------------------------------------

--所有表空间
SELECT * FROM dba_tablespaces;
--所有数据文件
SELECT * FROM dba_data_files;
--查询数据文件大小
SELECT file_id,file_name,bytes/1024/1024 MB FROM dba_data_files;
--查询数据文件剩余容量
SELECT file_id,tablespace_name,SUM(bytes)/1024/1024 MB
FROM dba_free_space GROUP BY file_id,tablespace_name
--查询数据文件的大小，使用空间，剩余空间

SELECT a.file_id,a.file_name,a.mb 总容量,a.mb-b.mb 使用容量,b.mb 剩余容量 FROM 
(SELECT file_id,file_name,bytes/1024/1024 MB FROM dba_data_files) a
        INNER JOIN
(SELECT file_id,tablespace_name,SUM(bytes)/1024/1024 MB
FROM dba_free_space GROUP BY file_id,tablespace_name) b
        ON a.file_id = b.file_id;

---------------------------------------------------------------------------

--权限方面的数据字典：
--这是所有系统权限和对象权限
SELECT * FROM system_privilege_map;
SELECT * FROM table_privilege_map;

--查询所有的系统权限、对象权限和角色的授权情况
SELECT * FROM dba_sys_privs;
SELECT * FROM dba_tab_privs;
SELECT * FROM dba_role_privs;

SELECT * FROM role_sys_privs;
SELECT * FROM role_tab_privs;

--查询当前用户的系统权限、对象权限和角色的授权情况
SELECT * FROM user_sys_privs;
SELECT * FROM user_tab_privs;
SELECT * FROM user_role_privs;



