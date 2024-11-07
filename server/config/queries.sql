CREATE DATABASE WellnessTrackDB;
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

INSERT INTO Admin (AdminID, Name, Email, DateOfBirth, PhoneNumber, HireDate, Role, Status, Image) VALUES 
(1, 'Sophia Miller', 'sophiamiller@example.com', '1985-03-20', '123-456-7890', '2022-01-01', 'Admin', 'Active', 'https://drive.google.com/file/d/1ocnU6Lrb7T8iQqv2ZqLYpJOQ2N3A902C/view?usp=drive_link'),
(2, 'Olivia Johnson', 'oliviajohnson@example.com', '1988-04-25', '123-456-7891', '2021-02-01', 'Admin', 'Active', 'https://drive.google.com/file/d/1I4Vh7R3vmkEF7hrADHg4stY6ubF5IYWb/view?usp=drive_link'),
(3, 'Michael Smith', 'michaelsmith@example.com', '1982-06-14', '123-456-7892', '2020-03-01', 'Admin', 'Active', 'https://drive.google.com/file/d/1roXWUabiiWMmiwxf8vwUX-YRqwWfNbmO/view?usp=drive_link'),
(4, 'Emma Davis', 'emmadavis@example.com', '1990-07-10', '123-456-7893', '2019-05-01', 'Admin', 'Active', 'https://drive.google.com/file/d/1m5H4f03NpJDOqPHM-2ayrLG0TlZRP-2Z/view?usp=drive_link'),
(5, 'James Brown', 'jamesbrown@example.com', '1981-05-19', '123-456-7894', '2018-06-01', 'Admin', 'Active', 'https://drive.google.com/file/d/1nk-vtkGj718I8kGNguQrpg3heJvxrx8Q/view?usp=drive_link');


INSERT INTO Patient (PatientID, Name, Email, Phone, DateOfBirth, HealthID, Image) VALUES 
(1, 'Mia Martinez', 'miamartinez@example.com', '123-456-7800', '1990-02-20', 'HID12345', 'https://drive.google.com/file/d/1O89rMJJ6pt8AwRMuzdK7XxqlP-Qm3Hlz/view?usp=drive_link'),
(2, 'Harper Brown', 'harperbrown@example.com', '123-456-7801', '1995-04-25', 'HID67890', 'https://drive.google.com/file/d/14R8XF5-xTL9p7FrmDxEZeYQFw3jOr1U6/view?usp=drive_link'),
(3, 'Liam Wilson', 'liamwilson@example.com', '123-456-7802', '1993-06-14', 'HID54321', 'https://drive.google.com/file/d/1K6ocrRPx5qSCzAeHg1tqa1DiMj_CN3_p/view?usp=sharing'),
(4, 'Noah Lee', 'noahlee@example.com', '123-456-7803', '1988-07-19', 'HID98765', 'https://drive.google.com/file/d/13vq4ira5u4q7TXUda0QSQXGiq7UTfpbD/view?usp=sharing'),
(5, 'Charlotte Harris', 'charlotteharris@example.com', '123-456-7804', '1985-08-10', 'HID11223', 'https://drive.google.com/file/d/1hoCMfqUD15sD8ZQDNpGgFr8o8tcDQ2lX/view?usp=sharing');

INSERT INTO Doctor (DoctorID, Name, Email, Phone, DateOfBirth, WorkID, Image) VALUES 
(1, 'Amelia White', 'ameliawhite@example.com', '123-456-7805', '1990-01-15', 106, 'https://drive.google.com/file/d/10bJEx3nQDqv77d_qP2M9iaXj7NIUg71m/view?usp=drive_link'),
(2, 'Charlotte Evans', 'charlotteevans@example.com', '123-456-7806', '1987-03-05', 107, 'https://drive.google.com/file/d/18YjZH6dfGURiq1_FCqAG-Q8b6y_nPVYE/view?usp=drive_link'),
(3, 'Benjamin Brown', 'benjaminbrown@example.com', '123-456-7807', '1984-05-12', 108, 'https://drive.google.com/file/d/1Pti39TChmYxXUTirXcp6nzLBhiMF-70e/view?usp=sharing'),
(4, 'Lucas Jones', 'lucasjones@example.com', '123-456-7808', '1991-07-22', 109, 'https://drive.google.com/file/d/1hk9RUYe9Yz9t8OPeZO3cUlCGuj0W9gIy/view?usp=sharing'),
(5, 'Oliver Taylor', 'olivertaylor@example.com', '123-456-7809', '1986-09-27', 110, 'https://drive.google.com/file/d/1V8PTSLqdE9mCDquWbsYKObiXwJCkMTJi/view?usp=drive_link');

INSERT INTO Staff (StaffID, Name, Email, DateOfBirth, Phone, WorkID, Image) VALUES 
(1, 'Ava Taylor', 'avataylor@example.com', '1982-02-20', '123-456-7895', 101, 'https://drive.google.com/file/d/1yuZOygKORZv3HzluWbb03Wc5eF7L40dV/view?usp=drive_link'),
(2, 'Emily Johnson', 'emilyjohnson@example.com', '1990-03-15', '123-456-7896', 102, 'https://drive.google.com/file/d/1bi56UJUpKU76Fpt5g3jBvZWSx3voujTI/view?usp=drive_link'),
(3, 'Sophia Brown', 'sophiabrown@example.com', '1995-09-30', '123-456-7897', 103, 'https://drive.google.com/file/d/1RcN6YkfyYMQFhhu6HvfJ2JR4p5lqWePH/view?usp=drive_link'),
(4, 'Daniel Clark', 'danielclark@example.com', '1992-11-20', '123-456-7898', 104, 'https://drive.google.com/file/d/13OIWt4fzc8op6cbfnzSpZsSQFWd5e7Nc/view?usp=sharing'),
(5, 'William King', 'williamking@example.com', '1988-01-11', '123-456-7899', 105, 'https://drive.google.com/file/d/1FRuWvpp6FVtMczdR78Fh-dJel_OgLHMr/view?usp=sharing');


INSERT INTO MonitoringFunction (FunctionID, FunctionName, DoctorID, PatientID, MonitoringStatus, MonitoringParameters, IsAbnormal, AbnormalPercentage) VALUES
(1, 'Blood Pressure Monitoring', 1, 1, 'Active', 'Systolic, Diastolic', TRUE, 10.5),
(2, 'Heart Rate Monitoring', 2, 2, 'Active', 'Resting, Active', FALSE, 5.2),
(3, 'Glucose Level Monitoring', 3, 3, 'Active', 'Fasting, Post-Meal', TRUE, 8.3),
(4, 'Oxygen Saturation Monitoring', 4, 4, 'Inactive', 'SpO2', FALSE, 2.1),
(5, 'Cholesterol Monitoring', 5, 5, 'Active', 'LDL, HDL', TRUE, 7.8);


INSERT INTO Exam (ExamID, ExamName, ExamType, ExamDate, PatientID, DoctorID) VALUES
(1, 'Annual Physical', 'General', '2024-01-15', 1, 1),
(2, 'Cardiac Stress Test', 'Cardiology', '2024-02-20', 2, 2),
(3, 'Blood Glucose Test', 'Endocrinology', '2024-03-25', 3, 3),
(4, 'Pulmonary Function Test', 'Pulmonology', '2024-04-10', 4, 4),
(5, 'Lipid Panel', 'Laboratory', '2024-05-05', 5, 5);

INSERT INTO TestResult (ResultID, ExamID, PatientID, ResultDate, ResultDetails) VALUES
(1, 1, 1, '2024-01-16', 'All parameters normal'),
(2, 2, 2, '2024-02-21', 'Mild arrhythmia detected'),
(3, 3, 3, '2024-03-26', 'Elevated fasting glucose'),
(4, 4, 4, '2024-04-11', 'Normal lung function'),
(5, 5, 5, '2024-05-06', 'High LDL cholesterol');


INSERT INTO Notification (NotificationID, DoctorID, PatientID, Message, DateSent) VALUES
(1, 1, 1, 'Your annual physical results are available.', '2024-01-17'),
(2, 2, 2, 'Your cardiac stress test results show mild arrhythmia.', '2024-02-22'),
(3, 3, 3, 'Your blood glucose levels are elevated.', '2024-03-27'),
(4, 4, 4, 'Your pulmonary function test is normal.', '2024-04-12'),
(5, 5, 5, 'Your lipid panel shows high LDL cholesterol.', '2024-05-07');

INSERT INTO report (ReportID, ReportType, ReportCategory, ReportYear, ReportMonth, ReportContent, AdminID) VALUES
(1, 'monthly', 'Financial', 2024, 1, 'Monthly financial report content.', 1),
(2, 'yearly', 'Operational', 2024, 0, 'Yearly operational report content.', 2),
(3, 'monthly', 'Performance', 2024, 2, 'Monthly performance report content.', 3),
(4, 'yearly', 'Financial', 2024, 0, 'Yearly financial report content.', 4),
(5, 'monthly', 'Operational', 2024, 3, 'Monthly operational report content.', 5);

ALTER TABLE User
ADD Email VARCHAR(255) UNIQUE;

UPDATE User SET Email = 'alice@example.com' WHERE UserID = 1;
UPDATE User SET Email = 'emily@example.com' WHERE UserID = 2;
UPDATE User SET Email = 'sophia@example.com' WHERE UserID = 3;
UPDATE User SET Email = 'ava@example.com' WHERE UserID = 4;
UPDATE User SET Email = 'isabella@example.com' WHERE UserID = 5;

select * from user ;

-- Inserting users into the User table
INSERT INTO User (UserID, Username, Password, Email, Role, Status, Image) VALUES 
(6, 'sophiam', 'securepassword6', 'sophiamiller@example.com', 'Admin', 'Active', 'https://drive.google.com/file/d/1ocnU6Lrb7T8iQqv2ZqLYpJOQ2N3A902C/view?usp=drive_link'),
(7, 'oliviaj', 'securepassword7', 'oliviajohnson@example.com', 'Admin', 'Active', 'https://drive.google.com/file/d/1I4Vh7R3vmkEF7hrADHg4stY6ubF5IYWb/view?usp=drive_link'),
(8, 'michaels', 'securepassword8', 'michaelsmith@example.com', 'Admin', 'Active', 'https://drive.google.com/file/d/1roXWUabiiWMmiwxf8vwUX-YRqwWfNbmO/view?usp=drive_link'),
(9, 'emmad', 'securepassword9', 'emmadavis@example.com', 'Admin', 'Active', 'https://drive.google.com/file/d/1m5H4f03NpJDOqPHM-2ayrLG0TlZRP-2Z/view?usp=drive_link'),
(10, 'jamesb', 'securepassword10', 'jamesbrown@example.com', 'Admin', 'Active', 'https://drive.google.com/file/d/1nk-vtkGj718I8kGNguQrpg3heJvxrx8Q/view?usp=drive_link');

INSERT INTO User (UserID, Username, Password, Email, Role, Status, Image) VALUES 
(11, 'miam', 'securepassword11', 'miamartinez@example.com', 'Patient', 'Active', 'https://drive.google.com/file/d/1O89rMJJ6pt8AwRMuzdK7XxqlP-Qm3Hlz/view?usp=drive_link'),
(12, 'harperb', 'securepassword12', 'harperbrown@example.com', 'Patient', 'Active', 'https://drive.google.com/file/d/14R8XF5-xTL9p7FrmDxEZeYQFw3jOr1U6/view?usp=drive_link'),
(13, 'liamw', 'securepassword13', 'liamwilson@example.com', 'Patient', 'Active', 'https://drive.google.com/file/d/1K6ocrRPx5qSCzAeHg1tqa1DiMj_CN3_p/view?usp=sharing'),
(14, 'noahl', 'securepassword14', 'noahlee@example.com', 'Patient', 'Active', 'https://drive.google.com/file/d/13vq4ira5u4q7TXUda0QSQXGiq7UTfpbD/view?usp=sharing'),
(15, 'charlotteh', 'securepassword15', 'charlotteharris@example.com', 'Patient', 'Active', 'https://drive.google.com/file/d/1hoCMfqUD15sD8ZQDNpGgFr8o8tcDQ2lX/view?usp=sharing');

INSERT INTO User (UserID, Username, Password, Email, Role, Status, Image) VALUES 
(16, 'ameliaw', 'securepassword16', 'ameliawhite@example.com', 'Doctor', 'Active', 'https://drive.google.com/file/d/10bJEx3nQDqv77d_qP2M9iaXj7NIUg71m/view?usp=drive_link'),
(17, 'charlottee', 'securepassword17', 'charlotteevans@example.com', 'Doctor', 'Active', 'https://drive.google.com/file/d/18YjZH6dfGURiq1_FCqAG-Q8b6y_nPVYE/view?usp=drive_link'),
(18, 'benjaminb', 'securepassword18', 'benjaminbrown@example.com', 'Doctor', 'Active', 'https://drive.google.com/file/d/1Pti39TChmYxXUTirXcp6nzLBhiMF-70e/view?usp=sharing'),
(19, 'lucasj', 'securepassword19', 'lucasjones@example.com', 'Doctor', 'Active', 'https://drive.google.com/file/d/1hk9RUYe9Yz9t8OPeZO3cUlCGuj0W9gIy/view?usp=sharing'),
(20, 'olivert', 'securepassword20', 'olivertaylor@example.com', 'Doctor', 'Active', 'https://drive.google.com/file/d/1V8PTSLqdE9mCDquWbsYKObiXwJCkMTJi/view?usp=drive_link');

INSERT INTO User (UserID, Username, Password, Email, Role, Status, Image) VALUES 
(21, 'avat', 'securepassword21', 'avataylor@example.com', 'Staff', 'Active', 'https://drive.google.com/file/d/1yuZOygKORZv3HzluWbb03Wc5eF7L40dV/view?usp=drive_link'),
(22, 'emilyj', 'securepassword22', 'emilyjohnson@example.com', 'Staff', 'Active', 'https://drive.google.com/file/d/1bi56UJUpKU76Fpt5g3jBvZWSx3voujTI/view?usp=drive_link'),
(23, 'sophiab', 'securepassword23', 'sophiabrown@example.com', 'Staff', 'Active', 'https://drive.google.com/file/d/1RcN6YkfyYMQFhhu6HvfJ2JR4p5lqWePH/view?usp=drive_link'),
(24, 'danielc', 'securepassword24', 'danielclark@example.com', 'Staff', 'Active', 'https://drive.google.com/file/d/13OIWt4fzc8op6cbfnzSpZsSQFWd5e7Nc/view?usp=sharing'),
(25, 'williamk', 'securepassword25', 'williamking@example.com', 'Staff', 'Active', 'https://drive.google.com/file/d/1FRuWvpp6FVtMczdR78Fh-dJel_OgLHMr/view?usp=sharing');

ALTER TABLE Admin
ADD CONSTRAINT FK_Admin_Email FOREIGN KEY (Email) REFERENCES User(Email);

ALTER TABLE Patient
ADD CONSTRAINT FK_Patient_Email FOREIGN KEY (Email) REFERENCES User(Email);

ALTER TABLE Doctor
ADD CONSTRAINT FK_Doctor_Email FOREIGN KEY (Email) REFERENCES User(Email);

ALTER TABLE Staff
ADD CONSTRAINT FK_Staff_Email FOREIGN KEY (Email) REFERENCES User(Email);

