--��ѯ���е������ֵ��Լ���˵��
SELECT * FROM DICTIONARY;
SELECT * FROM DICT ORDER BY table_name;      --DICT��DICTIONARY��ͬ��ʡ�

/*
  �����ֵ���������Χ��
  DBA_*               �������е�*
  ALL_*               �����û��ܷ��ʵ����е�*
  USER_*              �����û�ӵ�е����е�*
*/

SELECT * FROM dba_tables;
SELECT * FROM all_tables;
SELECT * FROM user_tables;

---------------------------------------------------------------------------

--���б�ռ�
SELECT * FROM dba_tablespaces;
--���������ļ�
SELECT * FROM dba_data_files;
--��ѯ�����ļ���С
SELECT file_id,file_name,bytes/1024/1024 MB FROM dba_data_files;
--��ѯ�����ļ�ʣ������
SELECT file_id,tablespace_name,SUM(bytes)/1024/1024 MB
FROM dba_free_space GROUP BY file_id,tablespace_name
--��ѯ�����ļ��Ĵ�С��ʹ�ÿռ䣬ʣ��ռ�

SELECT a.file_id,a.file_name,a.mb ������,a.mb-b.mb ʹ������,b.mb ʣ������ FROM 
(SELECT file_id,file_name,bytes/1024/1024 MB FROM dba_data_files) a
        INNER JOIN
(SELECT file_id,tablespace_name,SUM(bytes)/1024/1024 MB
FROM dba_free_space GROUP BY file_id,tablespace_name) b
        ON a.file_id = b.file_id;

---------------------------------------------------------------------------

--Ȩ�޷���������ֵ䣺
--��������ϵͳȨ�޺Ͷ���Ȩ��
SELECT * FROM system_privilege_map;
SELECT * FROM table_privilege_map;

--��ѯ���е�ϵͳȨ�ޡ�����Ȩ�޺ͽ�ɫ����Ȩ���
SELECT * FROM dba_sys_privs;
SELECT * FROM dba_tab_privs;
SELECT * FROM dba_role_privs;

SELECT * FROM role_sys_privs;
SELECT * FROM role_tab_privs;

--��ѯ��ǰ�û���ϵͳȨ�ޡ�����Ȩ�޺ͽ�ɫ����Ȩ���
SELECT * FROM user_sys_privs;
SELECT * FROM user_tab_privs;
SELECT * FROM user_role_privs;



