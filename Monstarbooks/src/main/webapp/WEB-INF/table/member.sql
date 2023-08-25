create table m_member(
    memberno	NUMBER,
	mid VARCHAR2(100)	NOT NULL,
	mpw VARCHAR2(100)	NOT NULL,
	mbirth	DATE,
	mname VARCHAR2(100)	NOT NULL,
	memail VARCHAR2(100)	NOT NULL,
	mtel	 VARCHAR2(100)	NOT NULL,
	mregdate DATE	NOT NULL,
	mprofileimg VARCHAR2(255)	NULL,
	mfavorite VARCHAR2(255)	NULL,
	mauthority VARCHAR2(10) DEFAULT '사용자',
	deleted	char(3) DEFAULT 'no',
    constraint m_member_id_pk primary key(mid)
);

create sequence m_member_seq;

select * from m_member;

commit;
INSERT INTO m_member VALUES(m_member_seq.NEXTVAL,'admin', '1234', '1999-07-04','김리연','liyeon@kakao.com','01000000000',sysdate,null,null,'관리자','no');