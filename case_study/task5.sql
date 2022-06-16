 use case_study;
 -- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong,
 -- ngay_ket_thuc, tong_tien (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, 
 -- với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. 
 -- (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
 
 select khach_hang.ma_khach_hang, khach_hang.ho_ten , loai_khach.ten_loai_khach , hop_dong.ma_hop_dong,
 dich_vu.ten_dich_vu, hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc,ifnull((dich_vu.chi_phi_thue + dich_vu_di_kem.gia * hop_dong_chi_tiet.so_luong),0)
 as tong_tien 
 from khach_hang
 left join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
 left join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
 left join dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
 left join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
 left join dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
 group by khach_hang.ma_khach_hang;

-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được
--  khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
select dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich , dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu
from dich_vu
 join loai_dich_vu on loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
where hop_dong.ma_dich_vu not in (select hop_dong.ma_dich_vu
from hop_dong 
where year(hop_dong.ngay_lam_hop_dong) = '2021' and month(hop_dong.ngay_lam_hop_dong) between 1 and 3)
group by ma_dich_vu;

-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
select dich_vu.ma_dich_vu, dich_vu.ten_dich_vu , dich_vu.dien_tich , dich_vu.so_nguoi_toi_da , dich_vu.chi_phi_thue ,loai_dich_vu.ten_loai_dich_vu
from dich_vu
join loai_dich_vu on loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu

where year(hop_dong.ngay_lam_hop_dong) = '2020'
 and
 year(hop_dong.ngay_lam_hop_dong) <> '2021';
 
 -- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
  select khach_hang.ho_ten from khach_hang
  group by ho_ten;
  
  SELECT DISTINCT khach_hang.ho_ten from khach_hang;
  select ho_ten from khach_hang
union select ho_ten from khach_hang;

-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
