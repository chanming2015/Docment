--创建用户
CREATE USER zhangsan          --用户名
IDENTIFIED BY "333"           --密码，注意：如果数字开头加双引号
DEFAULT TABLESPACE myspace1   --指定默认使用哪个表空间
QUOTA UNLIMITED ON myspace1;  --指定可以无限容量的使用表空间

--修改用户，授予表空间的限额：
ALTER USER zhangsan
  QUOTA UNLIMITED ON myspace1
  QUOTA 5m ON users;

--修改用户的其他信息
ALTER USER zhangsan          --用户名
IDENTIFIED BY "123"           --密码，注意：如果数字开头加双引号
DEFAULT TABLESPACE users   --指定默认使用哪个表空间
QUOTA UNLIMITED ON myspace1;

---------------------------------------------------------------------

--这两个是系统权限：
  --给用户授权，能够登录数据库
  GRANT CREATE SESSION TO zhangsan;
  --给用户授权，能够创建表
  GRANT CREATE TABLE TO zhangsan;
  
--看一下对象权限
  --让用户能查询scott的emp表
  GRANT SELECT ON scott.emp TO zhangsan;
  --让用户能删除scott的emp表
  GRANT DELETE ON scott.emp TO zhangsan;
  --代替上两句
  GRANT SELECT,DELETE ON scott.emp TO zhangsan;
  --让用户能对scott的emp表做所有操作
  GRANT ALL ON scott.emp TO zhangsan;
  
--通过数据字典查询权限相关的内容
SELECT * FROM dba_sys_privs WHERE grantee='ZHANGSAN';    --查看所有系统权限的授权情况
SELECT * FROM dba_tab_privs WHERE grantee='ZHANGSAN';    --查看所有对象权限的授权情况

--这个数据字典保存了所有的系统权限
SELECT * FROM system_privilege_map;
SELECT * FROM system_privilege_map WHERE NAME LIKE '%ANY TABLE%';
--这个数据字典保存了所有的对象权限
SELECT * FROM table_privilege_map;

--撤销权限
  REVOKE ALL ON scott.emp FROM zhangsan;
  REVOKE ALL ON zhangsan.test1 FROM zhangsan;
  REVOKE CREATE SESSION FROM zhangsan;

--删除用户
DROP USER zhangsan;

DROP USER zhangsan CASCADE;  --连同该用户的所有数据库对象一起删除

CREATE USER lisi
IDENTIFIED BY "444";

GRANT CREATE SESSION TO lisi;
GRANT CREATE TABLE TO lisi;

--注意：这个权限很大，能使用任何表空间
GRANT UNLIMITED TABLESPACE TO lisi;

GRANT CREATE ANY TABLE TO lisi;
GRANT SELECT ANY TABLE TO lisi;


--GRANT ALL ON zhangsan.test1 TO lisi;