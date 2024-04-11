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

CREATE TABLE errors (id serial PRIMARY KEY, errorcode VARCHAR(50) UNIQUE NOT NULL, errortype VARCHAR(50), errormessage VARCHAR (1000) NOT NULL, msgtype VARCHAR(50), created_on TIMESTAMP NOT NULL, updated_on TIMESTAMP NOT NUL);

INSERT INTO errors(errorcode, errortype, errormessage, created_on, updated_on) VALUES('0001', 'APPERROR:CLIENT_ALREADY_EXISTS', 'The client with ID: test1 is already registered','register', '2024-02-28', '2024-02-28');

CREATE TABLE products (id serial PRIMARY KEY, title VARCHAR(50) UNIQUE NOT NULL, description VARCHAR(250), price DECIMAL NOT NULL, discountPercentage DECIMAL, rating INTEGER, stock INTEGER,  brand VARCHAR(50), category VARCHAR(50), thumbnail VARCHAR(250), created_on TIMESTAMP NOT NULL, updated_on TIMESTAMP NOT NULL);

INSERT INTO products (title, description, price, discountPercentage, rating, stock, brand, category, thumbnail, created_on, updated_on) VALUES ('iPhone 9', 'An apple mobile which is nothing like apple', 549, 12.96, 4.69, 94, 'Apple', 'smartphones', 'https://www.publicdomainpictures.net/pictures/10000/velka/1-1210009435EGmE.jpg', '2024-02-28', '2024-02-28');

select title, description, price, discountPercentage, rating, stock, brand, category, thumbnail, created_on, updated_on from products;

DROP TABLE errors;