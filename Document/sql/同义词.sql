SELECT * FROM scott.emp;

--����˽��ͬ���
CREATE SYNONYM myemp FOR scott.emp; --grant create synonym to zhangsan;

SELECT * FROM myemp;

DROP SYNONYM myemp;

--����ͬ���
CREATE PUBLIC SYNONYM department FOR scott.dept;   --grant create public synonym to zhangsan;

SELECT * FROM department;

DROP PUBLIC SYNONYM department;     --grant drop public synonym to zhangsan;

SELECT * FROM user_sys_privs;

SELECT * FROM user_synonyms;
