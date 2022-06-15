create database student_management;
USE student_management;
CREATE TABLE student(
id int primary key,
`name` varchar(45) ,
age int ,
country varchar(45)
);
CREATE TABLE class(
id int primary key,
`name` varchar(45) 
);
CREATE TABLE teacher(
id int primary key ,
`name` varchar(45) ,
age int ,
country varchar(45) 
);



