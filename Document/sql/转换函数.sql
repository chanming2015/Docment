--ת������

--�ַ������ֿ����Զ�ת����
insert INTO dept VALUES('80','ѧ����','Ъ̨��');
insert INTO dept VALUES('90',8080,'Ъ̨��');
SELECT * FROM dept;

--�ַ��������ڸ�ʽҲ�����Զ�ת��
SELECT add_months('6-12��-12',1) FROM dual;

------------------------------------------------------------------
--TO_DATE �ַ���ת��������
SELECT to_date('2012-6-1 18:30:20','yyyy-mm-dd hh24:mi:ss')-1 FROM dual;

--TO_CHAR ����ת���ַ���
SELECT ename,to_char(hiredate,'yyyy"��"mm"��"dd"��" DAY') FROM emp;
SELECT ename,to_char(hiredate,'yyyy"��"mm"��"dd"��" DAY') FROM emp;

--TO_CHAR ����ת���ַ���
SELECT ename,to_char(sal,'L999,999,999.9999') FROM emp;

--��ѯEMP���е�Ա��Ϊ��˾�����˶����� ������£�������졣
--��ѯEMP����Ա�������а��� ��COT' ��Ա����Ϣ�����ַ�����
--�õ�2012��ÿ����15�ź�ĵ�һ���������Ǽ��š�
