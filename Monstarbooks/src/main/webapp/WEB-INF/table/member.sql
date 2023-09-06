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
	mauthority VARCHAR2(10) DEFAULT 'ªÁøÎ¿⁄',
	deleted	char(3) DEFAULT 'no',
    constraint m_member_id_pk primary key(mid)
);
commit;
create sequence m_member_seq;

select * from m_member;
delete from m_member where mid='admin';
commit;
INSERT INTO m_member VALUES(m_member_seq.NEXTVAL,'admin', '1234', '1999-07-04','Íπ?Î¶¨Ïó∞','liyeon@kakao.com','01000000000',sysdate,null,null,'Í¥?Î¶¨Ïûê','no');
INSERT INTO m_member VALUES(m_member_seq.NEXTVAL,'blue', '1234', '1999-07-04','Íπ?Î¶¨Ïó∞','liyeon@kakao.com','01000000000',sysdate,null,null,'?Ç¨?ö©?ûê','no');
SELECT mid
FROM M_MEMBER
WHERE mid='admin';

UPDATE m_member set mauthority='Í¥?Î¶¨Ïûê' where  mid='admin';

select MEMBERNO,MID,MPW,MBIRTH,MNAME,MEMAIL,MTEL,to_char(MREGDATE, 'yyyy.mm.dd hh24"?ãú"mm"Î∂?"')as mregdate,MPROFILEIMG,MFAVORITE,MAUTHORITY
from M_MEMBER
where MAUTHORITY='∞¸∏Æ¿⁄';