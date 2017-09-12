--멤버 테이블
create table t_member(
	mem_no number(6) not NULL,
	mem_pwd varchar2(20) not NULL,
	name varchar2(50) not NULL,
	email varchar2(200) not NULL,
	APPROVALNUM varchar2(1) default 0 not NULL,
	CONSTRAINT MEM_NO PRIMARY KEY(mem_no),
	CONSTRAINT EMAIL UNIQUE (email)
);

--친구 테이블
create table t_friend(
mem_email varchar2(200) not NULL,
friend_email varchar2(200) not NULL,
mem_auth varchar2(1) default 0 not NULL,
CONSTRAINT MEM_EMAIL FOREIGN KEY(mem_email) REFERENCES t_member(email) on delete cascade,
CONSTRAINT FRIEND_EMAIL FOREIGN KEY(friend_email) REFERENCES t_member(email) on delete cascade
);

--카테고리 테이블
create table t_category(
	category_no number(6) primary key,
	mem_no number(6) not NULL,
	category_name varchar2(50) not NULL,
	CONSTRAINT MEM_NO_C FOREIGN KEY(mem_no) REFERENCES t_member(mem_no) on delete cascade
);

--드래그 테이블
create table t_drag(
	drag_no number(6) primary key,
	mem_no number(6) not NULL,
	drag_content varchar2(1000) not NULL,
	drag_url varchar2(1000),
	drag_url_title varchar2(1000),
	drag_reg_date timestamp default SYSDATE,
	drag_update_date timestamp,
	drag_auth varchar2(1) default 0 not NULL,
	CONSTRAINT MEM_NO_D FOREIGN KEY(mem_no) REFERENCES t_member(mem_no)
);

--드래그 이미지 테이블
create table t_drag_img(
	drag_img_no number(6) primary key,
	drag_no number(6) not NULL,
	drag_img_path varchar2(1000) not NULL,
	CONSTRAINT DRAG_NO_D FOREIGN KEY(drag_no) REFERENCES t_drag(drag_no)
);

--노트 테이블
create table t_note(
	note_no number(6) primary key,
	mem_no number(6) not NULL,
	category_no number(6) not NULL,
	note_content varchar2(1000) not NULL,
	note_title varchar2(300) not NULL,
	note_reg_date timestamp default SYSDATE,
	note_update_date timestamp,
	note_auth varchar2(1) default 0 not NULL,
	CONSTRAINT MEM_NO_N FOREIGN KEY(mem_no) REFERENCES t_member(mem_no) on delete cascade,
	CONSTRAINT CATEGORY_NO FOREIGN KEY(category_no) REFERENCES t_category(category_no) on delete cascade
);

--노트 이미지 테이블
create table t_note_img(
	note_img_no number(6) primary key,
	note_no number(6) not NULL,
	note_img_path varchar2(1000) not NULL,
	note_img_width number(6),
	note_img_height number(6),
	CONSTRAINT NOTE_NO FOREIGN KEY(note_no) REFERENCES t_note(note_no)
);

--쪽지 테이블
	CREATE TABLE T_MEMOS(
	NUM NUMBER NOT NULL,
	FROMEMAIL VARCHAR2(20) REFERENCES T_MEMBER(EMAIL) NOT NULL,
	TOEMAIL VARCHAR2(20) NOT NULL,
	TITLE VARCHAR2(20) NOT NULL,
	CONTENT VARCHAR2(1000) NOT NULL,
	INPUTDATE DATE NOT NULL
);

--시퀀스
create sequence mem_no start with 1 increment by 1;
create sequence category_no start with 1 increment by 1;
create sequence drag_no start with 1 increment by 1;
create sequence drag_img_no start with 1 increment by 1;
create sequence note_no start with 1 increment by 1;
create sequence note_img_no start with 1 increment by 1;
CREATE SEQUENCE SEQ_MEMO start with 1 increment by 1;
