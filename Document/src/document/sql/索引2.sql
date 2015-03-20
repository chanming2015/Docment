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
--创建B*树索引
CREATE /*UNIQUE*/ INDEX test1_tname_idx ON test1(tname) --会将索引字段和ROWID一起保存
TABLESPACE SYSTEM;
DROP INDEX test1_tname_idx;

SELECT * FROM test1 WHERE tdept=3;      --对于重复值非常多的情况，B*树索引不起作用。(Oracle的SQL优化器不会使用到这个索引)
CREATE INDEX test1_tdept_idx ON test1(tdept);
DROP INDEX test1_tdept_idx;

--创建位图索引（ORACLE必须是企业版）
CREATE BITMAP INDEX test1_tdept_idx ON test1(tdept);
CREATE BITMAP INDEX test1_tlevel_idx ON test1(tlevel);
DROP INDEX test1_tdept_idx;
DROP INDEX test1_tlevel_idx;
CREATE BITMAP INDEX test1_tdeptandtlevel_idx ON test1(tdept,tlevel);

select * from test1 WHERE tdept=3 AND tlevel=5;

--创建主键、唯一键，会自动创建索引
ALTER TABLE test1
      ADD CONSTRAINT PK_test1 PRIMARY KEY (tid);

SELECT * FROM test1 WHERE tid=20000;

