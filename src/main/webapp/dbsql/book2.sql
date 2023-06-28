create table book2(
    no number primary key,
    title varchar2(100),
    price number,
    publisher varchar2(100),
    joindate date  default sysdate,
    fileName    varchar2(50)     null,           --���ε����ϸ�
    fileSize    number            default 0,     --���ϻ����� 
    downCount    number     default 0,           --�ٿ��
    originalFileName    varchar2(100)     null    --������ ���ϸ�	
);


create sequence book2_seq
increment by 1
start with 1
nocache;

select * from book2 order by no desc;
