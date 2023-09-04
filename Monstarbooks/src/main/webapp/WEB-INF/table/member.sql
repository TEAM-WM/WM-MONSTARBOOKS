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
commit;
create sequence m_member_seq;

select * from m_member;
delete from m_member where mid='admin';
commit;
INSERT INTO m_member VALUES(m_member_seq.NEXTVAL,'admin', '1234', '1999-07-04','김리연','liyeon@kakao.com','01000000000',sysdate,null,null,'관리자','no');
INSERT INTO m_member VALUES(m_member_seq.NEXTVAL,'blue', '1234', '1999-07-04','김리연','liyeon@kakao.com','01000000000',sysdate,null,null,'사용자','no');
SELECT mid
FROM M_MEMBER
WHERE mid='admin';

UPDATE m_member set mauthority='관리자' where  mid='admin';

select MEMBERNO,MID,MPW,MBIRTH,MNAME,MEMAIL,MTEL,to_char(MREGDATE, 'yyyy.mm.dd hh24"시"mm"분"')as mregdate,MPROFILEIMG,MFAVORITE,MAUTHORITY
from M_MEMBER
where MAUTHORITY='관리자';
-- oofdapeqbhsd
SELECT MPW
		FROM M_MEMBER WHERE mname='김리연' AND mtel='01000000000' AND mid='admin3';