-- Creating tables for the Gym Management System (GMS)

-- Table: Fitness Classes
CREATE TABLE Fitness_Classes (
    Class_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Type VARCHAR(50) NOT NULL,
    Schedule DATETIME NOT NULL,
    Instructor_ID INT NOT NULL,
    Max_Capacity INT NOT NULL,
    FOREIGN KEY (Instructor_ID) REFERENCES Staff(Staff_ID)
);

-- Table: Class Bookings
CREATE TABLE Class_Bookings (
    Booking_ID INT PRIMARY KEY AUTO_INCREMENT,
    Class_ID INT NOT NULL,
    Member_ID INT NOT NULL,
    Booking_Status ENUM('Confirmed', 'Canceled', 'Waitlisted') NOT NULL,
    FOREIGN KEY (Class_ID) REFERENCES Fitness_Classes(Class_ID),
    FOREIGN KEY (Member_ID) REFERENCES Clients(Client_ID)
);

-- Table: Membership
CREATE TABLE Membership (
    Membership_ID INT PRIMARY KEY AUTO_INCREMENT,
    Member_ID INT NOT NULL,
    Plan_Type VARCHAR(50) NOT NULL,
    Start_Date DATE NOT NULL,
    End_Date DATE NOT NULL,
    Status ENUM('Active', 'Inactive') NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Member_ID) REFERENCES Clients(Client_ID)
);

-- Table: Billing
CREATE TABLE Billing (
    Billing_ID INT PRIMARY KEY AUTO_INCREMENT,
    Member_ID INT NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    Date DATE NOT NULL,
    Payment_Method ENUM('Credit Card', 'Debit Card', 'Cash', 'Direct Debit') NOT NULL,
    Discount_Applied BOOLEAN DEFAULT FALSE,
    Discount_Amount DECIMAL(10, 2) DEFAULT 0.00,
    FOREIGN KEY (Member_ID) REFERENCES Clients(Client_ID)
);

-- Table: Personal Training/Workouts
CREATE TABLE Training (
    Training_ID INT PRIMARY KEY AUTO_INCREMENT,
    Member_ID INT NOT NULL,
    Trainer_ID INT NOT NULL,
    Session_Date DATE NOT NULL,
    Workout_Details JSON,
    FOREIGN KEY (Member_ID) REFERENCES Clients(Client_ID),
    FOREIGN KEY (Trainer_ID) REFERENCES Staff(Staff_ID)
);

-- Table: Gym Attendance
CREATE TABLE Gym_Attendance (
    Attendance_ID INT PRIMARY KEY AUTO_INCREMENT,
    Member_ID INT NOT NULL,
    Check_in DATETIME NOT NULL,
    Check_out DATETIME,
    Date DATE NOT NULL,
    Facility VARCHAR(100) NOT NULL,
    FOREIGN KEY (Member_ID) REFERENCES Clients(Client_ID)
);

-- Table: Discounts
CREATE TABLE Discounts (
    Discount_ID INT PRIMARY KEY AUTO_INCREMENT,
    Type VARCHAR(50) NOT NULL,
    Code VARCHAR(20) NOT NULL UNIQUE,
    Usage_Count INT DEFAULT 0,
    Revenue_Loss DECIMAL(10, 2) DEFAULT 0.00
);

-- Table: Staff
CREATE TABLE Staff (
    Staff_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Role ENUM('Trainer', 'Instructor') NOT NULL,
    Specialization VARCHAR(50),
    Address TEXT,
    Email VARCHAR(100),
    Contact VARCHAR(15),
    Emergency_Contact VARCHAR(15)
);

-- Table: Clients
CREATE TABLE Clients (
    Client_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Type ENUM('Member', 'Guest') NOT NULL,
    Relationship VARCHAR(50),
    Address TEXT,
    Email VARCHAR(100),
    Contact VARCHAR(15),
    Emergency_Contact VARCHAR(15)
);

-- Add foreign keys to ensure referential integrity
ALTER TABLE Fitness_Classes
ADD CONSTRAINT FK_Instructor FOREIGN KEY (Instructor_ID) REFERENCES Staff(Staff_ID);

ALTER TABLE Class_Bookings
ADD CONSTRAINT FK_Class FOREIGN KEY (Class_ID) REFERENCES Fitness_Classes(Class_ID),
ADD CONSTRAINT FK_Member FOREIGN KEY (Member_ID) REFERENCES Clients(Client_ID);

ALTER TABLE Membership
ADD CONSTRAINT FK_Membership_Member FOREIGN KEY (Member_ID) REFERENCES Clients(Client_ID);

ALTER TABLE Billing
ADD CONSTRAINT FK_Billing_Member FOREIGN KEY (Member_ID) REFERENCES Clients(Client_ID);

ALTER TABLE Training
ADD CONSTRAINT FK_Training_Member FOREIGN KEY (Member_ID) REFERENCES Clients(Client_ID),
ADD CONSTRAINT FK_Training_Trainer FOREIGN KEY (Trainer_ID) REFERENCES Staff(Staff_ID);

ALTER TABLE Gym_Attendance
ADD CONSTRAINT FK_Attendance_Member FOREIGN KEY (Member_ID) REFERENCES Clients(Client_ID);

-- Constraints ensure the database is normalized to 3NF

