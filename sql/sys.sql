alter user scott account unlock identified by tiger;

grant create view to scott;

create user zhangsan
identified by zhangsan;

grant connect to zhangsan;
grant select any table to zhangsan;

grant create synonym to zhangsan;

grant create public synonym to zhangsan;

SELECT * FROM department;

grant drop public synonym to zhangsan;

grant alter any table to public;

create user lisi
identified by lisi;

grant connect to lisi;
grant select on scott.emp to lisi;
grant select on department to lisi;
revoke select on scott.emp from lisi;
revoke select on department from lisi;
