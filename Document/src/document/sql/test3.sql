--创建用户
CREATE USER zs IDENTIFIED BY "123";
CREATE USER ww IDENTIFIED BY "123";
CREATE USER tq IDENTIFIED BY "123";
-------------------------------------------------------
--授予的是系统权限--
--授权可以创建会话
GRANT CREATE SESSION TO zs;
GRANT CREATE SESSION TO ww WITH ADMIN OPTION; --允许ww将这个权限给别人
GRANT CREATE SESSION TO tq;
--授权可以创建表
GRANT CREATE TABLE TO zs;
-------------------------------------------------------

--授予对象权限--
--授权ww可以查询zs.student表
GRANT SELECT ON zs.student TO ww;
--授权ww可以查询zs.student表，并且可以将这个权限授给别人
GRANT SELECT ON zs.student TO ww WITH GRANT OPTION;
-------------------------------------------------------
--收回权限
--撤销ww查询zs.student表的权限（注意：ww授权给别人的也收回了）
REVOKE SELECT ON zs.student FROM ww;
-------------------------------------------------------

--修改用户的默认表空间和限额
ALTER USER zs
DEFAULT TABLESPACE myspace01
QUOTA UNLIMITED ON myspace01;
-------------------------------------------------------
--授予角色
GRANT DBA TO tq WITH ADMIN OPTION;
--REVOKE DBA FROM tq;

-------------------------------------------------------
--一般情况下，我们简单的使用oracle的话，可以授权两个角色：connect角色(create session），resource角色I（可以创建各种数据库对象）
CREATE USER yy IDENTIFIED BY "123"
DEFAULT TABLESPACE myspace01;
--TEMPORARY TABLESPACE mytemp01;
--QUOTA UNLIMITED ON myspace01;

GRANT CONNECT,RESOURCE TO yy;
REVOKE CONNECT,RESOURCE FROM yy;

SELECT * FROM dba_roles;
SELECT * FROM dba_role_privs WHERE grantee='YY';


-------------------------------------------------------
--创建角色
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
-- user - schema 对应的





