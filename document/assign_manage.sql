drop database project;
create database project;
use project;

drop table user;
create table user
(
   id varchar(255) primary key comment '아이디',
   pw varchar(255) not null comment '비밀번호',
   user_name varchar(255) not null comment '이름',
   user_class varchar(2) not null comment '등급',
   gender varchar(2) not null comment '성별',
   user_icon varchar(2) comment '프로필아이콘',
   birth timestamp comment '생년월일',
   tel varchar(255) comment '전화번호',
   email varchar(255) not null comment '이메일',
   join_date timestamp default now() comment '가입일',
   modify_date timestamp comment '수정일',
   leave_date timestamp comment '탈퇴일',
   ip varchar(255)
) comment '사용자';

drop table lecture;
create table lecture
(
   lecture_no int primary key auto_increment comment '강의번호',
   id varchar(255) comment '아이디',
   lecture_name varchar(255) not null comment '강의명',
   cap int comment '정원',
   create_date timestamp default now() comment '생성일',
   start_date timestamp comment '시작일',
   end_date timestamp comment '종료일',
   delete_date timestamp comment '삭제일',
   foreign key(id) references user(id)
) comment '강의';

drop table assignment;
create table assignment
(
   assign_no int primary key auto_increment comment '과제번호',
   lecture_no int comment '강의번호',
   assign_name varchar(255) not null comment '과제명',
   assign_note text comment '내용(설명)',
   assign_method varchar(255) comment '제출방식',
   create_date timestamp default now() comment '생성일',
   end_date timestamp comment '종료일',
   delete_date timestamp comment '삭제일',
   foreign key(lecture_no) references lecture(lecture_no)
) comment '과제';

drop table lecture_list;
create table lecture_list
(
   id varchar(255) comment '아이디',
   lecture_no int comment '강의번호',
   create_date timestamp default now() comment '등록일',
   delete_date timestamp comment '삭제일',
   primary key(id, lecture_no),
   foreign key(id) references user(id),
   foreign key(lecture_no) references lecture(lecture_no)
) comment '수강목록';

drop table report;
create table report
(
	report_no int primary key auto_increment comment '과제물번호',
	assign_no int comment '과제번호',
	id varchar(255) comment '아이디',
	report_note text comment '제출내용',
	create_date timestamp default now() comment '생성일',
	delete_date timestamp comment '삭제일',
	foreign key(assign_no) references assignment(assign_no),
    foreign key(id) references user(id)	
) comment '과제물';


drop table file;
create table file
(
	file_no int primary key auto_increment comment '첨부파일번호',
	report_no int comment '과제물번호',
	p_name varchar(255) not null comment '물리파일명',
	f_name varchar(255) not null comment '논리파일명',
	create_date timestamp default now() comment '생성일',
	delete_date timestamp comment '삭제일',
	file_size int comment '파일크기',
	extension varchar(255) comment '확장자',
	file_path varchar(255) comment '저장경로',
	foreign key(report_no) references report(report_no)
) comment '첨부파일';

drop table feedback;
create table feedback
(
	report_no int primary key comment '과제물번호',
	id varchar(255) comment '아이디',
	feedback text comment  '피드백',
	score int comment '점수',
	foreign key (id) references user(id),
	foreign key (report_no) references report(report_no)
) comment '피드백';

drop table question;
create table question
(
	quest_no int primary key auto_increment comment '질문번호',
	assign_no int comment '과제번호',
	id varchar(255)comment '아이디',
	quest_note text comment '질문내용',
	create_date timestamp default now() comment '생성일',
	delete_date timestamp comment '삭제일',
    foreign key (assign_no) references assignment(assign_no),
    foreign key (id) references user(id)
) comment '질문';

drop table answer;
create table answer
(
   quest_no int primary key comment '질문번호',
   id varchar(255) comment '아이디',
   answer_note text comment '답변내용',
   create_date timestamp default now() comment '생성일',
   delete_date timestamp comment '삭제일',
   foreign key(quest_no) references question(quest_no),
   foreign key(id) references user(id)
) comment '답변';

drop table log;
create table log
(
   log_no int primary key auto_increment comment '로그번호',
   id varchar(255) comment '아이디',
   visit_page varchar(255) not null comment '방문페이지',
   visit_time timestamp default now() comment '방문시간',
   leave_time timestamp comment '떠난시간',
   request_value text comment '요청값',
   foreign key(id) references user(id)
) comment '로그';