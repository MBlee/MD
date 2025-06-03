#### MySQL

```mysql
# 启动
mysql/bin/mysqld.exe
# 连接
mysql/bin/mysql.exe
# 连接（命令行）
mysql.exe 
-h host
-P port
-u root
-p password
-D database
< _.sql
# 断开
quit
# 基本命令
show databases;
show create database xx \G;
use _db;
show tables;
desc _tb;
```

```mysql
### 数据库/模式定义
# 增删改
CREATE|ALTER {DATABASE|SCHEMA} IF NOT EXISTS _db
	DEFAULT CHARACTER SET=utf8
	DEFAULT COLLATE=_collater;
DROP {DATABASE|SCHEMA} IF EXISTS _db;
# 查
SHOW DATABASES
	LIKE '_%pattern%_'|WHERE exp;
```

```mysql
### 数据表定义
# 增删改
CREATE TABLE _tbl LIKE _tbl;
CREATE [TEMPORARY] TABLE _tbl
	(
		col VARCHAR(10) NOT NULL 'COL' PRIMARY KEY,
      	col VARCHAR(10) REFERENCES _tbl(_col),
		[CONSTRAINT symbol] PRIMARY KEY(_col),
      	[CONSTRAINT symbol] FOREIGN KEY(_col),
		UNIQUE INDEX idx(_col...)
	)(ENGINE=innodb);
ALTER TABLE _tbl
	ADD COLUMN|KEY|INDEX col ... {FIRST|AFTER}
	CHANGE COLUMN col ...,
	ALTER COLUMN col SET|DROP DEFAULT col,
	MODIFY COLUMN col CHAR(10) FIRST;
	RENAME TO _tbl2
RENAME TABLE
	_tbl1 TO _tbl2...;
DROP TABLE IF EXISTS _tbl;
# 查
SHOW TABLES 
	{FROM|IN} _db;
SHOW COLUMNS 
	{FROM|IN} _db;
DESC _db;
SHOW CREATE TABLE _db;
```

```mysql
### 索引定义
# 增删改
CREATE INDEX idx 
	ON _tbl(col(2) DESC,...);
DROP INDEX 
	ON _tbl;
# 查
SHOW {INDEXES|KEYS} 
	{FROM|IN} _tbl;
```

```mysql
### 视图定义
CREATE|ALTER VIEW _view(_col...)
	AS (SELECT...)
	[WITH [CASCADED|LOCAL] CHECK OPTION]
DROP VIEW IF EXISTS _view
	[RESTRICT|CASCADE]
SHOW CREATE VIEW _VIEW
```

```mysql
### 数据更新
# 增删改
INSERT INTO _tbl(_col1,...)
	VALUES(DEFAULT,NULL,...),...
INSERT INTO _tbl
	SET _col1=DEFAULT,...
INSERT INTO _tbl(_col1,...)
	SELECT ...
DELETE FROM _tbl
	WHERE ...
	ORDER BY ...DESC
	LIMIT _row
UPDATE _tbl
	SET _col=xx,...
	WHERE ...
	ORDER BY ...DESC
	LIMIT _row
# 查
SELECT _col AS _col1, _col+1, COUNT(_col) 
	CASE
	WHEN _col=xx THEN xx
	ELSE XX
	END
SELECT FROM _tbl,_tbl1
SELECT FROM _tbl JOIN|LEFT JOIN|RIGHT JOIN _tbl1
	ON _tbl.xx=_tbl.xx
SELECT FROM _tbl
	WHERE BETWEEN exp1 AND exp2
	WHERE _col IN (subQuery)
	WHERE EXIT(subQuery)
	WHERE a (<=>) ALL|SOME|ANY (subQuery)
	WHERE LIKE "_%xx%_"
	WHERE REGEXP reg
	WHERE IS NULL
SELECT FROM _tbl
	GROUP BY _col... WITH ROLLUP
	HAVING COUNT(*)<=3
	ORDER BY _col DESC
	LIMIT _offset _row
```

```mysql
# 编程语法
DELIMITER $$
DECLARE _var DEFAULT 0
SET _var=0
SELECT ... INTO _var
IF THEN
	ELSE IF THEN... ELSE
END IF
CASE _var
	WHEN THEN... ELSE
END CASE
WHILE _exp DO ...
	END WHILE
REPEAT ...LEAVE
LOOP ...LEAVE
# 游标
DECLARE _curser CURSER FOR SELECT...
OPEN _curser
	FETCH ... INTO ...
CLOSE _curser
### 存储过程
CREATE PROCEDURE _pr(IN|OUT|INOUT param type())
	BEGIN END
DROP PROCEDURE IF EXISTS _pr
CALL _pr(@param)
SHOW CREATE PROCEDURE _pr
### 存储函数
CREATE FUNCTION _fn(param type()) RETURNS type();
	DETERMINISTIC
	BEGIN END
DROP FUNCTION  IF EXISTS _fn
SELECT _fn(param)
SHOW CREATE FUNCTION _fn
```

```mysql
### 触发器
CREATE TRIGGER _trig BEFORE|AFTER INSERT...
	ON _tbl FOR EACH ROW
	BEGIN NEW|OLD END
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = ''
DROP TRIGGER IF EXISTS _trig
### 用户
CREATE USER _user@localhost 
	IDENTIFIED BY PASSWORD PASSWORD('123')
RENAME USER _user TO _user2
SET PASSWORD FOR _user = 'XXX'|PASSWORD('123')
DROP USER _user@localhost
### 权限
GRANT ALL|CREATE USER|SELECT _tbl(_col...)
	ON *.*|*._tbl|*.routine
	TO _user@localhost IDENTIFIED BY '123'
	WITH GRANT OPTION
REVOKE ALL _tbl(_col...)
	ON *.*
	FROM _user@localhost
### 事务
BEGIN TRANSACTION
	ROLLBACK
	COMMIT
### 备份/恢复
SELECT INTO OUTFILE 
LOAD DATA INFILE INTO
```

~~~mysql
# 示例
SET NAMES UTF8
DROP DATABASE IF EXITS _db;
CREATE DATABASE _db CHARSET=UTF8
CREATE TABLE(
	_a INT(11) NOT NULL AUTO_INCREMENT,
	_b VARCHAR(100),
	_c ENUM("male","female"),
	create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	update_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY(_a),
	UNIQUE KEY(_b)
) ENGINE=innoDb DEFAULT CHARACTER SET=utf8md4;
~~~

> NPM：mysql

```js
const mysql = require('mysql')
const connection = mysql.createConnection({
    host,database,user,password
})
connection.connect(err=>{
    if err throw err
    connection.threadId
})
connection.query('SELECT',(err,res,fields)=>{
   	if err throw err
    res[0].solution
})
connection.end()
```

> NPM：sequelize

```ts
const {Sequelize,DataTypes} = require('sequelize')
const db = new Sequelize(db,user,name,{
    host,dialect:'mysql'
})
const User = db.define('tbl',{
	id:{
        type:DataTypes.STRING(50),
        primaryKey:true,
        allowNull:true
    }
},{
    timestamps:false
})
User.create({user,nick}).then(res=>{})
```

#### Redis

