--ͨ�������ֵ�鿴����(��̬������ͼ)
SELECT  * FROM v$parameter;

--�޸�SGA�ڴ��С
alter system set sga_max_size=1G scope=spfile;  --�޸�SGA�ڴ��С

--�鿴�����û���Ϣ
select * from dba_users;

--�鿴�����ļ��������ļ���������־�ļ���λ��
select * from v$controlfile;
select * from v$datafile;
select * from v$logfile;

--�鿴���̺ͺ�̨����
SELECT * FROM v$process;
SELECT * FROM v$bgprocess;

--�鿴��ǰ���û��Ự
SELECT SID,serial#,username FROM v$session WHERE username IS NOT NULL;

--alter system kill session ��SID,SERIAL#�� ��ǿ�ƹر��û��ĻỰ
ALTER SYSTEM KILL SESSION '214,10';

SELECT * FROM v$tablespace;
