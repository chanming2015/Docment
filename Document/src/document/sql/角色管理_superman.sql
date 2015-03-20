SELECT * FROM scott.emp;
--将自己的系统权限再给别人
GRANT CREATE ANY TABLE TO outman;

--将自己的对象权限再给别人
GRANT INSERT ON scott.dept TO outman;

--------------------------------------------

REVOKE SELECT ANY TABLE FROM superman;

SELECT * FROM scott.dept;

UPDATE scott.dept SET LOC='重庆' WHERE deptno=10;
UPDATE scott.dept SET dname='学术部' WHERE deptno=10;

INSERT INTO scott.dept VALUES(50,'学术部','重庆');

INSERT INTO scott.dept(deptno,dname) VALUES(50,'学术部');

--superman查询自己有哪些权限
SELECT * FROM user_sys_privs;
SELECT * FROM user_tab_privs;
SELECT * FROM user_role_privs;

SELECT * FROM user_tables;
SELECT * FROM all_tables;