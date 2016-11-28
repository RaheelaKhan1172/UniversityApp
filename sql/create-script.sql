
CREATE DATABASE IF NOT EXISTS university;
USE university;
/*DROP DATABASE university; */

CREATE TABLE IF NOT EXISTS department (
	dept_id INT(10) auto_increment not null,
    dept_name VARCHAR(100) NOT NULL,
    budget INT(10),
    PRIMARY KEY(dept_id)
) ENGINE = INNODB;


CREATE TABLE IF NOT EXISTS course (
   course_id VARCHAR(20) NOT NULL,
   title VARCHAR(255) NOT NULL,
   credits DECIMAL(3,1),
   dept_id INT(10),
   prerequisite CHAR(10),
   PRIMARY KEY (course_id),
   FOREIGN KEY (dept_id) REFERENCES department(dept_id) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = INNODB;


CREATE TABLE IF NOT EXISTS faculty (
	faculty_id INT(10) NOT NULL,
    fac_name VARCHAR(30),
    room_id INT(5),
    dept_id INT(10),
    salary DECIMAL(10,2),
    PRIMARY KEY(faculty_id),
    FOREIGN KEY (dept_id) REFERENCES department(dept_id) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = INNODB;


CREATE TABLE IF NOT EXISTS term (
	term_id CHAR(4) NOT NULL,
    term_desc VARCHAR(30),
    start_date DATETIME,
    end_date DATETIME,
    PRIMARY KEY(term_id)
) ENGINE = INNODB;

ALTER TABLE term
MODIFY COLUMN start_date DATE;
ALTER TABLE term
MODIFY COLUMN end_date DATE;


CREATE TABLE IF NOT EXISTS location (
	room_id INT(5) NOT NULL,
    building VARCHAR(255),
    room_no INT(3),
    room_type VARCHAR(1),
    room_description VARCHAR(30),
    PRIMARY KEY (room_id)
) ENGINE = INNODB;

ALTER TABLE location
ADD COLUMN capacity INT(4);

CREATE TABLE IF NOT EXISTS section (
	section_id INT(5) NOT NULL,
    course_id VARCHAR(20),
    section_number INT (5) NOT NULL,
    term_id CHAR(4),
    faculty_id INT(10),
	sec_day CHAR(7),
    max_count INT(3),
    start_time DATETIME,
    end_time DATETIME,
    room_id INT(5),
    PRIMARY KEY (section_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (term_id) REFERENCES term(term_id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (room_id) REFERENCES location(room_id) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = INNODB;

ALTER TABLE section
MODIFY COLUMN start_time TIME;
ALTER TABLE section
MODIFY COLUMN end_time TIME;


CREATE TABLE IF NOT EXISTS major (
	major_id INT(3) NOT NULL,
    major_desc VARCHAR(50),
    PRIMARY KEY (major_id)
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS student (
	student_id INT(10) NOT NULL,
    last_name VARCHAR(20),
    first_name VARCHAR(20),
    street VARCHAR(20),
    city VARCHAR(20),
    state CHAR(2),
    zip CHAR(10),
    birth_date DATETIME,
    major_id INT(3),
    phone CHAR(10),
    student_type enum('ugrad','grad'),
    PRIMARY KEY (student_id),
    FOREIGN KEY (major_id) REFERENCES major(major_id) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = INNODB;

ALTER TABLE student
MODIFY COLUMN street VARCHAR(50);
ALTER TABLE student
MODIFY COLUMN zip INT(5);

CREATE TABLE IF NOT EXISTS registration (
	student_id INT(10) ,
    section_id INT(5) ,
	midterm_grade CHAR(2),
    final_grade CHAR(2),
    FOREIGN KEY (student_id) REFERENCES student(student_id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (section_id) REFERENCES section(section_id) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = INNODB;


