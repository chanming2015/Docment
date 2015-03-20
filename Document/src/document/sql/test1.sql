--通过数据字典查看参数(动态性能视图)
SELECT  * FROM v$parameter;

--修改SGA内存大小
alter system set sga_max_size=1G scope=spfile;  --修改SGA内存大小

--查看所有用户信息
select * from dba_users;

--查看控制文件，数据文件，重做日志文件的位置
select * from v$controlfile;
select * from v$datafile;
select * from v$logfile;

--查看进程和后台进程
SELECT * FROM v$process;
SELECT * FROM v$bgprocess;

--查看当前的用户会话
SELECT SID,serial#,username FROM v$session WHERE username IS NOT NULL;

--alter system kill session ‘SID,SERIAL#’ 来强制关闭用户的会话
ALTER SYSTEM KILL SESSION '214,10';

SELECT * FROM v$tablespace;
