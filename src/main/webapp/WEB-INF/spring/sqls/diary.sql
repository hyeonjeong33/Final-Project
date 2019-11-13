drop table diary;
drop sequence diaryseq;

create sequence diaryseq;

create table diary(
	scheduleno number not null,
	username varchar2(20) not null,
	title varchar2(100) not null,
	start_date date not null,
	end_date date null,
	start_time varchar2(10) not null,
	end_time varchar2(10) not null
)

select * from diary;
