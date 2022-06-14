CREATE DATABASE chuyen_doi_ERD;
USE chuyen_doi_ERD;
CREATE TABLE phieu_xuat(
so_px int primary key not null,
ngay_xuat date 
);
CREATE TABLE vat_tu(
ma_vat_tu varchar(20) primary key,
ten_vt varchar(50)
);
CREATE TABLE chi_tiet_phieu_xuat(
so_px int,
ma_vat_tu varchar(20),
don_gia_px double,
so_luong_px int,
primary key( so_px , ma_vat_tu),
FOREIGN KEY (so_px) REFERENCES phieu_xuat(so_px),
FOREIGN KEY (ma_vat_tu) REFERENCES vat_tu(ma_vat_tu)
);
CREATE TABLE phieu_nhap(
so_pn int primary key not null,
ngay_nhap date 
);
CREATE TABLE chi_tiet_phieu_nhap(
so_pn int,
ma_vat_tu varchar(20),
don_gia_pn double,
so_luong_pn int,
primary key( so_pn , ma_vat_tu),
FOREIGN KEY (so_pn) REFERENCES phieu_nhap(so_pn),
FOREIGN KEY (ma_vat_tu) REFERENCES vat_tu(ma_vat_tu)
);
CREATE TABLE don_DH(
so_don_dh int primary key not null,
ngay_dh date

);
CREATE TABLE chi_tiet_don_dat_hang(
so_don_dh int,
ma_vat_tu varchar(20),
primary key(ma_vat_tu , so_don_dh ),
FOREIGN KEY (ma_vat_tu) REFERENCES vat_tu(ma_vat_tu),
FOREIGN KEY (so_don_dh) REFERENCES don_DH(so_don_dh)
);
CREATE TABLE nha_cc(
ma_ncc int primary key not null,
ten_ncc varchar(50),
dia_chi varchar(50),
foreign key(ma_ncc) references don_DH(so_don_dh)
);
create table so_dien_thoai(
sdt varchar(10) primary key ,
nguoi_so_huu varchar(100),
ma_ncc int,
foreign key (ma_ncc) references nha_cc(ma_ncc)
);

