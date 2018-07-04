create table members(
  user_id VARCHAR2(20),
  password VARCHAR2(20),
  user_name VARCHAR2(20),
  cell_phone VARCHAR2(20),
  email VARCHAR2(50),
  address VARCHAR2(200),
  grade NUMBER,
  reg_date DATE,
  update_date DATE,
  PRIMARY KEY(user_id)
);

insert into members values('duohui12','111111','정다혜','010-3656-7418','duohui12@gmail.com','서울시 광진구 구의동 영화사로 11길',1,sysdate,sysdate);
INSERT INTO MEMBERS VALUES('sjjo0319', '1234', 'seojin', '010-3045-0339', 'sjjo0319@naver.com', '서울시 노원구', 1, SYSDATE, SYSDATE);

select * from members;



commit;

