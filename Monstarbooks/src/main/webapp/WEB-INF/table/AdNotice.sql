-- ��������(m_notice) ���̺� SQL ����
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

-- noticeno�� ������ �� ������ ����
create sequence m_notice_seq;

-- ��������(m_notice) ���̺��� memberno �ʵ带 �����(m_member) ���̺��� memberno �ʵ带 �����Ͽ� �ܷ�Ű�� ����(���� �ܷ�Ű �������� ����)
alter table m_notice add constraint fk_m_notice_memberno foreign key(memberno) references m_member(memberno);