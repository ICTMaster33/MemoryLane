insert into tb_member (name, email, password)
values ('기머니', 'a@a.com', '1234');

commit

select * from tb_member
select * from tb_drag

select adddate(hh,-9, note_reg_date) from tb_note

SELECT DATE_ADD('2100-12-31 23:59:59', INTERVAL '1:1' MINUTE_SECOND);

SELECT DATE_ADD(note_reg_date, INTERVAL 0 hour) from tb_note;
select * from tb_note;

select adddate(d, 10, getdate())

select note_content from tb_note
where note_no = 7

insert into tb_drag (drag_content, member_no)
values ('기머니', 7)
insert into tb_drag (drag_content, member_no)
values ('원태영', 7)
insert into tb_drag (drag_content, member_no)
values ('짱', 7)

commit

SELECT dateadd(year,2147483647, '2006-07-31');

출처: http://irisgnu.tistory.com/18 [敬天愛人]