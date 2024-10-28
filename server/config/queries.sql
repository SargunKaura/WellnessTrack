CREATE DATABASE WellnessTrack;
USE WellnessTrack;
CREATE TABLE Admin (
 AdminID INT PRIMARY KEY,
 Name VARCHAR(255) NOT NULL,
 Email VARCHAR(255) UNIQUE NOT NULL,
 DateOfBirth DATE,
 PhoneNumber VARCHAR(20),
 HireDate DATE,
 Role VARCHAR(50),
 Status VARCHAR(50),
 Image VARCHAR(255)
);
CREATE TABLE report (
 ReportID INT PRIMARY KEY,
 ReportType ENUM('monthly', 'yearly') NOT NULL,
 ReportCategory ENUM('Financial', 'Operational', 'Performance') NOT NULL,
 ReportYear INT,
 ReportMonth INT,
 ReportContent TEXT,
 AdminID INT,
 FOREIGN KEY (AdminID) REFERENCES Admin(AdminID)
);
CREATE TABLE User (
 UserID INT PRIMARY KEY,
 Username VARCHAR(255) NOT NULL,
 Password VARCHAR(255) NOT NULL,
 Role VARCHAR(50),
 Status VARCHAR(50),
 Image VARCHAR(255) -- Adding the image attribute
);
CREATE TABLE Staff (
 StaffID INT PRIMARY KEY,
 Name VARCHAR(255) NOT NULL,
 Email VARCHAR(255) UNIQUE NOT NULL,
 Phone VARCHAR(20),
 DateOfBirth DATE,
 WorkID INT,
 Image VARCHAR(255) -- Adding the image attribute
);
CREATE TABLE Patient (
 PatientID INT PRIMARY KEY,
 Name VARCHAR(255) NOT NULL,
 Email VARCHAR(255) UNIQUE NOT NULL,
 Phone VARCHAR(20),
 DateOfBirth DATE,
 HealthID VARCHAR(50),
 Image VARCHAR(255) -- Adding the image attribute
);
CREATE TABLE Doctor (
 DoctorID INT PRIMARY KEY,
 Name VARCHAR(255) NOT NULL,
 Email VARCHAR(255) UNIQUE NOT NULL,
 Phone VARCHAR(20),
 DateOfBirth DATE,
 WorkID INT,
 Image VARCHAR(255) -- Adding the image attribute
);
CREATE TABLE MonitoringFunction (
 FunctionID INT PRIMARY KEY,
 FunctionName VARCHAR(255) NOT NULL,
 DoctorID INT,
 PatientID INT,
 MonitoringStatus VARCHAR(50),
 MonitoringParameters TEXT,
 IsAbnormal BOOLEAN,
 AbnormalPercentage DOUBLE,
 FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
 FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);
CREATE TABLE Exam (
 ExamID INT PRIMARY KEY,
 ExamName VARCHAR(255) NOT NULL, -- Adding the missing key attribute
 ExamType VARCHAR(255),
 ExamDate DATE,
 PatientID INT,
 DoctorID INT,
 FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
 FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);
CREATE TABLE TestResult (
 ResultID INT PRIMARY KEY,
 ExamID INT,
 PatientID INT,
 ResultDate DATE,
 ResultDetails TEXT,
 FOREIGN KEY (ExamID) REFERENCES Exam(ExamID),
 FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);
CREATE TABLE Notification (
 NotificationID INT PRIMARY KEY,
 DoctorID INT,
 PatientID INT,
 Message TEXT,
 DateSent DATE,
 FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
 FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);
INSERT INTO User (UserID, Username, Password, Role, Status, Image) VALUES
(1, 'alice', 'securepassword1', 'Standard User', 'Active',
'https://drive.google.com/uc?id=1ocnU6Lrb7T8iQqv2ZqLYpJOQ2N3A902C'),
(2, 'emily', 'securepassword2', 'Standard User', 'Active',
'https://drive.google.com/uc?id=1I4Vh7R3vmkEF7hrADHg4stY6ubF5IYWb'),
(3, 'sophia', 'securepassword3', 'Standard User', 'Active',
'https://drive.google.com/uc?id=1yuZOygKORZv3HzluWbb03Wc5eF7L40dV'),
(4, 'ava', 'securepassword4', 'Standard User', 'Active',
'https://drive.google.com/uc?id=1bi56UJUpKU76Fpt5g3jBvZWSx3voujTI'),
(5, 'isabella', 'securepassword5', 'Standard User', 'Active',
'https://drive.google.com/uc?id=1RcN6YkfyYMQFhhu6HvfJ2JR4p5lqWePH');
select *from user ;