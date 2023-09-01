commit;

select * from m_member;

create table ex(
    exno number, -- 번호
    extitle varchar2(255), -- 제목
    excontent varchar2(500), --글내용
    exregdate date, -- 등록일
    deleted char(3) default 'no' 
);-- 삭제 되면 no를 yes 로 변경

    CREATE TABLE m_member (
	memberno NUMBER,
	mid	VARCHAR2(100),
	mpw VARCHAR2(100),
	mbirth DATE,
    mname VARCHAR2(100),
    memail VARCHAR2(100),
	mtel VARCHAR2(100),
	mregdate DATE,
    mprofileimg VARCHAR2(255),
    mfavorite VARCHAR2(255),
	mauthority VARCHAR2(10),
	deleted char(3));  
    
    --NO로 지정하는거 확인하기
    
    create SEQUENCE m_member_seq;
    
    insert into m_member values(m_member_seq.nextval,'hyottly','1234','2000-01-01','김효슬','hyot@gmail.com','010-000-0000',sysdate,null,'고전문학','정회원','NO');

    