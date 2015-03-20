--创建了一个角色
CREATE ROLE myrole;

--给角色授予系统权限
GRANT CREATE SESSION TO myrole;
GRANT CREATE TABLE TO myrole;
--这个系统权限太大了，ORACLE不允许授予给角色
--GRANT UNLIMITED TABLESPACE TO myrole;
--给角色授予对象权限
GRANT SELECT ON scott.emp TO myrole;

--通过数据字典查看角色有哪些系统权限和对象权限
SELECT * FROM role_sys_privs WHERE ROLE='MYROLE';
SELECT * FROM role_tab_privs WHERE ROLE='MYROLE';

--REVOKE ALL ON scott.emp FROM myrole;

--创建用户
CREATE USER superman
IDENTIFIED BY fly;

--将角色授予给用户
GRANT myrole TO superman;

--给用户再单独授权
GRANT SELECT ON scott.dept TO superman;
GRANT SELECT ANY TABLE TO superman;

--如果已知用户名，想知道这个用户有哪些系统权限和对象权限。怎么查询？
--查询该用户的系统权限
SELECT * FROM Dba_Sys_Privs WHERE grantee='SUPERMAN';
--查询该用户的对象权限
SELECT * FROM Dba_Tab_Privs WHERE grantee='SUPERMAN';
--查询该用户的角色
SELECT * FROM dba_role_privs WHERE grantee='SUPERMAN';
       --查询角色有哪些系统和对象权限
       SELECT * FROM role_sys_privs WHERE ROLE='MYROLE';
       SELECT * FROM role_tab_privs WHERE ROLE='MYROLE';

-----------------------------------------------------------------------
-----系统权限是可以传递的：
-- WITH ADMIN OPTION 的意思是superman这个用户可以再将这个系统权限给别人
GRANT CREATE ANY TABLE TO superman WITH ADMIN OPTION;

SELECT * FROM Dba_Sys_Privs WHERE grantee='SUPERMAN';
SELECT * FROM Dba_Sys_Privs WHERE grantee='OUTMAN';

REVOKE CREATE ANY TABLE FROM superman;

-----------------------------------------------------------------------
--WITH GRANT OPTION的意思是superman这个用户可以再将这个对象权限给别人
GRANT INSERT ON scott.dept TO superman WITH GRANT OPTION;

SELECT * FROM Dba_Tab_Privs WHERE grantee='SUPERMAN';
SELECT * FROM Dba_Tab_Privs WHERE grantee='OUTMAN';

REVOKE INSERT ON scott.dept FROM superman;

-----------------------------------------------------------------------
SELECT * FROM scott.dept;
--权限控制到字段，只能对修改和插入生效
GRANT UPDATE(LOC) ON scott.dept TO superman;
GRANT INSERT(deptno,dname) ON scott.dept TO superman;
