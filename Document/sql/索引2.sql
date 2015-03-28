CREATE TABLE test1
(
 tid    INT,
 tname  VARCHAR(20),
 tdept  INT,
 tlevel INT
);

BEGIN
     FOR i IN 1..50000 LOOP
         INSERT INTO test1 VALUES(i, dbms_random.string('a',10), dbms_random.value(1,5), dbms_random.value(1,10));
     END LOOP;
     COMMIT;
END;

SELECT t1.*,ROWID FROM test1 t1;

SELECT * FROM test1 WHERE tname='BktKgBlAKs';
--����B*������
CREATE /*UNIQUE*/ INDEX test1_tname_idx ON test1(tname) --�Ὣ�����ֶκ�ROWIDһ�𱣴�
TABLESPACE SYSTEM;
DROP INDEX test1_tname_idx;

SELECT * FROM test1 WHERE tdept=3;      --�����ظ�ֵ�ǳ���������B*�������������á�(Oracle��SQL�Ż�������ʹ�õ��������)
CREATE INDEX test1_tdept_idx ON test1(tdept);
DROP INDEX test1_tdept_idx;

--����λͼ������ORACLE��������ҵ�棩
CREATE BITMAP INDEX test1_tdept_idx ON test1(tdept);
CREATE BITMAP INDEX test1_tlevel_idx ON test1(tlevel);
DROP INDEX test1_tdept_idx;
DROP INDEX test1_tlevel_idx;
CREATE BITMAP INDEX test1_tdeptandtlevel_idx ON test1(tdept,tlevel);

select * from test1 WHERE tdept=3 AND tlevel=5;

--����������Ψһ�������Զ���������
ALTER TABLE test1
      ADD CONSTRAINT PK_test1 PRIMARY KEY (tid);

SELECT * FROM test1 WHERE tid=20000;

