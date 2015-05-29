--创建表(行内约束 inline constraint)
CREATE TABLE t_user
(
  userid                NUMBER(38) PRIMARY KEY,
  username              VARCHAR2(20) NOT NULL UNIQUE,
  userpass              VARCHAR2(20) NOT NULL CHECK(length(userpass)>=6),
  usersex               VARCHAR2(10) NOT NULL CHECK(usersex IN ('男','女')),
  userregtime           DATE DEFAULT SYSDATE NOT NULL
);

INSERT INTO t_user VALUES(1,'zhangsan','333','男',DEFAULT);

CREATE TABLE t_topic
(
  topicid                NUMBER(38) PRIMARY KEY,
  topictitle             VARCHAR2(200) NOT NULL,
  topiccontent           VARCHAR2(2000) NOT NULL,
  topicauthor            NUMBER(38) NOT NULL REFERENCES t_user(userid)
);

----------------------------------------------------------------------
--创建表（行外约束）
CREATE TABLE t_user
(
  userid                NUMBER(38),
  username              VARCHAR2(20) NOT NULL,
  userpass              VARCHAR2(20) NOT NULL,
  usersex               VARCHAR2(10) NOT NULL,
  userregtime           DATE DEFAULT SYSDATE NOT NULL,
  
  CONSTRAINT pk_t_user PRIMARY KEY (userid),
  CONSTRAINT uq_username UNIQUE (username),
  CONSTRAINT ck_userpass CHECK (length(username)>=6),
  CONSTRAINT ck_usersex CHECK (usersex IN ('男','女'))
);

CREATE TABLE t_topic
(
  topicid                NUMBER(38),
  topictitle             VARCHAR2(200) NOT NULL,
  topiccontent           VARCHAR2(2000) NOT NULL,
  topicauthor            NUMBER(38) NOT NULL,
  
  CONSTRAINT pk_t_topic PRIMARY KEY (topicid),
  CONSTRAINT fk_t_topic__t_user FOREIGN KEY (topicauthor) REFERENCES t_user(userid)
);

----------------------------------------------------------------------
ALTER TABLE t_topic DROP CONSTRAINT fk_t_topic__t_user;
ALTER TABLE t_topic ADD CONSTRAINT fk_t_topic__t_user  
      FOREIGN KEY (topicauthor) REFERENCES t_user(userid);
      
--添加、删除，修改字段