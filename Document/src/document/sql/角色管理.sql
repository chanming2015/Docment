--������һ����ɫ
CREATE ROLE myrole;

--����ɫ����ϵͳȨ��
GRANT CREATE SESSION TO myrole;
GRANT CREATE TABLE TO myrole;
--���ϵͳȨ��̫���ˣ�ORACLE�������������ɫ
--GRANT UNLIMITED TABLESPACE TO myrole;
--����ɫ�������Ȩ��
GRANT SELECT ON scott.emp TO myrole;

--ͨ�������ֵ�鿴��ɫ����ЩϵͳȨ�޺Ͷ���Ȩ��
SELECT * FROM role_sys_privs WHERE ROLE='MYROLE';
SELECT * FROM role_tab_privs WHERE ROLE='MYROLE';

--REVOKE ALL ON scott.emp FROM myrole;

--�����û�
CREATE USER superman
IDENTIFIED BY fly;

--����ɫ������û�
GRANT myrole TO superman;

--���û��ٵ�����Ȩ
GRANT SELECT ON scott.dept TO superman;
GRANT SELECT ANY TABLE TO superman;

--�����֪�û�������֪������û�����ЩϵͳȨ�޺Ͷ���Ȩ�ޡ���ô��ѯ��
--��ѯ���û���ϵͳȨ��
SELECT * FROM Dba_Sys_Privs WHERE grantee='SUPERMAN';
--��ѯ���û��Ķ���Ȩ��
SELECT * FROM Dba_Tab_Privs WHERE grantee='SUPERMAN';
--��ѯ���û��Ľ�ɫ
SELECT * FROM dba_role_privs WHERE grantee='SUPERMAN';
       --��ѯ��ɫ����Щϵͳ�Ͷ���Ȩ��
       SELECT * FROM role_sys_privs WHERE ROLE='MYROLE';
       SELECT * FROM role_tab_privs WHERE ROLE='MYROLE';

-----------------------------------------------------------------------
-----ϵͳȨ���ǿ��Դ��ݵģ�
-- WITH ADMIN OPTION ����˼��superman����û������ٽ����ϵͳȨ�޸�����
GRANT CREATE ANY TABLE TO superman WITH ADMIN OPTION;

SELECT * FROM Dba_Sys_Privs WHERE grantee='SUPERMAN';
SELECT * FROM Dba_Sys_Privs WHERE grantee='OUTMAN';

REVOKE CREATE ANY TABLE FROM superman;

-----------------------------------------------------------------------
--WITH GRANT OPTION����˼��superman����û������ٽ��������Ȩ�޸�����
GRANT INSERT ON scott.dept TO superman WITH GRANT OPTION;

SELECT * FROM Dba_Tab_Privs WHERE grantee='SUPERMAN';
SELECT * FROM Dba_Tab_Privs WHERE grantee='OUTMAN';

REVOKE INSERT ON scott.dept FROM superman;

-----------------------------------------------------------------------
SELECT * FROM scott.dept;
--Ȩ�޿��Ƶ��ֶΣ�ֻ�ܶ��޸ĺͲ�����Ч
GRANT UPDATE(LOC) ON scott.dept TO superman;
GRANT INSERT(deptno,dname) ON scott.dept TO superman;
