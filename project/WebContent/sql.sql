SELECT * FROM TAB;

DROP TABLE;

CREATE TABLE member(
member_name VARCHAR2(30),
member_id VARCHAR2(30) primary key,
member_password VARCHAR2(30),
member_birthday VARCHAR2(30),
member_postcode VARCHAR2(30),
member_address VARCHAR2(100),
member_tel VARCHAR2(30),
member_phone VARCHAR2(30),
member_email VARCHAR2(100),
member_admin NUMBER DEFAULT 0,
member_regdate DATE
);

-- ALTER TABLE member MODIFY(member_admin NUMBER DEFAULT 0);
-- ALTER TABLE member MODIFY(member_birthday VARCHAR2(30));

SELECT * FROM member;
DELETE member;
DROP TABLE member;


CREATE TABLE customerorderboard(
customerorder_number NUMBER,
customerorder_id VARCHAR2(30),
customerorder_name VARCHAR2(30),
customerorder_subject VARCHAR2(1000),
customerorder_content VARCHAR2(2000),
customerorder_file VARCHAR2(100),
customerorder_re_ref NUMBER,
customerorder_re_lev NUMBER,
customerorder_re_seq NUMBER,
customerorder_readcount NUMBER,
customerorder_regdate DATE
);

DELETE customerorderboard;

SELECT * FROM customerorderboard;

DROP TABLE customerorderboard;

CREATE TABLE product(
pseq NUMBER PRIMARY KEY NOT NULL,
name VARCHAR2(100) DEFAULT 0,
kind CHAR, -- 1��, 2����
price1 NUMBER DEFAULT 0, -- ����
price2 NUMBER DEFAULT 0, -- �ǸŰ�
price3 NUMBER DEFAULT '0', -- �ǸŰ�-����
content VARCHAR2(2000) DEFAULT NULL,
image VARCHAR2(100) DEFAULT 'default.png',
useyn CHAR, -- ��ǰ ��� ���� üũ Y, N
bestyn CHAR, -- ����Ʈ ��ǰ ���� üũ Y, N
indate DATE -- SYSDATE
);

DROP SEQUENCE product_seq;

CREATE SEQUENCE product_seq START WITH 1;

INSERT INTO product(bestyn, useyn, pseq, name, kind, price1, price2, price3, content, image) VALUES(
'y', 'y', product_seq.nextval, '�� ���� (ť�� �����)', '2', '40000', '50000', '10000', '������ �������ϴ� :)', 'product_frame_type1_img1.jpg');


INSERT INTO product(bestyn, pseq, name, kind, price1, price2, price3, content, image) VALUES(
'y', product_seq.nextval, '�� ���� (ť�� �����)', '7', '17100', '17100', '17100', '������ �������ϴ� :)', 'accessory/product_frame_type1_img1.jpg');

INSERT INTO product(bestyn, pseq, name, kind, price1, price2, price3, content, image) VALUES(
'y', product_seq.nextval, '���ƿ��⸦ (���� ������ ��)', '6', '59600', '59600', '59600', '������ ���� ����� �����!', 'bag_shoes/product_frame_type1_img1.jpg');

INSERT INTO product(bestyn, pseq, name, kind, price1, price2, price3, content, image) VALUES(
'y', product_seq.nextval, '������ �ȱ� (���� ��� ��Ŀ)', '6', '53600', '53600', '53600', '���� ����� �����԰� �Ϳ�����~��', 'bag_shoes/product_frame_type1_img2.jpg');

INSERT INTO product(bestyn, pseq, name, kind, price1, price2, price3, content, image) VALUES(
'y', product_seq.nextval, 'ťƮ ��Ʈ (��Ʈ ��� ���ǽ�)', '4', '18100', '18100', '18100', '��������� ��Ʈ ����~��', 'skirt/product_frame_type1_img1.jpg');

INSERT INTO product(bestyn, pseq, name, kind, price1, price2, price3, content, image) VALUES(
'y', product_seq.nextval, '�״뿡�� �� (���� A���� ��ĿƮ)', '4', '22300', '22300', '22300', '����߶� �����ؿ�!', 'skirt/product_frame_type1_img2.jpg');

INSERT INTO product(bestyn, pseq, name, kind, price1, price2, price3, content, image) VALUES(
'y', product_seq.nextval, '�޸� �� �޸� (���� ��ũ��ġ ��)', '3', '37500', '37500', '37500', '���༺ ¯¯! ���� ���ؿ�!', 'bottom/product_frame_type1_img1.jpg');




DELETE product;
SELECT * FROM product;

-- ����Ʈ ��ǰ
CREATE OR REPLACE VIEW best_pro_view AS SELECT pseq, name, price2, image FROM
(SELECT rownum, pseq, name, price2, image FROM product WHERE bestyn = 'y' ORDER BY indate DESC)
WHERE  ROWNUM <= 6;

DROP VIEW best_pro_view;

SELECT * FROM best_pro_view;

-- �Ż�ǰ
CREATE OR replace VIEW new_pro_view AS SELECT pseq, name, price2, image FROM
(SELECT ROWNUM, pseq, name, price2, image FROM product WHERE useyn = 'y' ORDER BY indate DESC)
WHERE ROWNUM <= 12;

create table cart (
  cseq         number    primary key,  -- ��ٱ��Ϲ�ȣ
  id           varchar(30)   references member(member_id),  -- �ֹ��� ���̵�(FK :��member.id) 
  pseq         number     references product(pseq), -- �ֹ� ��ǰ��ȣ(FK :product.pseq) 
  quantity     number     default 1,        -- �ֹ� ����
  result       char       default '1',      -- 1:��ó�� 2:ó��
  indate       date -- �ֹ���
);
drop sequence cart_seq;
create sequence cart_seq start with 1;


create or replace view cart_view
as
select o.cseq, o.id, o.pseq, m.member_name mname, p.name pname, 
o.quantity, o.indate, p.price2, o.result 
from cart o, member m, product p 
where o.id = m.member_id and o.pseq = p.pseq
and result='1';


















INSERT INTO customerorderboard VALUES(1, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 1, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(2, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 2, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(3, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 3, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(4, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 4, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(5, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 5, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(6, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 6, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(7, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 7, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(8, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 8, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(9, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 9, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(10, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 10, 0, 0, 0, SYSDATE);

INSERT INTO customerorderboard VALUES(11, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 11, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(12, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 12, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(13, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 13, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(14, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 14, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(15, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 15, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(16, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 16, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(17, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 17, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(18, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 18, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(19, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 19, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(20, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 20, 0, 0, 0, SYSDATE);

INSERT INTO customerorderboard VALUES(21, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 21, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(22, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 22, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(23, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 23, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(24, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 24, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(25, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 25, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(26, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 26, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(27, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 27, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(28, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 28, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(29, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 29, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(30, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 30, 0, 0, 0, SYSDATE);

INSERT INTO customerorderboard VALUES(31, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 31, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(32, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 32, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(33, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 33, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(34, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 34, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(35, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 35, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(36, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 36, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(37, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 37, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(38, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 38, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(39, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 39, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(40, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 40, 0, 0, 0, SYSDATE);

INSERT INTO customerorderboard VALUES(41, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 41, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(42, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 42, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(43, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 43, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(44, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 44, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(45, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 45, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(46, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 46, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(47, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 47, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(48, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 48, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(49, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 49, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(50, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 50, 0, 0, 0, SYSDATE);

INSERT INTO customerorderboard VALUES(51, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 51, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(52, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 52, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(53, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 53, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(54, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 54, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(55, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 55, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(56, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 56, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(57, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 57, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(58, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 58, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(59, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 59, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(60, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 60, 0, 0, 0, SYSDATE);

INSERT INTO customerorderboard VALUES(61, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 61, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(62, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 62, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(63, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 63, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(64, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 64, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(65, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 65, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(66, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 66, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(67, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 67, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(68, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 68, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(69, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 69, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(70, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 70, 0, 0, 0, SYSDATE);

INSERT INTO customerorderboard VALUES(71, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 71, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(72, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 72, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(73, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 73, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(74, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 74, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(75, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 75, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(76, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 76, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(77, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 77, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(78, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 78, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(79, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 79, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(80, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 80, 0, 0, 0, SYSDATE);

INSERT INTO customerorderboard VALUES(81, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 81, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(82, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 82, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(83, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 83, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(84, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 84, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(85, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 85, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(86, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 86, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(87, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 87, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(88, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 88, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(89, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 89, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(90, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 90, 0, 0, 0, SYSDATE);

INSERT INTO customerorderboard VALUES(91, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 91, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(92, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 92, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(93, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 93, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(94, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 94, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(95, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 95, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(96, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 96, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(97, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 97, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(98, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 98, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(99, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 99, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(100, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 100, 0, 0, 0, SYSDATE);

INSERT INTO customerorderboard VALUES(101, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 101, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(102, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 102, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(103, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 103, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(104, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 104, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(105, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 105, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(106, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 106, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(107, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 107, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(108, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 108, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(109, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 109, 0, 0, 0, SYSDATE);
INSERT INTO customerorderboard VALUES(100, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 100, 0, 0, 0, SYSDATE);
