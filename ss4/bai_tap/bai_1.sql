use quan_li_sinh_vien;
SELECT * from subject
where credit = (select max(credit) from subject);
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT S.student_id, M.mark_id, max(mark)
FROM student S 
join mark M on S.student_id = M.student_id
GROUP BY M.mark_id
HAVING max(Mark) >= ALL (SELECT max(Mark) FROM mark GROUP BY mark.student_id);
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select s.student_id, s.student_name , avg(mark) as 'đtb'
from student s
join mark m on s.student_id = m.mark_id
group by student_id
order by avg(mark) desc ;


