SELECT * FROM scott.emp;
--���Լ���ϵͳȨ���ٸ�����
GRANT CREATE ANY TABLE TO outman;

--���Լ��Ķ���Ȩ���ٸ�����
GRANT INSERT ON scott.dept TO outman;

--------------------------------------------

REVOKE SELECT ANY TABLE FROM superman;

SELECT * FROM scott.dept;

UPDATE scott.dept SET LOC='����' WHERE deptno=10;
UPDATE scott.dept SET dname='ѧ����' WHERE deptno=10;

INSERT INTO scott.dept VALUES(50,'ѧ����','����');

INSERT INTO scott.dept(deptno,dname) VALUES(50,'ѧ����');

--superman��ѯ�Լ�����ЩȨ��
SELECT * FROM user_sys_privs;
SELECT * FROM user_tab_privs;
SELECT * FROM user_role_privs;

SELECT * FROM user_tables;
SELECT * FROM all_tables;