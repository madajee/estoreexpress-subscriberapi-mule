# postgres db

### Install
https://postgresapp.com/
https://help.mulesoft.com/s/article/Connect-to-PostgreSQL-Database

### Setup
export POSTGRES=/Applications/Postgres.app/Contents/Versions/latest/bin
export PATH=$PATH:$POSTGRES
psql

CREATE USER mulejohn WITH LOGIN PASSWORD 'mulejohn';
ALTER USER mulejohn CREATEDB;
\q
psql postgres -U mulejohn;
CREATE DATABASE estoreexpressmule;
\du
grant all privileges on database estoreexpressmule to mulejohn;
\c estoreexpressmule
\dt

CREATE TABLE users (id serial PRIMARY KEY, username VARCHAR(50) UNIQUE NOT NULL, password VARCHAR (50) NOT NULL, created_on TIMESTAMP NOT NULL, last_login TIMESTAMP);
INSERT INTO users(username, password, created_on, last_login) VALUES('user101', 'mypassword', '2016-03-04', '2016-01-01');
INSERT INTO users(username, password, created_on, last_login) VALUES('user102', 'mypassword', '2016-03-04', '2016-01-01');
INSERT INTO users(username, password, created_on, last_login) VALUES('user103', 'mypassword', '2019-03-04', '2019-01-01');
SELECT username, password, created_on, last_login from users;
UPDATE users SET last_login = '2017-01-01' where username = 'user102';
DELETE from users where username = 'user103';

DROP DATABASE estoreexpressmule;
\l