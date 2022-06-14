select kh.ma_khach_hang, kh.ho_ten, count(kh.ma_khach_hang) as so_lan_dat_phong
from khach_hang kh
join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
where lk.ten_loai_khach = 'Diamond'
group by kh.ma_khach_hang
order by so_lan_dat_phong;