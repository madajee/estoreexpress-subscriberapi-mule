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

DROP TABLE products;

********************************************************************************

DROP TABLE "products";
DROP TABLE carts;
DROP TABLE cartitems;
DROP TABLE orders;
DROP TABLE orderitems;

\d+ users

 CREATE TABLE IF NOT EXISTS "tutorials" ("id"   SERIAL , "title" VARCHAR(255), "description" VARCHAR(255), "published" BOOLEAN, "createdAt" TIMESTAMP WITH TIME ZONE NOT NULL, "updatedAt" TIMESTAMP WITH TIME ZONE NOT NULL, PRIMARY KEY ("id"));

 CREATE TABLE IF NOT EXISTS "users" ("id"  SERIAL , "username" VARCHAR(255) NOT NULL UNIQUE, "password" VARCHAR(255) NOT NULL, "role" VARCHAR(255) NOT NULL DEFAULT 'user', "createdAt" TIMESTAMP WITH TIME ZONE NOT NULL, "updatedAt" TIMESTAMP WITH TIME ZONE NOT NULL, PRIMARY KEY ("id"));

 CREATE TABLE IF NOT EXISTS "carts" ("id"  SERIAL , "createdAt" TIMESTAMP WITH TIME ZONE NOT NULL, "updatedAt" TIMESTAMP WITH TIME ZONE NOT NULL, "userId" INTEGER REFERENCES "users" ("id") ON DELETE SET NULL ON UPDATE CASCADE, PRIMARY KEY ("id"));

 CREATE TABLE IF NOT EXISTS "products" ("id"  SERIAL , "name" VARCHAR(255) NOT NULL, "description" VARCHAR(255) NOT NULL, "createdAt" TIMESTAMP WITH TIME ZONE NOT NULL, "updatedAt" TIMESTAMP WITH TIME ZONE NOT NULL, PRIMARY KEY ("id"));

 CREATE TABLE IF NOT EXISTS "cartitems" ("id"  SERIAL , "quantity" INTEGER, "createdAt" TIMESTAMP WITH TIME ZONE NOT NULL, "updatedAt" TIMESTAMP WITH TIME ZONE NOT NULL, "cartId" INTEGER REFERENCES "carts" ("id") ON DELETE CASCADE ON UPDATE CASCADE, "productId" INTEGER REFERENCES "products" ("id") ON DELETE CASCADE ON UPDATE CASCADE, UNIQUE ("cartId", "productId"), PRIMARY KEY ("id"));

 CREATE TABLE IF NOT EXISTS "orders" ("id"  SERIAL , "orderidentifier" VARCHAR(255) UNIQUE NOT NULL, "customername" VARCHAR(255) NOT NULL, "ordertype" VARCHAR(255) NOT NULL, "servicetype" VARCHAR(255) NOT NULL, "status" VARCHAR(255) NOT NULL, "startdate" TIMESTAMP WITH TIME ZONE NOT NULL, "enddate" TIMESTAMP WITH TIME ZONE NOT NULL, "created_on" TIMESTAMP WITH TIME ZONE NOT NULL, "updated_on" TIMESTAMP WITH TIME ZONE NOT NULL, "userid" INTEGER REFERENCES "users" ("id") ON DELETE SET NULL ON UPDATE CASCADE, PRIMARY KEY ("id"));

  CREATE TABLE IF NOT EXISTS "orderitems" ("id"  SERIAL , "quantity" INTEGER, "created_on" TIMESTAMP WITH TIME ZONE NOT NULL, "updated_on" TIMESTAMP WITH TIME ZONE NOT NULL, "orderid" INTEGER REFERENCES "orders" ("id") ON DELETE CASCADE ON UPDATE CASCADE, "productid" INTEGER REFERENCES "products" ("id") ON DELETE CASCADE ON UPDATE CASCADE, UNIQUE ("orderid", "productid"), PRIMARY KEY ("id"));