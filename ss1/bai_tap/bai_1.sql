create database student_management;
USE student_management;
CREATE TABLE student(
id int primary key not null,
`name` varchar(45) null,
age int null,
country varchar(45)null 
);
CREATE TABLE class(
id int primary key not null,
`name` varchar(45) null
);
CREATE TABLE teacher(
id int primary key not null,
`name` varchar(45) null,
age int null,
country varchar(45)null 
);



