use sys;
DROP DATABASE IF EXISTS modelDB;
-- 데베 만들기
CREATE DATABASE IF NOT EXISTS modelDB;

USE modelDB;

CREATE TABLE IF NOT EXISTS modelDB.client (
  client_name VARCHAR(50) NOT NULL,
  client_phone VARCHAR(20) NOT NULL unique,
  client_email VARCHAR(20) NULL,
  client_account VARCHAR(20) NOT NULL unique,
  client_addr VARCHAR(45) NULL,
  client_code INT NOT NULL,
  PRIMARY KEY (client_code)
);

CREATE TABLE IF NOT EXISTS project (
  project_code bigint NOT NULL,
  client_code INT(20) NOT NULL,
  project_name VARCHAR(45) NULL UNIQUE,
  project_start DATE NULL UNIQUE,
  project_end DATE NULL UNIQUE,
  project_type VARCHAR(45) NULL,
  project_ground VARCHAR(45) NULL,
  project_emp VARCHAR(20) NULL,
  PRIMARY KEY (project_code),
  CONSTRAINT fk_client_code
    FOREIGN KEY (client_code)
    REFERENCES client (client_code)
);

CREATE TABLE IF NOT EXISTS quotation(
  quotation_code bigINT NOT NULL,
  quotation_budget VARCHAR(45) NOT NULL,
  quotation_period varchar(45) NULL,
  quotation_size VARCHAR(45) NULL,
  quotation_paydate DATE NOT NULL,
  quotation_method VARCHAR(45) NULL,
  quotation_write_date DATE NOT NULL,
  project_code_quo bigINT NOT NULL,
  PRIMARY KEY (quotation_code),
  CONSTRAINT fk_project_code_quo
    FOREIGN KEY (project_code_quo)
    REFERENCES modelDB.project (project_code)
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

CREATE TABLE IF NOT EXISTS design_company (
  d_c_code INT NOT NULL,
  d_c_name VARCHAR(45) NOT NULL,
  d_c_location VARCHAR(45) NULL,
  d_c_phone VARCHAR(20) NOT NULL UNIQUE,
  d_c_account VARCHAR(45) NOT NULL UNIQUE,
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
  project_code_design bigINT NOT NULL,
  d_c_code INT NOT NULL,
  PRIMARY KEY (design_code),
  CONSTRAINT fk_project_code_design
    FOREIGN KEY (project_code_design)
    REFERENCES project (project_code),
  CONSTRAINT fk_d_c_code
    FOREIGN KEY (d_c_code)
    REFERENCES design_company (d_c_code)
);

CREATE TABLE IF NOT EXISTS employee_project (
  emp_code INT NOT NULL,
  project_code_emp bigint NOT NULL,
  working_hours INT NOT NULL,
  project_input_date DATE NOT NULL,
  employee_project_content VARCHAR(45) NULL,
  PRIMARY KEY (emp_code, project_code_emp),
  CONSTRAINT fk_employee_project_project
    FOREIGN KEY (project_code_emp)
    REFERENCES modelDB.project (project_code),
  CONSTRAINT fk_employee_project_employee1
    FOREIGN KEY (emp_code)
    REFERENCES modelDB.employee (emp_code)
);

CREATE TABLE IF NOT EXISTS material_company (
  m_c_code INT NOT NULL,
  m_c_name VARCHAR(45) NOT NULL,
  m_c_location VARCHAR(45) NULL,
  m_c_phone VARCHAR(45) NOT NULL UNIQUE,
  m_c_account VARCHAR(45) NOT NULL UNIQUE,
  m_c_fax VARCHAR(45) NULL,
  m_c_email VARCHAR(45) NULL,
  m_c_manager VARCHAR(45) NULL,
  PRIMARY KEY (m_c_code)
);

CREATE TABLE IF NOT EXISTS modelDB.order (
  order_code bigINT NOT NULL,
  project_code_order bigINT NOT NULL,
  m_c_code INT NOT NULL,
  emp_code INT NOT NULL,
  order_date DATE NOT NULL,
  order_cost_method VARCHAR(45) NOT NULL,
  order_pay_terms VARCHAR(45) NULL,
  order_delivery_terms VARCHAR(45) NULL,
  PRIMARY KEY (order_code),
  CONSTRAINT fk_order_project1
    FOREIGN KEY (project_code_order)
    REFERENCES modelDB.project (project_code),
  CONSTRAINT fk_order_material_company1
    FOREIGN KEY (m_c_code)
    REFERENCES material_company (m_c_code),
  CONSTRAINT fk_order_employee1
    FOREIGN KEY (emp_code)
    REFERENCES modelDB.employee (emp_code)
);

CREATE TABLE IF NOT EXISTS material (
  material_code INT NOT NULL,
  material_name VARCHAR(45) NOT NULL,
  material_quantity VARCHAR(45) NULL,
  material_type VARCHAR(45) NULL,
  material_unit_price INT NULL,
  material_standard VARCHAR(45) NULL,
  PRIMARY KEY (material_code)
);

CREATE TABLE IF NOT EXISTS order_detail (
  order_quantity VARCHAR(20) NOT NULL,
  order_cost bigINT NOT NULL,
  order_delivery_date DATE NULL,
  order_code bigINT NOT NULL,
  material_code INT NOT NULL,
  PRIMARY KEY (order_code, material_code),
  CONSTRAINT fk_order_detail_order1
    FOREIGN KEY (order_code)
    REFERENCES modelDB.order (order_code),
  CONSTRAINT fk_order_detail_material1
    FOREIGN KEY (material_code)
    REFERENCES material (material_code)
);

CREATE TABLE IF NOT EXISTS cooperation_company (
  c_c_code INT NOT NULL,
  c_c_name VARCHAR(45) NOT NULL,
  c_c_locaion VARCHAR(45) NULL,
  c_c_phone VARCHAR(45) NOT NULL UNIQUE,
  c_c_account VARCHAR(45) NOT NULL UNIQUE,
  c_c_fax VARCHAR(45) NULL,
  c_c_email VARCHAR(45) NULL,
  c_c_manager VARCHAR(45) NULL,
  c_c_business_status VARCHAR(45) NULL,
  PRIMARY KEY (c_c_code)
);

CREATE TABLE IF NOT EXISTS subconstruction_detail (
  s_code INT NOT NULL,
  s_type VARCHAR(45) NULL,
  s_personnel VARCHAR(45) NULL,
  s_contract_date DATE NOT NULL,
  s_date DATE NOT NULL,
  s_cost VARCHAR(45) NOT NULL,
  c_c_code INT NOT NULL,
  PRIMARY KEY (s_code, c_c_code),
  CONSTRAINT fk_subconstruction_detail_cooperation_company1
    FOREIGN KEY (c_c_code)
    REFERENCES modelDB.cooperation_company (c_c_code)
);

CREATE TABLE IF NOT EXISTS construction_progress (
  construction_code INT NOT NULL,
  project_code_progress bigINT NOT NULL,
  s_code INT NOT NULL,
  c_c_code INT NOT NULL,
  construction_emp_code INT NULL,
  construction_progress_name VARCHAR(45) NOT NULL,
  construction_location VARCHAR(45) NOT NULL,
  construction_strart_date DATE NOT NULL,
  construction_end_date DATE NULL,
  PRIMARY KEY (construction_code),
  CONSTRAINT fk_construction_progress_project1
    FOREIGN KEY (project_code_progress)
    REFERENCES modelDB.project (project_code),
  CONSTRAINT fk_construction_progress_employee1
    FOREIGN KEY (construction_emp_code)
    REFERENCES modelDB.employee (emp_code),
  CONSTRAINT fk_construction_progress_subconstruction
    FOREIGN KEY (s_code)
    REFERENCES subconstruction_detail (s_code),
  CONSTRAINT fk_construction_progress_cooperation
    FOREIGN KEY (c_c_code)
    REFERENCES cooperation_company(c_c_code)
);

CREATE TABLE IF NOT EXISTS input_detail (
  input_quantity INT NULL,
  input_code INT NOT NULL,
  input_date DATE NULL,
  material_code INT NOT NULL,
  constrction_code INT NOT NULL,
  PRIMARY KEY (input_code),
  CONSTRAINT fk_input_detail_material1
    FOREIGN KEY (material_code)
    REFERENCES modelDB.material (material_code),
  CONSTRAINT fk_input_detail_construction_progress1
    FOREIGN KEY (constrction_code)
    REFERENCES construction_progress (construction_code)
);

INSERT INTO modelDB.client (client_name, client_phone, client_email, client_account, client_addr, client_code)
VALUES
    ('김백호', '010-4745-0330', 'bh77892@naver.com', '140012661896', '용인시', 1167),
    ('김수현', '010-6543-5543', 'sh9934@gmail.com', '21810104489469', '수원시', 1267),
    ('강지호', '010-3593-4493', 'mmg4893@gmail.com', '28293844382394','용인시', 1367),
    ('김백호', '010-5534-2234', 'bh77892@naver.com', '483924832284933', '안성시', 1467),
    ('지현민', '010-5849-3345', 'hmking33@naver.com', '987875565765656', NULL, 1567);
    
INSERT INTO project (project_code, client_code, project_name, project_start, project_end, project_type, project_ground, project_emp)
VALUES
    (20221129034, 1167, '대성빌딩 신축공사', '2022-11-19', '2023-12-29', '빌라', '주거용', 'Emp1'),
    (20221130001, 1267, '한화아파트 보수공사', '2022-11-30', '2023-12-30', '아파트', '주거용', 'Emp2'),
    (20221129002, 1367, '근린공원시설', '2022-11-29', '2025-11-29', '공원', '상업용', 'Emp3'),
    (20231130001, 1467, '근린공원 보수공사', '2023-11-30', '2025-11-30', '공원', '상업용', 'Emp4'),
    (20221201001, 1567, '주택단지 아파트1동', '2022-12-01', '2024-03-10', '아파트', '주거용', 'Emp5');
    
INSERT INTO quotation (quotation_code, quotation_budget, quotation_period, quotation_size, quotation_paydate, quotation_method, quotation_write_date, project_code_quo)
VALUES
    (0501, '3억', '1년', 'SizeA', '2023-06-30', '카드', '2023-05-15', 20221129034),
    (0502, '2억2천', '2년', 'SizeB', '2023-08-20', '카드', '2023-07-01', 20221130001),
    (0503, '5억', '1년', 'SizeA', '2023-10-15', '카드', '2023-09-01', 20221129002),
    (0504, '4천', '1년', 'SizeB', '2024-01-05', '카드', '2023-11-20', 20231130001),
    (0506, '7천', '1년', 'SizeA', '2024-03-10', '카드', '2024-01-30', 20221201001);

INSERT INTO employee (emp_code, emp_name, emp_rank, emp_sex, emp_age, emp_phone, emp_account)
VALUES
    (119, '김예림', 'Manager', 'Female', '30', '01067483934', '001'),
    (118, '이동현', 'Designer', 'Female', '28', '01058498884', '002'),
    (117, '윤지현', 'staff', 'Female', '29', '01044738823', '003'),
    (116, '최지연', 'staff', 'Female', '46', '01099554834', '004'),
    (115, '김지호', 'staff', 'male', '19', '01033829455', '005');
    

-- Design Company 테이블에 값 삽입
INSERT INTO design_company (d_c_code, d_c_name, d_c_location, d_c_phone, d_c_account, d_c_fax, d_c_email, d_c_manager)
VALUES
    (511, 'ABC Design', '서울시', '010-5438-9843', '3837483', NULL,'abc@naver.com', '백정현'),
    (512, 'XYZ Design', '대구광역시', '010-8305-3538', '38474839',NULL, 'xyz@naver.com', '고윤정'),
    (513, 'YURI Design', '서울시', '010-5843-2933', '57839283','031-432-5323', 'YURI@naver.com', '강휘형'),
    (514, 'RERE Design', '수원시', '010-9473-2234', '3837493','031-324-1245', 'RERE@naver.com', '천종혁');
    
    
    -- 다른 Design Company 데이터 추가...

-- Design 테이블에 값 삽입
INSERT INTO design (design_code, design_day, design_cost, design_detail, project_code_design, d_c_code)
VALUES
    (712, '2023-01-15', 1500000, 'detail1', 20221129034, 511),
    (713, '2023-02-20', 2500000, 'Detail2', 20221130001, 512),
    (714, '2023-02-20', 3500000, 'Detail3', 20221129002, 513),
    (715, '2023-02-20', 1900000, 'Detail4', 20231130001, 514);
    -- 다른 Design 데이터 추가...

-- Employee Project 테이블에 값 삽입
INSERT INTO employee_project (emp_code, project_code_emp, working_hours, project_input_date, employee_project_content)
VALUES
    (119, 20221129034, 8, '2023-01-20', 'ContentA'),
    (118, 20221130001, 6, '2023-02-25', 'ContentB'),
    (117, 20221129002, 5, '2022-12-25', 'ContentC'),
    (116, 20231130001, 3, '2022-03-25', 'ContentD'),
    (115, 20221201001, 5, '2022-09-25', 'ContentE');
    
    -- 다른 Employee Project 데이터 추가...

-- Material Company 테이블에 값 삽입
INSERT INTO material_company (m_c_code, m_c_name, m_c_location, m_c_phone, m_c_account, m_c_fax, m_c_email, m_c_manager)
VALUES
    (813, '에이치에스', '대전광역시', '010-4553-3321', 'account001', 'FaxC', 'HS@naver.com', '김지용'),
    (814, '엔에스폴딩', '서울시', '010-4944-3022', 'account002', 'FaxD', 'NS@naver.com', '오지섭'),
    (815, '하나글라스', '용인시', '010-5324-3944', 'account003', 'FaxD', '11HANA@naver.com', '오수현'),
    (816, '스탠다드인터넷', '안성시', '010-3494-3332', 'account004', 'FaxD', 'STANDARD@email.com', '고지유'),
    (817, '유에스씨합성', '의왕시', '010-3432-4321', 'account005', 'FaxD', 'USCI@email.com', '박수현');
    
    -- 다른 Material Company 데이터 추가...

-- Order 테이블에 값 삽입
INSERT INTO modelDB.order (order_code, project_code_order, m_c_code, emp_code, order_date, order_cost_method, order_pay_terms, order_delivery_terms)
VALUES
    (2311300003, 20221129034, 813, 119, '2023-11-30', '카드', 'PayTermsA', 'DeliveryTermsA'),
    (2311300002, 20221130001, 814, 115, '2023-11-30', '카드', 'PayTermsB', 'DeliveryTermsB'),
    (2311300001, 20221129002, 814, 115, '2023-11-30', '카드', 'PayTermsC', 'DeliveryTermsC'),
    (2311290002, 20231130001, 813, 116, '2023-11-29', '카드', 'PayTermsD', 'DeliveryTermsD'),
    (2311290001, 20221201001, 814, 117, '2023-11-29', '카드', 'PayTermsE', 'DeliveryTermsE');
    -- 다른 Order 데이터 추가...

-- Material 테이블에 값 삽입
INSERT INTO material (material_code, material_name, material_quantity, material_type, material_unit_price, material_standard)
VALUES
    (1030, '모티스락', 1, '잠금장치', 220000, 'StandardA'),
    (1038, '폴딩도어 블랙', 8, '문', 39000, 'StandardB'),
    (1024, '준불연단열재', 1024, '자재', 32100, 'StandardC'),
    (1017, '복층유리', 17, '유리', 1200000, 'StandardD'),
    (1008, '세면용 수전', 8, '수전', 39000, 'StandardE'),
    (1019, '난연목재', 19, '목재', 32100, 'StandardF');
    
		
    
    -- 다른 Material 데이터 추가...

-- Order Detail 테이블에 값 삽입
INSERT INTO order_detail (order_quantity, order_cost, order_delivery_date, order_code, material_code)
VALUES
    (16, 220000, '2023-03-20', 2311300003, 1030),
    (6, 525000, '2023-04-25', 2311300002, 1038),
    (17, 1200000, '2023-04-25', 2311300001, 1024),
    (8, 39000, '2023-04-25', 2311290002, 1008),
    (19, 32100, '2023-04-25', 2311290001, 1019);
    
    -- 다른 Order Detail 데이터 추가...

-- Cooperation Company 테이블에 값 삽입
INSERT INTO cooperation_company (c_c_code, c_c_name, c_c_locaion, c_c_phone, c_c_account, c_c_fax, c_c_email, c_c_manager, c_c_business_status)
VALUES
    (1659784, '비에이치컴퍼니', '경기도 광주시 중앙로', '010-4745-0330', '6120580440101', 'FaxA', 'BHBH2@email.com', '김정태', '특정소방'),
    (1657836, '에스에이치컴퍼니', '서울특별시 송파구', '010-2730-6759', '178294893002', 'FaxB', 'SHH65@email.com', '오지은', '소방공사업체'),
    (1653472, '태송종합', '경기도 광주시 초월읍', '010-9388-9065', '3342839203044', 'FaxC', 'TAE5566@email.com', '박승준', '제조,건설업'),
    (1653942, '엔에스폴딩', '경기도 광주시 초월읍', '010-3667-5733', '9930439203492', 'FaxD', 'NSFOLD3@email.com', '정예원', '폴딩도어'),
    (1652442, '중앙안정유리', '충청북도 음성군 대성리', '010-5210-9403', '11539302092224', 'FaxE', 'GLASS54@email.com', '김지원', '유리');
    
    -- 다른 Cooperation Company 데이터 추가...

-- Subconstruction Detail 테이블에 값 삽입
INSERT INTO subconstruction_detail (s_code, s_type, s_personnel, s_contract_date, s_date, s_cost, c_c_code)
VALUES
    (31, 'Type1', 'Personnel1', '2023-05-01', '2023-05-15', 'Cost1', 1659784),
    (32, 'Type2', 'Personnel2', '2023-06-01', '2023-06-15', 'Cost2', 1657836),
    (33, 'Type3', 'Personnel3', '2023-07-01', '2023-07-15', 'Cost3', 1653472),
    (34, 'Type4', 'Personnel4', '2023-08-01', '2023-08-15', 'Cost4', 1653942),
    (35, 'Type5', 'Personnel5', '2023-09-01', '2023-09-15', 'Cost5', 1652442);
    -- 다른 Subconstruction Detail 데이터 추가...

-- Construction Progress 테이블에 값 삽입
INSERT INTO construction_progress (construction_code, project_code_progress, s_code, c_c_code, construction_emp_code, construction_progress_name, construction_location, construction_strart_date, construction_end_date)
VALUES
    (21, 20221129034, 31, 1659784, 119, 'Progress1', 'LocationA', '2023-05-20', '2023-06-20'),
    (22, 20221130001, 32, 1657836, 118, 'Progress2', 'LocationB', '2023-07-01', '2023-08-01'),
    (23, 20221129002, 33, 1653472, 117, 'Progress3', 'LocationC', '2023-08-01', '2023-09-01'),
    (24, 20231130001, 34, 1653942, 116, 'Progress4', 'LocationD', '2023-09-01', '2023-10-01'),
    (25, 20221201001, 35, 1652442, 115, 'Progress5', 'LocationE', '2023-10-01', '2023-11-01');
    -- 다른 Construction Progress 데이터 추가...

-- Input Detail 테이블에 값 삽입
INSERT INTO input_detail (input_quantity, input_code, input_date, material_code, constrction_code)
VALUES
    (10, 51, '2023-05-25', 1030, 21),
    (15, 52, '2023-07-10', 1038, 22),
    (56, 53, '2023-08-10', 1024, 23),
    (45, 54, '2023-01-10', 1017, 24),
    (45, 55, '2023-08-10', 1008, 25);
    -- 다른 Input Detail 데이터 추가...



select * from design;

