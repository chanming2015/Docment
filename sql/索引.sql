--主键会自动创建一个唯一索引，这里根据索引查询，性能几乎是一个常量
SELECT * FROM emp WHERE empno=7839;

SELECT * FROM emp WHERE ename='SCOTT';

--创建索引，默认是 B*树索引。
CREATE INDEX emp_ename_idx ON emp(ename);
