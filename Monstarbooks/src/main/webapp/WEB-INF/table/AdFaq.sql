-- FAQ ���̺�(m_faq) ���� ����
create table m_faq(
faqno number primary key,
fquestion varchar2(500) not null,
fanswer varchar2(500) not null,
fcategory varchar2(225) not null,
fregdate date default sysdate not null,
deleted char(3) default 'No' check(deleted in ('No','Yes'))
);

-- FAQ �� ��ȣ�� �� ������(m_faq_seq) ���� ����
create sequence m_faq_seq;



SELECT * FROM M_FAQ ORDER BY FAQNO DESC;
commit;
