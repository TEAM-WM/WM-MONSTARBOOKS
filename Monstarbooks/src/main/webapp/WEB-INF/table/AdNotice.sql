-- 공지사항(m_notice) 테이블 SQL 쿼리
create table m_notice(
noticeno number primary key,
ntitle varchar2(225) not null,
ncontent varchar2(1000) not null,
nwriter varchar2(100) not null,
nregdate DATE default sysdate not null,
nfilesrc varchar2(100) default 'x',
deleted char(3) default 'No' check(deleted in ('No','Yes')),
memberno number not null
);

-- noticeno의 값으로 들어갈 시퀀스 생성
create sequence m_notice_seq;

-- 공지사항(m_notice) 테이블의 memberno 필드를 사용자(m_member) 테이블의 memberno 필드를 참조하여 외래키로 설정(아직 외래키 설정하지 않음)
alter table m_notice add constraint fk_m_notice_memberno foreign key(memberno) references m_member(memberno);