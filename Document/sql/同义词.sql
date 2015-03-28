SELECT * FROM scott.emp;

--创建私有同义词
CREATE SYNONYM myemp FOR scott.emp; --grant create synonym to zhangsan;

SELECT * FROM myemp;

DROP SYNONYM myemp;

--公共同义词
CREATE PUBLIC SYNONYM department FOR scott.dept;   --grant create public synonym to zhangsan;

SELECT * FROM department;

DROP PUBLIC SYNONYM department;     --grant drop public synonym to zhangsan;

SELECT * FROM user_sys_privs;

SELECT * FROM user_synonyms;
