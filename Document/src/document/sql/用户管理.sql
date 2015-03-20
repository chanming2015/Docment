--�����û�
CREATE USER zhangsan          --�û���
IDENTIFIED BY "333"           --���룬ע�⣺������ֿ�ͷ��˫����
DEFAULT TABLESPACE myspace1   --ָ��Ĭ��ʹ���ĸ���ռ�
QUOTA UNLIMITED ON myspace1;  --ָ����������������ʹ�ñ�ռ�

--�޸��û��������ռ���޶
ALTER USER zhangsan
  QUOTA UNLIMITED ON myspace1
  QUOTA 5m ON users;

--�޸��û���������Ϣ
ALTER USER zhangsan          --�û���
IDENTIFIED BY "123"           --���룬ע�⣺������ֿ�ͷ��˫����
DEFAULT TABLESPACE users   --ָ��Ĭ��ʹ���ĸ���ռ�
QUOTA UNLIMITED ON myspace1;

---------------------------------------------------------------------

--��������ϵͳȨ�ޣ�
  --���û���Ȩ���ܹ���¼���ݿ�
  GRANT CREATE SESSION TO zhangsan;
  --���û���Ȩ���ܹ�������
  GRANT CREATE TABLE TO zhangsan;
  
--��һ�¶���Ȩ��
  --���û��ܲ�ѯscott��emp��
  GRANT SELECT ON scott.emp TO zhangsan;
  --���û���ɾ��scott��emp��
  GRANT DELETE ON scott.emp TO zhangsan;
  --����������
  GRANT SELECT,DELETE ON scott.emp TO zhangsan;
  --���û��ܶ�scott��emp�������в���
  GRANT ALL ON scott.emp TO zhangsan;
  
--ͨ�������ֵ��ѯȨ����ص�����
SELECT * FROM dba_sys_privs WHERE grantee='ZHANGSAN';    --�鿴����ϵͳȨ�޵���Ȩ���
SELECT * FROM dba_tab_privs WHERE grantee='ZHANGSAN';    --�鿴���ж���Ȩ�޵���Ȩ���

--��������ֵ䱣�������е�ϵͳȨ��
SELECT * FROM system_privilege_map;
SELECT * FROM system_privilege_map WHERE NAME LIKE '%ANY TABLE%';
--��������ֵ䱣�������еĶ���Ȩ��
SELECT * FROM table_privilege_map;

--����Ȩ��
  REVOKE ALL ON scott.emp FROM zhangsan;
  REVOKE ALL ON zhangsan.test1 FROM zhangsan;
  REVOKE CREATE SESSION FROM zhangsan;

--ɾ���û�
DROP USER zhangsan;

DROP USER zhangsan CASCADE;  --��ͬ���û����������ݿ����һ��ɾ��

CREATE USER lisi
IDENTIFIED BY "444";

GRANT CREATE SESSION TO lisi;
GRANT CREATE TABLE TO lisi;

--ע�⣺���Ȩ�޺ܴ���ʹ���κα�ռ�
GRANT UNLIMITED TABLESPACE TO lisi;

GRANT CREATE ANY TABLE TO lisi;
GRANT SELECT ANY TABLE TO lisi;


--GRANT ALL ON zhangsan.test1 TO lisi;