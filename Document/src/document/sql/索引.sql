--�������Զ�����һ��Ψһ�������������������ѯ�����ܼ�����һ������
SELECT * FROM emp WHERE empno=7839;

SELECT * FROM emp WHERE ename='SCOTT';

--����������Ĭ���� B*��������
CREATE INDEX emp_ename_idx ON emp(ename);
