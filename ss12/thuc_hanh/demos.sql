CREATE DATABASE demos;
USE demos;

create table users (
 id  int(3) primary key,
 name varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120)

);
insert into users(name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');