-- FAQ 테이블(m_faq) 생성 쿼리
create table m_faq(
faqno number primary key,
fquestion varchar2(500) not null,
fanswer CLOB not null,
fcategory varchar2(225) not null,
fregdate date default sysdate not null,
deleted char(3) default 'no'
);

drop table m_faq;

-- FAQ 글 번호에 들어갈 시퀀스(m_faq_seq) 생성 쿼리
create sequence m_faq_seq;



SELECT * FROM M_FAQ ORDER BY FAQNO DESC;
commit;
