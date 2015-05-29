CREATE TABLE test1
(
 tid INT
)
TABLESPACE myspace1;

CREATE TABLE test2
(
 tid INT
)
TABLESPACE users;

--给scott创建了一张表
CREATE TABLE scott.test3
(
 tid INT
);

SELECT * FROM scott.test3;