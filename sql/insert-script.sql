USE university;


INSERT INTO department(dept_name,budget) VALUES 
('Computer Science', 90000),
('Telecommunications', 100000),
('Accounting', 85000),
('Math and Science' , 120000),
('Liberal Arts', 800000 ),
('English', 70000);

INSERT INTO course VALUES
('AC101','Accounting', 3, 3, 'EN100'),
('CIS253', 'Database Systems', 3, 1,''),
('CIS265' ,'Systems Analysis', 3, 3 ,'CIS253'),
('EN100', 'Basic English', 0, 6,''),
('LA123', 'English Literature', 3, 5, 'EN100'),
('MA150', 'College Algebra', 3, 4, 'EN100');

INSERT INTO faculty VALUES
(63395,'Jones', 11, 1, 94333.99 ),
(78699 ,'Mobley', 11, 1, 59303.62),
(96895 ,'Williams' , 20 , 2 ,119921.41),
(79653 ,'Vajpayee' ,12 ,2 ,88791.45 ),
(97302 ,'Collins' ,17 ,3 ,61387.56 ),
(57180 ,'Sen' ,12 ,3 ,32570.50 ),
(74420 , 'Rivera' ,21, 4 ,89805.83 ),
(35579 ,'Chang' ,17 ,5 ,108011.81 ),
(98377 ,'Brad' ,12, 6 ,35570.50 );

INSERT INTO term VALUES 
('FL12', 'Fall 2012' , '2012-09-08', '2012-12-20' ),
('FL13', 'Fall 2013', '2013-09-07' , '2013-12-19' ),
('SP12', 'Spring 2012', '2012-04-28', '2012-07-16' ),
('SP13', 'Spring 2013' ,'2013-03-27', '2013-07-15' ),
('WN13', 'Winter 2013', '2013-01-05', '2013-04-18' );

INSERT INTO location VALUES 
(11, 'Gandhi' ,101, 'O', 'Office' ,2),
(12, 'Gandhi', 103, 'O', 'Office', 2),
(13 ,'Kennedy' ,202,'L' ,'Lab',35),
(14 , 'Kennedy', 204, 'L', 'Lab' ,50),
(15 , 'Nehru', 301, 'C', 'Classroom',50 ),
(16 ,'Nehru', 309,'C' ,'Classroom' ,45),
(17 ,'Gandhi' ,105,'O', 'Office',2 ),
(18 ,'Kennedy' ,206,'L' ,'Lab',40 ),
(19, 'Kennedy', 210 , 'C', 'Classroom',30 ),
(20 ,'Gandhi' ,107, 'O' ,'Office',2),
(21, 'Gandhi', 109 ,'O', 'Office',2 );

INSERT INTO major VALUES 
(100 ,'AAS-Accounting' ),
(200, 'AAS-Computer Science' ),
(300 ,'AAS-Telecommunications'),
(400, 'BS-Accounting' ),
(500 ,'BS-Computer Science' ),
(600 ,'BS-Telecommunications' );

INSERT INTO section VALUES 
(1101, 'CIS265', 01, 'WN13', 63395, 'MW' ,30 , '09:00' ,'10:30', 13 ),
(1102, 'CIS253', 01, 'WN13' ,78699 ,'TR', 40 , '09:00', '10:30' ,18 ),
(1103, 'MA150', 02 , 'WN13', 74420, 'F', 25, '09:00', '12:00', 15 ),
(1104, 'AC101' ,01, 'FL13' ,57180 , 'MW', 35, '10:30', '12:00', 16 ),
(1205, 'CIS265', 01, 'SP13', 96895, 'MW', 35, '09:00' , '10:30', 14 ),
(1206 , 'CIS265', 02 ,'SP13', 63395, 'TR', 30 ,'09:00', '10:30', 18 ),
(1207 ,'LA123' ,05 ,'SP13' ,NULL, 'MW ',30 ,'09:00', '10:30', 15 ),
(1208, 'CIS253', 21, 'SP13' ,78699 ,'TR', 40, '09:00', '10:30', 14 ),
(1209 ,'CIS253', 11, 'FL12',63395, 'MW' ,40 ,'09:00 ','10:30' ,18 ),
(1210 ,'CIS253', 31 , 'FL13', 78699, 'F' ,45, '09:00', '12:00', 19 ),
(1311 ,'EN100', 01, 'FL13', 98377, 'MW' ,50, '09:00' ,'10:30' ,14 );

INSERT INTO student VALUES
(24746, 'Diaz', 'Jose' ,'1 Ford Avenue #7', 'Hill', 'NJ', 08863, '1993-02-12', 100, '9735551111', 'ugrad' ),
(79352 ,'Tyler', 'Kee', '12 Morris Avenue', 'Bronx', 'NY', 10468, '1994-03-18', 500, '7185552222', 'grad' ),
(76672, 'Miliko', 'Rajesh', '25 River Road #3', 'Edison', 'NJ', 08837, '1995-12-12', 400 ,'7325553333', 'ugrad' ),
(14182 ,'Rickles', 'Alex', '100 Main Street', 'Iselin', 'NJ', 08838, '1990-10-20' ,500 ,'7325554444' ,'grad' ),
(44985, 'Lee', 'Ho', '2845 First Lane', 'Hope', 'NY', 11373, '1995-10-28', 600, '2125555555', 'grad' ),
(96052, 'Holn', 'Amir', '213 Broadway', 'Clifton', 'NJ' ,07222, '1994-07-07' ,200, '2015556666', 'ugrad' );

INSERT INTO registration VALUES 
(24746, 1102, 'B', 'B' ),
(24746, 1103, 'C', 'F' ),
(24746, 1104, 'B', 'A' ),
(24746, 1207, '', ''),
(79352, 1205 , '', ''),
(76672, 1102, 'F','D'),
(76672, 1103, 'A' ,'A'),
(76672, 1206, 'B', 'C'),
(76672, 1207,'',''),
(76672, 1210 ,'',''),
(14182, 1101, 'F','W'),
(14182, 1104 ,'D', 'D'),
(14182, 1206 ,'A','B'),
(14182, 1311, 'A', 'A'),
(44985, 1206 , '',''),
(44985, 1207 , '',''),
(44985, 1210,'',''),
(96052, 1208,'',''),
(96052, 1209,'',''),
(96052, 1311, 'B','B');