CREATE DATABASE usersDB;
USE usersDB;
CREATE TABLE IF NOT EXISTS users (
         name         VARCHAR(30)   NOT NULL DEFAULT '',
         age      	  INT UNSIGNED  NOT NULL DEFAULT 0,
         money        INT UNSIGNED  NOT NULL DEFAULT 0,
         PRIMARY KEY  (name)
       )engine = InnoDB
		encrypted = YES
		encryption_key_id = 2;

INSERT INTO users (name, age, money) VALUES
         ('Edu', '12', 4123),
         ('Jose', '15', 312),
         ('Maria', '21', 414213),
         ('Paula', '32', 552134);
