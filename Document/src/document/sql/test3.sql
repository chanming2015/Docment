--�����û�
CREATE USER zs IDENTIFIED BY "123";
CREATE USER ww IDENTIFIED BY "123";
CREATE USER tq IDENTIFIED BY "123";
-------------------------------------------------------
--�������ϵͳȨ��--
--��Ȩ���Դ����Ự
GRANT CREATE SESSION TO zs;
GRANT CREATE SESSION TO ww WITH ADMIN OPTION; --����ww�����Ȩ�޸�����
GRANT CREATE SESSION TO tq;
--��Ȩ���Դ�����
GRANT CREATE TABLE TO zs;
-------------------------------------------------------

--�������Ȩ��--
--��Ȩww���Բ�ѯzs.student��
GRANT SELECT ON zs.student TO ww;
--��Ȩww���Բ�ѯzs.student�����ҿ��Խ����Ȩ���ڸ�����
GRANT SELECT ON zs.student TO ww WITH GRANT OPTION;
-------------------------------------------------------
--�ջ�Ȩ��
--����ww��ѯzs.student���Ȩ�ޣ�ע�⣺ww��Ȩ�����˵�Ҳ�ջ��ˣ�
REVOKE SELECT ON zs.student FROM ww;
-------------------------------------------------------

--�޸��û���Ĭ�ϱ�ռ���޶�
ALTER USER zs
DEFAULT TABLESPACE myspace01
QUOTA UNLIMITED ON myspace01;
-------------------------------------------------------
--�����ɫ
GRANT DBA TO tq WITH ADMIN OPTION;
--REVOKE DBA FROM tq;

-------------------------------------------------------
--һ������£����Ǽ򵥵�ʹ��oracle�Ļ���������Ȩ������ɫ��connect��ɫ(create session����resource��ɫI�����Դ����������ݿ����
CREATE USER yy IDENTIFIED BY "123"
DEFAULT TABLESPACE myspace01;
--TEMPORARY TABLESPACE mytemp01;
--QUOTA UNLIMITED ON myspace01;

GRANT CONNECT,RESOURCE TO yy;
REVOKE CONNECT,RESOURCE FROM yy;

SELECT * FROM dba_roles;
SELECT * FROM dba_role_privs WHERE grantee='YY';


-------------------------------------------------------
--������ɫ
CREATE ROLE myrole01;

GRANT CONNECT,RESOURCE TO myrole01;

GRANT CONNECT,RESOURCE TO yy;
REVOKE CONNECT,RESOURCE FROM yy;



GRANT myrole01 TO yy;
REVOKE myrole01 FROM yy;

GRANT CREATE ANY TABLE TO yy;

GRANT ALL ON zs.student TO yy;
REVOKE ALL ON zs.student FROM yy;

-------------------------------------------------------
-- user - schema ��Ӧ��





