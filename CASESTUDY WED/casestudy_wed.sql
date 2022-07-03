use casestudy;
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
facility_id int
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
foreign key (rent_type_id) references rent_type_id(id),
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
`name` varchar(45)
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

);