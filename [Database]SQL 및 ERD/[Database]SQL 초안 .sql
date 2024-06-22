-- 데베실 과제
-- 총 5개의 테이블
use sys;
DROP DATABASE IF EXISTS constructDB;
-- 데베 만들기
CREATE DATABASE IF NOT EXISTS constructDB;
USE constructDB;

CREATE TABLE IF NOT EXISTS client1 (
  client_code INT NOT NULL,
  client_name VARCHAR(50) NOT NULL,
  client_phone VARCHAR(20) NOT NULL,
  client_email VARCHAR(20) NULL,
  client_account VARCHAR(20) NOT NULL,
  client_addr VARCHAR(45) NULL,
  PRIMARY KEY (client_code)
);

CREATE TABLE IF NOT EXISTS employee (
  emp_code INT NOT NULL,
  emp_name VARCHAR(45) NOT NULL,
  emp_rank VARCHAR(45) NULL,
  emp_sex VARCHAR(45) NULL,
  emp_age VARCHAR(45) NULL,
  emp_phone VARCHAR(45) NOT NULL UNIQUE,
  emp_account VARCHAR(45) NOT NULL UNIQUE,
  PRIMARY KEY (emp_code)
);

CREATE TABLE IF NOT EXISTS project (
  project_code INT NOT NULL,
  client_code INT NOT NULL,
  project_name VARCHAR(45) NULL,
  project_start DATE NULL,
  project_end DATE NULL,
  project_type VARCHAR(45) NULL,
  project_ground VARCHAR(45) NULL,
  project_emp_code INT, 
  PRIMARY KEY (project_code),
  CONSTRAINT fk_client_code
    FOREIGN KEY (client_code)
    REFERENCES client1 (client_code),
  CONSTRAINT fk_project_emp_code
    FOREIGN KEY (project_emp_code)
    REFERENCES employee (emp_code)
);

CREATE TABLE IF NOT EXISTS design_company (
  d_c_code INT NOT NULL,
  d_c_name VARCHAR(45) NOT NULL,
  d_c_location VARCHAR(45) NULL,
  d_c_phone VARCHAR(20) NOT NULL,
  d_c_account VARCHAR(45) NOT NULL,
  d_c_fax VARCHAR(45) NULL,
  d_c_email VARCHAR(45) NULL,
  d_c_manager VARCHAR(10) NULL,
  PRIMARY KEY (d_c_code)
);

CREATE TABLE IF NOT EXISTS design (
  design_code INT NOT NULL,
  design_day DATE NULL,
  design_cost bigint NOT NULL,
  design_detail VARCHAR(45) NOT NULL,
  project_code_design INT NOT NULL,
  d_c_code INT NOT NULL,
  PRIMARY KEY (design_code),
  CONSTRAINT fk_project_code_design
    FOREIGN KEY (project_code_design)
    REFERENCES project (project_code),
  CONSTRAINT fk_d_c_code
    FOREIGN KEY (d_c_code)
    REFERENCES design_company (d_c_code)
);




INSERT INTO client1 (client_code, client_name, client_phone, client_email, client_account, client_addr)
 VALUES 
(1,'고객A','010-1111-1112','kim@naver.com','01-01','001 Main St'),
(2,'박수호','010-1111-1113','park@naver.com','01-02','002 main St'),
(3,'최지연','010-1111-1114','choi11@naver.com','01-03','003 Main St'),
(4,'송지호','010-1111-1115','soso@naver.com','01-04','004 Main St'),
(5,'김지호','010-1111-1116','kimkim3@naver.com','01-05','005 Main St'),
(6,'박수홍','010-1111-1117','parkk@naver.com','01-06','006 Main St'),
(7,'유재석','010-1111-1118','youyou@naver.com','01-07','007 Main St'),
(8,'이광수','010-1111-1119','leelee@naver.com','01-08',NULL),
(9,'하동훈','010-1111-1120','hahah@naver.com','01-09','009 Main St'),
(10,'송지효','010-1111-1121','shsh@naver.com','01-10','0010 Main St'),
(11,'강민석','010-1111-1122','kangg@naver.com','01-11','0011 Main St'),
(12,'전정국','010-1111-1123','imim@naver.com','01-12',NULL),
(13,'김남준','010-1111-1124','kimnam@naver.com','01-13',NULL),
(14,'민윤기','010-1111-1125','minyou@naver.com','01-14',NULL),
(15,'박지민','010-1111-1126','parkji@naver.com','01-15','0015 Main St'),
(16,'김태형','010-1111-1127','kimkimta@naver.com','01-16','0016 Main St'),
(17,'방시혁','010-1111-1128','bbang@naver.com','01-17','0017 Main St'),
(18,'김강인','010-1111-1129','gain@naver.com','01-18','0018 Main St'),
(19,'이강인','010-1111-1130','leega@naver.com','01-19','0019 Main St'),
(20,'강호동','010-1111-1131','kangho@naver.com','01-20','0020 Main St'),
(21,'이수근','010-1111-1132','leesusu@naver.com','01-21',NULL),
(22,'은지원','010-1111-1133','euneunji@naver.com','01-22','0021 Main St'),
(23,'이승기','010-1111-1134','leegi@naver.com','01-23','0022 Main St'),
(24,'송민호','010-1111-1135','mino@naver.com','01-24','0023 Main St'),
(25,'김지호','010-1111-1136','jihoho@naver.com','01-25','0024 Main St'),
(26,'송중기','010-1111-1137','jungg@naver.com','01-26','0025 Main St'),
(27,'한예슬','010-1111-1138','hanhan@naver.com','01-27','0026 Main St'),
(28,'유이','010-1111-1139','u2u22@naver.com','01-28','0027 Main St'),
(29,'진진희','010-1111-1140','jinjins@naver.com','01-29','0028 Main St'),
(30,'강승범','010-1111-1141','kang22@naver.com','01-30','0029 Main St ');


INSERT INTO employee (emp_code, emp_name, emp_rank, emp_sex, emp_age, emp_phone, emp_account) 
VALUES
(121, '이진혁', 'Assistant', 'Male', 28, '010-0303-0302', '78-45345'),
(122, '박영희', 'Engineer', 'Female', 27, '010-0404-0403', '89-56456'),
(123, '장영진', 'Technician', 'Male', 29, '010-0505-0504', '90-67567'),
(124, '정수진', 'Manager', 'Female', 32, '010-0606-0605', '01-12345'),
(125, '홍길동', 'Engineer', 'Male', 31, '010-0707-0706', '02-23456'),
(126, '김영수', 'Assistant', 'Male', 29, '010-0808-0807', '03-34567'),
(127, '이미영', 'Technician', 'Female', 27, '010-0909-0908', '04-45678'),
(128, '최재원', 'Manager', 'Male', 33, '010-1010-1010', '05-56789'),
(129, '송지우', 'Assistant', 'Female', 26, '010-1111-1111', '06-67890'),
(130, '박영호', 'Engineer', 'Male', 30, '010-1212-1212', '07-78901'),
(131, '김현우', 'Technician', 'Male', 28, '010-1313-1313', '08-89012'),
(132, '한미진', 'Manager', 'Female', 32, '010-1414-1414', '09-90123'),
(133, '정성우', 'Assistant', 'Male', 29, '010-1515-1515', '10-01234'),
(134, '박지원', 'Engineer', 'Female', 27, '010-1616-1616', '11-12345'),
(135, '황성민', 'Technician', 'Male', 31, '010-1717-1717', '12-23456'),
(136, '김주연', 'Manager', 'Female', 30, '010-1818-1818', '13-34567'),
(137, '이현우', 'Assistant', 'Male', 28, '010-1919-1919', '14-45678'),
(138, '박성훈', 'Engineer', 'Male', 29, '010-2020-2020', '15-56789'),
(139, '김정민', 'Technician', 'Male', 27, '010-2121-2121', '16-67890'),
(140, '이다은', 'Manager', 'Female', 32, '010-2222-2222', '17-78901'),
(141, '박지민', 'Assistant', 'Female', 26, '010-2323-2323', '18-89012'),
(142, '이수진', 'Engineer', 'Female', 30, '010-2424-2424', '19-90123'),
(143, '김태우', 'Technician', 'Male', 29, '010-2525-2525', '20-01234'),
(144, '최민우', 'Manager', 'Male', 33, '010-2626-2626', '21-12345'),
(145, '박서진', 'Assistant', 'Female', 26, '010-2727-2727', '22-23456'),
(146, '김민서', 'Engineer', 'Female', 31, '010-2828-2828', '23-34567'),
(147, '이준호', 'Technician', 'Male', 28, '010-2929-2929', '24-45678'),
(148, '한지영', 'Manager', 'Female', 32, '010-3030-3030', '25-56789'),
(149, '황우진', 'Assistant', 'Male', 29, '010-3131-3131', '26-67890'),
(150, '장민서', 'Engineer', 'Female', 27, '010-3232-3232', '27-78901'),
(151, '김지연', 'Manager', 'Female', 30, '010-0202-0201', '67-34234'),
(200, '박지연', 'Engineer', 'Female', 27, '010-4322-3132', '27-78951'),
(201, '송민주', 'Engineer', 'Female', 27, '010-8342-3232', '27-78201'),
(202, '주지용', 'Engineer', 'male', 27, '010-3483-3232', '27-78981'),
(203, '권지용', 'Engineer', 'male', 31, '010-3342-3232', '27-78931'),
(204, '최승현', 'Engineer', 'male', 34, '010-3212-3232', '27-78701');

INSERT INTO project (project_code, client_code, project_name, project_start, project_end, project_type, project_ground, project_emp_code) 
VALUES 
(31, 2, 'Project G', '1999-07-01', '2003-12-31', 'Type G', 'Ground G',121),
(32, 3, 'Project H', '1999-08-01', '2003-01-31', 'Type H', 'Ground H',122),
(33, 4, 'Project I', '1999-09-01', '2003-02-28', 'Type I', 'Ground I',123),
(34, 5, 'Project J', '1999-10-01', '2003-03-31', 'Type J', 'Ground J',124),
(35, 6, 'Project K', '1999-11-01', '2003-04-30', 'Type K', 'Ground K',125),
(36, 7, 'Project L', '1999-12-01', '2003-05-31', 'Type L', 'Ground L',126),
(37, 8, 'Project M', '2024-01-01', '2024-06-30', 'Type M', 'Ground M',127),
(38, 9, 'Project N', '2024-02-01', '2024-07-31', 'Type N', 'Ground N',128),
(39, 10, 'Project O', '2024-03-01', '2024-08-31', 'Type O', 'Ground O',129),
(40, 11, 'Project P', '2024-04-01', '2024-09-30', 'Type P', 'Ground P',130),
(41, 12, 'Project Q', '2024-05-01', '2024-10-31', 'Type Q', 'Ground Q',131),
(42, 13, 'Project R', '2024-06-01', '2024-11-30', 'Type R', 'Ground R',132),
(43, 14, 'Project S', '2024-07-01', '2024-12-31', 'Type S', 'Ground S',133),
(44, 15, 'Project T', '2024-08-01', '2025-01-31', 'Type T', 'Ground T',134),
(45, 16, 'Project U', '2024-09-01', '2025-02-28', 'Type U', 'Ground U',135),
(46, 17, 'Project V', '2024-10-01', '2025-03-31', 'Type V', 'Ground V',136),
(47, 18, 'Project W', '2024-11-01', '2025-04-30', 'Type W', 'Ground W',137),
(48, 19, 'Project X', '2024-12-01', '2025-05-31', 'Type X', 'Ground X',138),
(49, 20, 'Project Y', '2025-01-01', '2025-06-30', 'Type Y', 'Ground Y',139),
(50, 21, 'Project Z', '2025-02-01', '2025-07-31', 'Type Z', 'Ground Z',140),
(51, 22, 'Project AA', '2025-03-01', '2025-08-31', 'Type AA', 'Ground AA',141),
(52, 23, 'Project BB', '2025-04-01', '2025-09-30', 'Type BB', 'Ground BB',142),
(53, 24, 'Project CC', '2025-05-01', '2025-10-31', 'Type CC', 'Ground CC',143),
(54, 25, 'Project DD', '2025-06-01', '2025-11-30', 'Type DD', 'Ground DD',144),
(55, 26, 'Project CC', '2025-05-01', '2025-09-30', 'Type CC', 'Ground CC',145),
(56, 27, 'Project CC', '2025-05-01', '2025-10-31', 'Type CC', 'Ground CC',146),
(57, 28, 'Project CC', '2025-05-01', '2025-5-31', 'Type CC', 'Ground CC',147),
(58, 29, 'Project CC', '2025-05-01', '2025-7-31', 'Type CC', 'Ground CC',148),
(59, 30, 'Project CC', '2023-05-01', '2025-02-02', 'Type CC', 'Ground CC',149),
(60, 1, 'Project CC', '2025-05-01', '2025-07-31', 'Type CC', 'Ground CC',150);


INSERT INTO design_company (d_c_code,d_c_name, d_c_location, d_c_phone, d_c_account, d_c_fax, d_c_email, d_c_manager)
VALUES
  (61,'Company A', 'Location A', '010-1111-1411', 'Account A', 'Fax A', 'emailA@example.com', 'Manager A'),
  (62,'Company GH', 'Location T', '010-1113-1111', 'Account B', 'Fax B', 'emailB@example.com', 'Manager B'),
  (63,'Company DG', 'Location Yu', '010-1161-1111', 'Account C', 'Fax C', 'emailC@example.com', 'Manager C'),
  (64,'Company D', 'Location D', '010-4244-4444', 'Account D', 'Fax D', 'emailD@example.com', 'Manager D'),
  (65,'Company E', 'Location E', '010-5545-5555', 'Account E', 'Fax E', 'emailE@example.com', 'Manager E'),
  (66,'Company F', 'Location F', '010-6686-6666', 'Account F', 'Fax F', 'emailF@example.com', 'Manager F'),
  (67,'Company G', 'Location G', '010-7747-7777', 'Account G', 'Fax G', 'emailG@example.com', 'Manager G'),
  (68,'Company H', 'Location H', '010-8818-8888', 'Account H', 'Fax H', 'emailH@example.com', 'Manager H'),
  (69,'Company I', 'Location I', '010-9989-9999', 'Account I', 'Fax I', 'emailI@example.com', 'Manager I'),
  (70,'Company J', 'Location J', '010-1010-1010', 'Account J', 'Fax J', 'emailJ@example.com', 'Manager J'),
  (71,'Company K', 'Location K', '010-1111-1111', 'Account K', 'Fax K', 'emailK@example.com', 'Manager K'),
  (72,'Company L', 'Location L', '010-1212-1212', 'Account L', 'Fax L', 'emailL@example.com', 'Manager L'),
  (73,'Company M', 'Location M', '010-1313-1313', 'Account M', 'Fax M', 'emailM@example.com', 'Manager M'),
  (74,'Company N', 'Location N', '010-1414-1414', 'Account N', 'Fax N', 'emailN@example.com', 'Manager N'),
  (75,'Company O', 'Location O', '010-1515-1515', 'Account O', 'Fax O', 'emailO@example.com', 'Manager O'),
  (76,'Company P', 'Location P', '010-1616-1616', 'Account P', 'Fax P', 'emailP@example.com', 'Manager P'),
  (77,'Company Q', 'Location Q', '010-1717-1717', 'Account Q', 'Fax Q', 'emailQ@example.com', 'Manager Q'),
  (78,'Company R', 'Location R', '010-1818-1818', 'Account R', 'Fax R', 'emailR@example.com', 'Manager R'),
  (79,'Company S', 'Location S', '010-1919-1919', 'Account S', 'Fax S', 'emailS@example.com', 'Manager S'),
  (80,'Company T', 'Location T', '010-2020-2020', 'Account T', 'Fax T', 'emailT@example.com', 'Manager T'),
  (81,'Company U', 'Location U', '010-2121-2121', 'Account U', 'Fax U', 'emailU@example.com', 'Manager U'),
  (82,'Company V', 'Location V', '010-2222-2222', 'Account V', 'Fax V', 'emailV@example.com', 'Manager V'),
  (83,'Company W', 'Location W', '010-2323-2323', 'Account W', 'Fax W', 'emailW@example.com', 'Manager W'),
  (84,'Company X', 'Location X', '010-2424-2424', 'Account X', 'Fax X', 'emailX@example.com', 'Manager X'),
  (85,'Company Y', 'Location Y', '010-2525-2525', 'Account Y', 'Fax Y', 'emailY@example.com', 'Manager Y'),
  (86,'Company Z', 'Location Z', '010-2626-2626', 'Account Z', 'Fax Z', 'emailZ@example.com', 'Manager Z'),
  (87,'Company B', 'Location AA', '010-2727-2727', 'Account AA', 'Fax AA', 'emailAA@example.com', 'Manager'),
  (88, 'Company YR', 'Location HF', '010-8554-4832', '52-484', 'Fax A', 'companyA@email.com', 'comA_emp X'),
  (89, 'Company HG', 'Location BH', '010-3844-3822', '63-432', 'Fax B', 'companyB@email.com', 'comB_emp Y'),
  (90, 'Company AS', 'Location CY', '0101913-2230', 'Acc333', '62-583', 'companyC@email.com', 'comC_emp Z');

INSERT INTO design (design_code,design_day, design_cost, design_detail,project_code_design, d_c_code) VALUES
(91,'1999-01-15', 30000000, '3 floor',31,61),
(92,'1999-02-20', 28000000, '4 floor',32,61),
(93,'1999-03-25', 32000000, '5 floor',33,61),
(94,'1999-04-30', 0, '6 floor',34,64),
(95,'1999-05-05', 33000000, '7 floor',35,65),
(96,'1999-06-10', 31000000, '8 floor',36,66),
(97,'1999-07-15', 34000000, '9 floor',37,67),
(98,'1999-08-20', 29000000, '10 floor',38,68),
(99,'2023-09-25', 36000000, '11 floor',39,69),
(100,'2023-10-30', 0, '12 floor',40,70),
(101,'2023-11-05', 37000000, '13 floor',41,71),
(102,'2023-12-10', 40000000, '7 floor',42,72),
(103,'2024-01-15', 41000000, '15 floor',43,73),
(104,'2024-02-20', 42000000, '16 floor',44,74),
(105,'2024-03-25', 43000000, '17 floor',45,75),
(106,'2024-04-30', 44000000, '10 floor',46,76),
(107,'2024-05-05', 45000000, '19 floor',47,77),
(108,'1999-06-10', 46000000, '20 floor',48,78),
(109,'2024-07-15', 0, '1 floor',49,79),
(110,'2024-08-20', 48000000, '22 floor',50,80),
(111,'2024-09-25', 49000000, '23 floor',51,81),
(112,'2024-10-30', 50000000, '5 floor',52,82),
(113,'2024-11-05', 51000000, '25 floor',53,83),
(114,'2024-12-10', 52000000, '3 floor',54,84),
(115,'2025-01-15', 53000000, '27 floor',55,85),
(116,'2025-02-20', 54000000, '7 floor',56,86),
(117,'2025-03-25', 55000000, '29 floor',57,87),
(118,'2025-04-30', 56000000, '10 floor',58,61),
(119,'2025-05-05', 0, '31 floor',59,87),
(120,'2025-06-10', 58000000, '1 floor',60,87);











