CREATE DATABASE students;
USE students;
CREATE TABLE Mentor(m_id INTEGER PRIMARY KEY , m_name varchar(20));
CREATE TABLE Users(u_id INTEGER PRIMARY KEY , u_name varchar(30) , m_id INTEGER , FOREIGN KEY (m_id) REFERENCES Mentor(m_id));
CREATE TABLE Courses(c_id INTEGER PRIMARY KEY , c_name varchar(30)); 
CREATE TABLE Stud_activated_course(u_id INTEGER , c_id INTEGER , PRIMARY KEY (u_id,c_id) , FOREIGN KEY (c_id) REFERENCES Courses(c_id),
FOREIGN KEY (u_id) REFERENCES Users(u_id));
CREATE TABLE Company_drive(comp_name varchar(30) , u_id INTEGER , PRIMARY KEY(comp_name,u_id),FOREIGN KEY (u_id) REFERENCES Users(u_id));
CREATE TABLE Attendance(u_id INTEGER , percent INTEGER , FOREIGN KEY (u_id) REFERENCES Users(u_id) );
CREATE TABLE Topics(domain varchar(10) primary key,tot_prob INTEGER);
CREATE TABLE Codekata(u_id INTEGER,domain varchar(10), prob_solved INTEGER,PRIMARY KEY (u_id,domain),FOREIGN KEY (u_id) REFERENCES Users(u_id),
FOREIGN KEY (domain) REFERENCES Topics(domain));
CREATE TABLE Task(u_id INTEGER ,domain varchar(10),prob  INTEGER,ass_date DATE,PRIMARY KEY (u_id,domain),FOREIGN KEY (u_id) REFERENCES Users(u_id),
FOREIGN KEY (domain) REFERENCES Topics(domain));


INSERT INTO Mentor VALUES(11,'Swathy');
INSERT INTO Mentor VALUES(12,'Raju');
INSERT INTO Mentor VALUES(13,'Charles');
INSERT INTO Mentor VALUES(14,'Ramesh');
INSERT INTO Mentor VALUES(15,'Rama rao');

INSERT INTO Users (u_id,u_name,m_id) VALUES(148,'Preethi',11);
INSERT INTO Users (u_id,u_name,m_id) VALUES(014,'Sai Bhavya',12);
INSERT INTO Users (u_id,u_name,m_id) VALUES(137,'Srenitha',15);
INSERT INTO Users (u_id,u_name,m_id) VALUES(168,'Anjali',13);
INSERT INTO Users (u_id,u_name,m_id) VALUES(136,'Aishwarya',14);

INSERT INTO Courses (c_id,c_name) VALUES(2514,'Python');
INSERT INTO Courses (c_id,c_name) VALUES(2511,'Data Structures');
INSERT INTO Courses (c_id,c_name) VALUES(2519,'SQL');
INSERT INTO Courses (c_id,c_name) VALUES(2510,'Web Technology');
INSERT INTO Courses (c_id,c_name) VALUES(2501,'Java');

INSERT INTO Stud_activated_course VALUES(014,2519);
INSERT INTO Stud_activated_course VALUES(148,2511);
INSERT INTO Stud_activated_course VALUES(137,2510);
INSERT INTO Stud_activated_course VALUES(168,2501);
INSERT INTO Stud_activated_course VALUES(136,2514);

INSERT INTO Attendance VALUES (148,91);
INSERT INTO Attendance VALUES (137,80);
INSERT INTO Attendance VALUES (136,98);
INSERT INTO Attendance VALUES (014,99);
INSERT INTO Attendance VALUES (168,77);

INSERT INTO Company_drive(comp_name,u_id) VALUES('Infosys',014);
INSERT INTO Company_drive(comp_name,u_id) VALUES('Infosys',168);
INSERT INTO Company_drive(comp_name,u_id) VALUES('Techigai',136);
INSERT INTO Company_drive(comp_name,u_id) VALUES('Modak Analytics',137);
INSERT INTO Company_drive(comp_name,u_id) VALUES('CHUBB',148);

INSERT INTO Topics VALUES ('Searching',20);
INSERT INTO Topics VALUES ('Sorting',26);
INSERT INTO Topics VALUES ('arrays',40);
INSERT INTO Topics VALUES ('Graphs',32);
INSERT INTO Topics VALUES ('Hashing',10);

INSERT INTO Codekata VALUES(148,'arrays',3);
INSERT INTO Codekata VALUES(148,'Searching',5);
INSERT INTO Codekata VALUES(014,'Graphs',10);
INSERT INTO Codekata VALUES(014,'Sorting',10);
INSERT INTO Codekata VALUES(168,'arrays',3);
INSERT INTO Codekata VALUES(137,'Searching',9);
INSERT INTO Codekata VALUES(136,'Sorting',1);

INSERT INTO Task (u_id,domain,prob,ass_date) VALUES (148,'Searching',10,'2021-09-07');
INSERT INTO Task (u_id,domain,prob,ass_date) VALUES (014,'Hashing',7,'2021-09-08');
INSERT INTO Task (u_id,domain,prob,ass_date) VALUES (168,'arrays',5,'2021-09-10');
INSERT INTO Task (u_id,domain,prob,ass_date) VALUES (136,'Graphs',7,'2021-09-07');
INSERT INTO Task (u_id,domain,prob,ass_date) VALUES (137,'Sorting',12,'2021-09-07');

/* QUERY 3 : GEt the number of problems solved in codekata by combining users */
select u.u_name,sum(c.prob_solved) from users u,codekata c where u.u_id=c.u_id group by u.u_id;

/* QUERY 4:  Display No of Drives Attended By a User */
select u.u_name,count(*) from users u,company_drive c where u.u_id=c.u_id group by u.u_id;

/* QUERY 5 : Combine and display students_activated_courses and courses for a specific user groping them based on the course  */
select u.u_name,c.c_name from users u,stud_activated_course s,courses c where u.u_id=s.u_id and c.c_id=s.c_id;

/* QUERY  6 : LIST ALL THE MENTORS*/
select m_name from mentor;

/* QUERY 7 : List all the Students assigned to a mentor */
select m.m_name,count(u.u_id) from mentor m,users u where u.m_id=m.m_id group by m.m_id;

/*









