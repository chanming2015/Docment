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

--��scott������һ�ű�
CREATE TABLE scott.test3
(
 tid INT
);

SELECT * FROM scott.test3;