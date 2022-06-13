CREATE DATABASE	quan_ly_diem_thi;
USE quan_ly_diem_thi;
CREATE TABLE hoc_sinh(
id_student varchar(20) primary key,
`name` varchar(50),
birthday datetime ,
class varchar(20) ,
gender varchar(20)
);
CREATE TABLE mon_hoc(
id_subjects varchar(20) primary key,
name_subjects varchar(50)
);
CREATE TABLE bang_diem(
id_student varchar(20),
id_subjects varchar(20),
point int,
date datetime,
primary key( id_student, id_subjects),
FOREIGN KEY (id_student) REFERENCES hoc_sinh(id_student),
FOREIGN KEY (id_subjects) REFERENCES mon_hoc(id_subjects)
);
CREATE TABLE giao_vien(
id_teacher varchar(20) primary key,
name_teacher varchar(20),
number_phone varchar(10)
);
ALTER TABLE mon_hoc ADD id_teacher varchar(20);
ALTER TABLE mon_hoc ADD CONSTRAINT fk_magv FOREIGN KEY (id_teacher) REFERENCES giao_vien(id_teacher)student;

