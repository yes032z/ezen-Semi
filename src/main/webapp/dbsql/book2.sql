create table book2(
    no number primary key,
    title varchar2(100),
    price number,
    publisher varchar2(100),
    joindate date  default sysdate,
    fileName    varchar2(50)     null,           --업로드파일명
    fileSize    number            default 0,     --파일사이즈 
    downCount    number     default 0,           --다운수
    originalFileName    varchar2(100)     null    --변경전 파일명	
);


create sequence book2_seq
increment by 1
start with 1
nocache;

select * from book2 order by no desc;
