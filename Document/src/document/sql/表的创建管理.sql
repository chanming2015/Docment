--������(����Լ�� inline constraint)
CREATE TABLE t_user
(
  userid                NUMBER(38) PRIMARY KEY,
  username              VARCHAR2(20) NOT NULL UNIQUE,
  userpass              VARCHAR2(20) NOT NULL CHECK(length(userpass)>=6),
  usersex               VARCHAR2(10) NOT NULL CHECK(usersex IN ('��','Ů')),
  userregtime           DATE DEFAULT SYSDATE NOT NULL
);

INSERT INTO t_user VALUES(1,'zhangsan','333','��',DEFAULT);

CREATE TABLE t_topic
(
  topicid                NUMBER(38) PRIMARY KEY,
  topictitle             VARCHAR2(200) NOT NULL,
  topiccontent           VARCHAR2(2000) NOT NULL,
  topicauthor            NUMBER(38) NOT NULL REFERENCES t_user(userid)
);

----------------------------------------------------------------------
--����������Լ����
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
  CONSTRAINT ck_usersex CHECK (usersex IN ('��','Ů'))
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
      
--��ӡ�ɾ�����޸��ֶ�