create database CASESTUDY_WED;
use CASESTUDY_WED;
create table attach_facility(
id int primary key,
name varchar(50),
cost double,
unit varchar(10),
status varchar(45)
);
create table contract(
id int primary key,
start_date datetime,
end_date datetime,
deposit double,
employee_id int,
customer_id int,
facility_id int, 
foreign key (employee_id) references employee (id),
foreign key (customer_id) references customer (id),
foreign key (facility_id) references facility (id)
);
create table contract_detail(
id int primary key,
contract_id int,
attach_facility_id int,
quantity int,
foreign key(contract_id) references contract(id),
foreign key(attach_facility_id) references attach_facility(id)
);
create table rent_type (
id int primary key,
`name` varchar(45)
);
create table facility_type(
id int primary key,
`name` varchar(45)
);
create table facility(
id int primary key,
`name` varchar(45),
area int,
cost double,
max_people int,
rent_type_id int,
facility_type_id int,
standard_room varchar(45),
description_other_convenience varchar(45),
pool_area double,
number_of_floors int,
facility_free text,
foreign key (rent_type_id) references rent_type(id),
foreign key (facility_type_id) references facility_type(id)
);
create table customer_type (
id int primary key,
`name` varchar(45)
);
create table customer (
id int primary key,
customer_type_id int,
`name` varchar(45),
date_of_birth date,
gender bit(1),
id_card varchar(45),
phone_number varchar(45),
email varchar(45),
address varchar(45),
foreign key (customer_type_id) references customer_type(id)
);
create table position (
id int primary key,
`name` varchar(45),
`status` bit(1) default 0
);
create table education_degree (
id int primary key,
`name` varchar(45)
);
create table division (
id int primary key,
`name` varchar (45)
);
create table `role` (
role_id int primary key,
role_name varchar(255)
);
create table `user` (
username varchar(255) primary key,
`password` varchar(255)
);
create table user_role(
role_id int,
username varchar(255),
foreign key (role_id) references `role`(role_id),
foreign key (username) references `user`(username)
);
create table employee (
id int primary key,
`name` varchar(45),
date_of_birth date,
id_card varchar(45),
salary double,
phone_number varchar(45),
email varchar(45),
address varchar(45),
position_id int,
education_degree_id int,
division_id int,
username varchar(255),
foreign key (position_id) references position (id),
foreign key (education_degree_id) references education_degree(id),
foreign key (division_id) references division (id),
foreign key (username) references `user` (username)
);
insert into position
values (1, 'Lễ tân', 0),
	   (2, 'Phục vụ', 0),
	   (3, 'Chuyên viên', 0),
	   (4, 'Giám sát', 0),
	   (5, 'Quản lý', 0),
	   (6, 'Giám đốc', 0);
insert into education_degree
values (1, 'Trung cấp'),
	   (2, 'Cao đẳng'),
	   (3, 'Đại học'),
	   (4, 'Sau đại học');
insert into division
values (1, 'Sale – Marketing'),
	   (2, 'Hành chính'),
	   (3, 'Phục vụ'),
	   (4, 'Quản lý');
insert into facility_type
values (1, 'Villa', 0),
	   (2, 'House', 0),
	   (3, 'Room', 0);
insert into customer_type
values (1, 'Diamond', 0),
	   (2, 'Platinium', 0),
	   (3, 'Gold', 0),
	   (4, 'Silver', 0),
	   (5, 'Member', 0);
insert into rent_type
values (1, 'Năm', 0),
	   (2, 'Tháng', 0),
	   (3, 'Ngày', 0),
	   (4, 'Giờ', 0);
insert into `user`
values ('levanan', 'levanan'),
	   ('lengocanh', 'lengocanh'),
	   ('tranvansau', 'tranvansau');
insert into `role`
values (1, 'admin'),
	   (2, 'super'),
	   (3, 'user');
insert into user_role
values (1, 'levanan'),
	   (2, 'lengocanh'),
	   (3, 'tranvansau');
insert into attach_facility
values (1, 'Karaoke', 10000, 'giờ', 'tiện nghi, hiện tại', 0),
	   (2, 'Thuê xe máy', 10000, 'chiếc', 'hỏng 1 xe', 0),
	   (3, 'Thuê xe đạp', 20000, 'chiếc', 'tốt', 0),
	   (4, 'Buffet buổi sáng', 15000, 'suất', 'đầy đủ đồ ăn, tráng miệng', 0),
	   (5, 'Buffet buổi trưa', 90000, 'suất', 'đầy đủ đồ ăn, tráng miệng', 0),
	   (6, 'Buffet buổi tối', 16000, 'suất', 'đầy đủ đồ ăn, tráng miệng', 0);
insert into employee
values (1, 'Lê Văn An', '1980-02-25', '2045096345', 20000000, '0987654321', 'levanan@gmail.com', 'Đà Nẵng', 6, 4, 4, 'levanan'),
	   (2, 'Lê Ngọc Anh', '1992-11-12', '2045096325', 15000000, '0987653321', 'lengocanh@gmail.com', 'Quảng Nam', 3, 3, 2, 'lengocanh'),
	   (3, 'Trần Văn Sáu', '1991-06-24', '2045096395', 10000000, '0987694321', 'tranvansau@gmail.com', 'Huế', 2, 1, 2, 'tranvansau'),
	   (4, 'Nguyễn Văn An', '1970-11-07', '456231786', 10000000, '0901234121', 'annguyen@gmail.com', '295 Nguyễn Tất Thành, Đà Nẵng', 1, 3, 1, 'tranvansau'),
	   (5, 'Lê Văn Bình', '1997-04-09', '654231234', 7000000, '0931234121', 'binh@gmail.com', '22 Yên Bái, Đà Nẵng', 1, 2, 2, 'tranvansau'),
	   (6, 'Hồ Thị Yến', '1995-12-12', '999231723', 12000000, '0921234121', 'yen@gmail.com', 'K234/11 Điện Biên Phủ, Gia Lai', 1, 3, 2, 'tranvansau'),
	   (7, 'Võ Công Toản', '1980-04-04', '123231365', 3000000, '0961234121', 'toan@gmail.com', '77 Hoàng Diệu, Quảng Trị', 1, 4, 4, 'tranvansau'),
	   (8, 'Nguyễn Bỉnh Phát', '1999-12-09', '456341786', 5000000, '0981234121', 'phat@gmail.com', '43 Yên Bái, Đà Nẵng', 2, 1, 1, 'tranvansau'),
	   (9, 'Khúc Nguyễn An Nghi', '2000-11-08', '126231786', 7000000, '0931234121', 'nghi@gmail.com', '294 Nguyễn Tất Thành, Đà Nẵng', 2, 2, 3, 'tranvansau'),
	   (10, 'Nguyễn Hữu Hà', '1993-01-01', '456231786', 6000000, '0901264121', 'ha@gmail.com', '4 Nguyễn Chí Thanh, Huế', 2, 3, 2, 'tranvansau'),
	   (11, 'Nguyễn Hà Đông', '1989-09-03', '496231786', 8000000, '0911234121', 'dong@gmail.com', '111 Hùng Vương, Hà Nội', 2, 4, 4, 'tranvansau'),
	   (12, 'Tòng Hoang', '1982-09-03', '826231786', 9000000, '0921234121', 'hoang@gmail.com', '213 Hàm Nghi, Đà Nẵng', 2, 4, 4, 'tranvansau'),
	   (13, 'Nguyễn Công Đạo', '1994-01-08', '946231786', 4000000, '0971234121', 'dao@gmail.com', '6 Hoà Khánh, Đồng Nai', 2, 3, 2, 'tranvansau');
insert into customer
values (1, 5, 'Nguyễn Thị Hào', '1970-11-07', 0, '643431213', '0987654321', 'thihao07@gmail.com', '23 Nguyễn Hoàng, Đà Nẵng'),
	 (2, 3, 'Phạm Xuân Diệu', '1992-08-08', 1, '865342123', '0987654321', 'xuandieu92@gmail.com', 'K77/22 Thái Phiên, Quảng Trị'),
	 (3, 1, 'Trương Đình Nghệ', '1990-02-27', 1, '488645199', '0987654321', 'nghenhan2702@gmail.com', 'K323/12 Ông Ích Khiêm, Vinh'),
	 (4, 1, 'Dương Văn Quan', '1981-07-08', 1, '634635974', '0987654321', 'duongquan@gmail.com', 'K453/12 Lê Lợi, Đà Nẵng'),
	 (5, 4, 'Hoàng Trần Nhi Nhi', '1995-12-09', 0, '241234757', '0987654321', 'nhinhi123@gmail.com', '224 Lý Thái Tổ, Gia Lai'),
	 (6, 4, 'Tôn Nữ Mộc Châu', '2005-12-06', 0, '956352456', '0987654321', 'tonnuchau@gmail.com', '37 Yên Thế, Đà Nẵng'),
	 (7, 1, 'Nguyễn Mỹ Kim', '1984-04-08', 0, '445682467', '0987654321', 'kimcuong84@gmail.com', 'K123/45 Lê Lợi, Hồ Chí Minh'),
	 (8, 3, 'Nguyễn Thị Hào', '1999-04-08', 0, '456789034', '0987654321', 'haohao99@gmail.com', '55 Nguyễn Văn Linh, Kon Tum'),
	 (9, 1, 'Trần Đại Danh', '1994-07-01', 1, '456788956', '0987654321', 'danhhai99@gmail.com', '24 Lý Thường Kiệt, Quảng Ngãi'),
	 (10, 2, 'Nguyễn Tâm Đắc', '1989-07-01', 1, '435678954', '0987654321', 'dactam@gmail.com', '22 Ngô Quyền, Đà Nẵng');
insert into facility
values (1, 'Villa Beach Front', 25000, 10000000, 10, 3, 1, 'vip', 'Có hồ bơi', 500, 4, null, 0),
	   (2, 'House Princess 01', 14000, 5000000, 7, 2, 2, 'vip', 'Có thêm bếp nướng', null, 3, null,  0),
	   (3, 'Room Twin 01', 5000, 1000000, 2, 4, 3, 'normal', 'Có tivi', null, null, 'Nước lọc', 0),
	   (4, 'Villa No Beach Front', 22000, 9000000, 8, 3, 1, 'normal', 'Có hồ bơi', 300, 3, null, 0),
	   (5, 'House Princess 02', 10000, 4000000, 5,  3, 2, 'normal', 'Có thêm bếp nướng', null, 2, null, 0),
	   (6, 'Room Twin 02', 3000, 900000, 2, 4, 3, 'normal', 'Có tivi', null, null, 'Nước lọc', 0);
insert into contract
values (1, '2020-12-08', '2020-12-08', 0, 3, 1, 3, 0),
	   (2, '2020-07-14', '2020-07-21', 200000, 7, 3, 1, 0),
	   (3, '2021-03-15', '2021-03-17', 50000, 3, 4, 2, 0),
	   (4, '2021-01-14', '2021-01-18', 100000, 7, 5, 5, 0),
	   (5, '2021-07-14', '2021-07-15', 0, 7, 2, 6, 0),
	   (6, '2021-06-01', '2021-06-03', 0, 7, 7, 6, 0),
	   (7, '2021-09-02', '2021-09-05', 100000, 7, 4, 4, 0),
	   (8, '2021-06-17', '2021-06-18', 150000, 3, 4, 1, 0),
	   (9, '2020-11-19', '2020-11-19', 0, 3, 4, 3, 0),
	   (10, '2021-04-12', '2021-04-14', 0, 10, 3, 5, 0),
	   (11, '2021-04-25', '2021-04-25', 0, 2, 2, 1, 0),
	   (12, '2021-05-25', '2021-05-27', 0, 7, 10, 1, 0);
insert into contract_detail
values (1, 2, 4, 5, 0),
	   (2, 2, 5, 8, 0),
       (3, 2, 6, 15, 0),
	   (4, 3, 1, 1, 0),
	   (5, 3, 2, 11, 0),
	   (6, 1, 3, 1, 0),
	   (7, 1, 2, 2, 0),
	   (8, 12, 2, 2, 0);