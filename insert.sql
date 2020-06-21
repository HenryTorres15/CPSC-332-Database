/*
Henry Torres
Robert Kenny
CPSC 332 Project
*/

/* 3 Professors */
/* (SSN, Name, Zip, Street, City, State, Area Code, 7-Digit, Salary, Sex, Prof Title) */

INSERT INTO Professor
VALUES ('123456789', 'Mike Tyson',  92626, '409 W Wilson St', 'Orange', 'CA', 714, '5157432', 100000, 'M', 'Doctor');

INSERT INTO Professor
VALUES ('847392046', 'John Doe', 92645,  '354 Harbor Blvd', 'Santa Ana', 'CA', 714, '8394051', 90000, 'M', 'Doctor');

INSERT INTO Professor
VALUES ('349206581', 'Amanda Boomer', 92627,  '123 S Fair Dr', 'Costa Mesa', 'CA', 949, '7436412', 110000, 'F', 'Doctor');

/* Professor Degrees */
/* (Prof SSN, Prof Degree Title") */

INSERT INTO College_Degrees
VALUES ('123456789', 'Ph.D. Computer Science');

INSERT INTO College_Degrees
VALUES ('123456789', 'M.A. Computer Science');

INSERT INTO College_Degrees
VALUES ('123456789', 'B.S. Computer Science');

INSERT INTO College_Degrees
VALUES ('847392046', 'Ph.D. Computer Science');

INSERT INTO College_Degrees
VALUES ('847392046', 'M.A. Computer Science');

INSERT INTO College_Degrees
VALUES ('847392046', 'B.S. Mathematics');

INSERT INTO College_Degrees
VALUES ('349206581', 'Ph.D. Computer Science');

INSERT INTO College_Degrees
VALUES ('349206581', 'M.A. Computer Science');

INSERT INTO College_Degrees
VALUES ('349206581', 'B.S. Computer Science');

/* 2 Departments */
/* (Dept Number, Dept Name, Location, Dept Telephone, Prof SSN) */

INSERT INTO Department
VALUES (19876, 'Computer Science', 'CS 500', '7148473209', '123456789');

INSERT INTO Department
VALUES (12345, 'Math',  'MH 500', '7148392064','847392046');

/* 4 Courses */
/* Course Number, Units, Course Title, Textbook, Department Number */

INSERT INTO Course
VALUES (332, 3, "File Structures and Database Systems", "Fundamentals of Database Systems, Seventh Edition", 19876);

INSERT INTO Course
VALUES (353, 3, "Introduction to Computer Security", "Introduction to Computer Security, Pearson Edition", 19876);

INSERT INTO Course
VALUES (240, 4 , "Computer Organization and Assembly Programming", "Assembly Language Programming with Ubuntu", 19876);

INSERT INTO Course
VALUES (338, 3,"Statistics to Natural Sciences", "Statistics to Natural Science, Third Edition", 12345);

/* 1 Prerequisets */

INSERT INTO Prerequisite
VALUES (353, 240);

/* 6 Sections*/
/* (Course Number, Section Number, Number of Seats, Meeting Days, Classroom, Begin Time, End Time, Prof SSN) */

INSERT INTO Section
VALUES (332, 03, 35, 'MW', 'EC 109', '2:30pm', '3:45pm', '123456789');

INSERT INTO Section
VALUES (353, 02, 30, 'MW', 'CS 104',  '10:00am', '11:45am', '847392046');

INSERT INTO Section
VALUES (240, 05, 45, 'TTH','CS 201', '12:00pm', '2:00pm', '847392046');

INSERT INTO Section
VALUES (332, 01, 25, 'MWF','CS 305', '1:00pm', '2:15pm', '847392046');

INSERT INTO Section
VALUES (338, 02, 30, 'TTH','EC 106', '11:00am', '12:15pm', '123456789');

INSERT INTO Section
VALUES (353, 06, 35,  'MWF', 'CS 204', '4:30pm', '5:45pm', '349206581');

/* 8 Students */
/* (CWID, First Name, Last Name, Student Address, Student Telephone, Dept Number) */

INSERT INTO Student
VALUES ('745632907', 'Henry', 'Torres', '123 Fairy St. Costa Mesa, CA 92627', '9493829465', 19876);

INSERT INTO Student
VALUES ('678534512', 'Robert', 'Kenny', '32 N Fairview Ave. Tustin, CA 94738', '7143729543', 19876);

INSERT INTO Student
VALUES ('854037519', 'John', 'Smith', '90 W Marshall St. Irvine, CA 94837', '7144980932', 19876);

INSERT INTO Student
VALUES ('372856401', 'Natalie', 'Lee', '61 Sunswept Ave. Santa Ana, CA 92603', '7147483920', 19876);

INSERT INTO Student
VALUES ('758493017', 'Mike', 'Myers', '2305 Beach Blvd. Garden Grove, CA 92263', '7149384762', 12345);

INSERT INTO Student
VALUES ('758493520', 'Sophia', 'Henderson', '3456 Pamona Dr. Fullerton, CA 93627', '7147486543', 12345);

INSERT INTO Student
VALUES ('483121145', 'Peter', 'Chao', '7890 Yolo St. Anahiem, CA 94037', '7144531782', 12345);

INSERT INTO Student
VALUES ('483771234', 'Juan', 'Fernandez', '453 19th St. Newport Beach, CA 93342', '9493672009', 19876);

/* 24 Enrollments */
/*(Student CWID, Course Number, Section Number, Grade) */

INSERT INTO Enrollment
VALUES ('745632907', 332, 03, 'B');

INSERT INTO Enrollment
VALUES ('745632907', 353, 02, 'A');

INSERT INTO Enrollment
VALUES ('745632907', 240, 05, 'A-');

INSERT INTO Enrollment
VALUES ('678534512', 332, 03, 'B+');

INSERT INTO Enrollment
VALUES ('678534512', 240, 05, 'F');

INSERT INTO Enrollment
VALUES ('678534512', 338, 02, 'A');

INSERT INTO Enrollment
VALUES ('854037519',240, 05, 'B+');

INSERT INTO Enrollment
VALUES ('854037519', 353, 06, 'D+');

INSERT INTO Enrollment
VALUES ('854037519', 338, 02, 'C-');

INSERT INTO Enrollment
VALUES ('372856401', 332, 01, 'A+');

INSERT INTO Enrollment
VALUES ('372856401', 338, 02, 'D+');

INSERT INTO Enrollment
VALUES ('372856401', 240, 05, 'B');

INSERT INTO Enrollment
VALUES ('758493017', 353, 02, 'B-');

INSERT INTO Enrollment
VALUES ('758493017', 338, 02, 'B-');

INSERT INTO Enrollment
VALUES ('758493017', 332, 01, 'B-');

INSERT INTO Enrollment
VALUES ('758493520', 353, 06, 'A');

INSERT INTO Enrollment
VALUES ('758493520', 332, 01, 'B+');

INSERT INTO Enrollment
VALUES ('758493520', 240, 05, 'C+');

INSERT INTO Enrollment
VALUES ('483121145', 332, 03, 'B-');

INSERT INTO Enrollment
VALUES ('483121145', 353, 06, 'A');

INSERT INTO Enrollment
VALUES ('483121145', 338, 02, 'B-');

INSERT INTO Enrollment
VALUES ('483771234', 332, 01, 'A');

INSERT INTO Enrollment
VALUES ('483771234', 240, 05, 'A');

INSERT INTO Enrollment
VALUES ('483771234', 353, 06, 'A');

/* 2 Minors */
/* (Dept Number, Student CWID) */

INSERT INTO Minor
VALUES (19876, '745632907');

INSERT INTO Minor
VALUES (12345, '854037519');