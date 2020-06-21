/*
Henry Torres
Robert Kenny
CPSC 332 Project
*/

CREATE TABLE Professor (
  SSN VARCHAR(9),
  Prof_Name VARCHAR(50),
  Zip INT,
  Street VARCHAR(20),
  City VARCHAR(15),
  State CHAR(2),
  Area_Code INT,
  7_Digit CHAR(7),
  Salary INT,
  Sex CHAR(1),
  Prof_Title VARCHAR(15),
  PRIMARY KEY (SSN));

CREATE TABLE Department (
  Dept_Num INT,
  Dept_Name VARCHAR(50),
  Location VARCHAR(20),
  Dept_Tel CHAR(10),
  Prof_SSN VARCHAR(9),
  PRIMARY KEY (Dept_Num),
  FOREIGN KEY (Prof_SSN) REFERENCES Professor(SSN));

CREATE TABLE Student (
  CWID CHAR(9),
  FName VARCHAR(20),
  LName VARCHAR(20),
  Student_Addr VARCHAR(50),
  Student_Tel CHAR(10),
  Dept_No INT,
  PRIMARY KEY (CWID),
  FOREIGN KEY (Dept_No) REFERENCES Department(Dept_Num));

CREATE TABLE Course (
  Course_Num INT,
  Units INT,
  Course_Title text,
  Textbook text,
  D_Num INT,
  PRIMARY KEY (Course_Num),
  FOREIGN KEY (D_Num) REFERENCES Department(Dept_Num));

CREATE TABLE Section (
  Course_No INT,
  Section_No INT,
  Num_Seats INT,
  Meeting_Days CHAR(3),
  Classroom VARCHAR(10),
  Begin_Time VARCHAR(8),
  End_Time VARCHAR(8),
  Prof_SSN VARCHAR(9),
  PRIMARY KEY (Course_No, Section_No),
  FOREIGN KEY (Course_No) REFERENCES Course(Course_Num),
  FOREIGN KEY (Prof_SSN) REFERENCES Professor(SSN));

CREATE TABLE College_Degrees (
  Pr_SSN VARCHAR(9),
  Degree VARCHAR(30),
  PRIMARY KEY (Pr_SSN, Degree),
  FOREIGN KEY (Pr_SSN) REFERENCES Professor(SSN));

CREATE TABLE Minor (
  DNum INT,
  Student_No CHAR(9),
  PRIMARY KEY (DNum,Student_No),
  FOREIGN KEY (DNum) REFERENCES Department (Dept_Num),
  FOREIGN KEY (Student_No) REFERENCES Student(CWID));

CREATE TABLE Enrollment (
  Student_CWID CHAR(9),
  Cour_No INT,
  Sec_No INT,
  Grade VARCHAR(2),
  PRIMARY KEY (Student_CWID, Cour_No, Sec_No),
  FOREIGN KEY (Student_CWID) REFERENCES Student(CWID),
  FOREIGN KEY (Cour_No, Sec_No) REFERENCES Section(Course_No, Section_No));

CREATE TABLE Prerequisite (
  C_Num INT,
  Prereq_Num INT,
  PRIMARY KEY (C_Num, Prereq_Num),
  FOREIGN KEY (C_Num) REFERENCES Course(Course_Num),
  FOREIGN KEY (Prereq_Num) REFERENCES Course(Course_Num));
