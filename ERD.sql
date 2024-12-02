CREATE TABLE Clients (
    Client_ID NUMBER(8) GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    First_Name VARCHAR2(100) NOT NULL,
    Last_Name VARCHAR2(100) NOT NULL,
    Client_Category VARCHAR2(10) CHECK (Client_Category IN ('Member', 'Guest')) NOT NULL,
    Gym_Visits NUMBER(4) DEFAULT 0,
    Relationship VARCHAR2(50),
    Contact VARCHAR2(15) NOT NULL,
    Emergency_Contact VARCHAR2(15),
    Email VARCHAR2(100) UNIQUE,
    Address CLOB,
    CONSTRAINT chk_relationship_guest
        CHECK (Client_Category = 'Guest' OR Relationship IS NULL)
);

-- Table: Membership
CREATE TABLE Membership (
    Membership_ID NUMBER(8) GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Client_ID NUMBER(8) NOT NULL,
    Plan_Type VARCHAR2(10) CHECK (Plan_Type IN ('Silver', 'Gold', 'Platinum')) NOT NULL,
    Start_Date DATE NOT NULL,
    End_Date DATE NOT NULL,
    Status VARCHAR2(10) CHECK (Status IN ('Active', 'Inactive')) NOT NULL,
    Price NUMBER(10, 2) NOT NULL
);

-- Table: Fitness Classes
CREATE TABLE Fitness_Classes (
    Class_ID NUMBER(8) GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Class_Name VARCHAR2(100) NOT NULL,
    Class_Type VARCHAR2(30) CHECK (Class_Type IN ('Core Exercises', 'Yoga', 'Pilates', 'Aerobic Fitness')) NOT NULL,
    Schedule TIMESTAMP NOT NULL,
    Instructor_ID NUMBER(8) NOT NULL,
    Available_Slots NUMBER NOT NULL
);

-- Table: Class Bookings
CREATE TABLE Class_Bookings (
    Booking_ID NUMBER(8) GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Class_ID NUMBER(8) NOT NULL,
    Client_ID NUMBER(8) NOT NULL,
    Status VARCHAR2(15) CHECK (Status IN ('Confirmed', 'Canceled', 'Waitlisted')) NOT NULL
);

-- Table: Personal_Training_Sessions
CREATE TABLE Personal_Training_Sessions (
    Training_ID NUMBER(8) GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Client_ID NUMBER(8) NOT NULL,
    Trainer_ID NUMBER(8) NOT NULL,
    Session_Schedule TIMESTAMP NOT NULL,
    Exercise_Type VARCHAR2(50) CHECK (Exercise_Type IN ('Cardio', 'Strength Training', 'Calisthenics', 'Other')) NOT NULL
);

-- Table: Health Assessments
CREATE TABLE Health_Assessments (
    Assessment_ID NUMBER(8) GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Client_ID NUMBER(8) NOT NULL,
    Trainer_ID NUMBER(8) NOT NULL,
    Assessment_Time TIMESTAMP NOT NULL,
    Weight NUMBER(5, 2),
    BMI NUMBER(5, 2),
    Body_Fat_Percentage NUMBER(5, 2)
);

-- Table: Gym Attendance
CREATE TABLE Gym_Attendance (
    Attendance_ID NUMBER(8) GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Client_ID NUMBER(8) NOT NULL,
    Check_in TIMESTAMP NOT NULL,
    Check_out TIMESTAMP,
    Facility_ID NUMBER(8) NOT NULL
);

-- Table: Billing
CREATE TABLE Billing (
    Billing_ID NUMBER(8) GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Transaction_ID NUMBER(8),
    Client_ID NUMBER(8) NOT NULL,
    Service_Name VARCHAR2(100) NOT NULL CHECK (Service_Name IN ('Membership', 'Class Booking', 'Personal Training', 'Health Assessment','Other')),
    Amount NUMBER(10, 2) NOT NULL,
    Billing_Date_Time TIMESTAMP NOT NULL,
    Payment_Method VARCHAR2(15) CHECK (Payment_Method IN ('Credit Card', 'Debit Card', 'Cash', 'Direct Debit')) NOT NULL,
    Payment_Status VARCHAR(15) CHECK (Payment_Status IN ('CONFIRMED', 'PENDING')) NOT NULL,
    Discount_Applied CHAR(1) DEFAULT 'N' CHECK (Discount_Applied IN ('Y', 'N')),
    Discount_Amount NUMBER(10, 2) DEFAULT 0.00,
    Discount_ID NUMBER(8)
);

-- Table: Discounts
CREATE TABLE Discounts (
    Discount_ID NUMBER(8) GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Discount_Type VARCHAR2(15) CHECK (Discount_Type IN ('Promotion', 'Referral')) NOT NULL,
    Discount_Code VARCHAR2(20) UNIQUE NOT NULL,
    Usage_Count NUMBER DEFAULT 0,
    Revenue_Loss NUMBER(10, 2) DEFAULT 0.00
);

-- Table: Staff
CREATE TABLE Staff (
    Staff_ID NUMBER(8) GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    First_Name VARCHAR2(100) NOT NULL,
    Last_Name VARCHAR2(100) NOT NULL,
    Staff_Role VARCHAR2(15) CHECK (Staff_Role IN ('Trainer', 'Instructor', 'Support Staff', 'Admin')) NOT NULL,
    Specialization VARCHAR2(50),
    Contact VARCHAR2(15),
    Emergency_Contact VARCHAR2(15),
    Salary NUMBER(10, 2)
);

-- Table: Facilities
CREATE TABLE Facilities (
    Facility_ID NUMBER(8) GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Facility_Name VARCHAR2(100) NOT NULL,
    Facility_Location VARCHAR2(100) NOT NULL
);

-- Table: Equipment Rentals
CREATE TABLE Equipment_Rentals (
    Rental_ID NUMBER(8) GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Facility_ID NUMBER(8),
    Equipment_SNo NUMBER NOT NULL,
    Equipment_Model VARCHAR2(15),
    Client_ID NUMBER(8) NOT NULL,
    Rental_Date DATE NOT NULL,
    Return_Date DATE,
    Maintenance_Schedule DATE
);

--ADDING CONSTRAINTS


-- Foreign Key for Membership.Client_ID → Clients.Client_ID
ALTER TABLE Membership
    ADD CONSTRAINT FK_Membership_Client FOREIGN KEY (Client_ID)
    REFERENCES Clients(Client_ID);

-- Foreign Key for Fitness_Classes.Instructor_ID → Staff.Staff_ID
ALTER TABLE Fitness_Classes
    ADD CONSTRAINT FK_Class_Instructor FOREIGN KEY (Instructor_ID)
    REFERENCES Staff(Staff_ID);

-- Foreign Key for Class_Bookings.Class_ID → Fitness_Classes.Class_ID
ALTER TABLE Class_Bookings
    ADD CONSTRAINT FK_Booking_Class FOREIGN KEY (Class_ID)
    REFERENCES Fitness_Classes(Class_ID);

-- Foreign Key for Class_Bookings.Client_ID → Clients.Client_ID
ALTER TABLE Class_Bookings
    ADD CONSTRAINT FK_Booking_Client FOREIGN KEY (Client_ID)
    REFERENCES Clients(Client_ID);

-- Foreign Key for Personal_training_Sessions.Client_ID → Clients.Client_ID
ALTER TABLE Personal_training_Sessions
    ADD CONSTRAINT FK_Personal_training_Sessions_Client FOREIGN KEY (Client_ID)
    REFERENCES Clients(Client_ID);

-- Foreign Key for Personal_training_Sessions.Trainer_ID → Staff.Staff_ID
ALTER TABLE Personal_training_Sessions
    ADD CONSTRAINT FK_Personal_training_Sessions_Trainer FOREIGN KEY (Trainer_ID)
    REFERENCES Staff(Staff_ID);

-- Foreign Key for Health_Assessments.Client_ID → Clients.Client_ID
ALTER TABLE Health_Assessments
    ADD CONSTRAINT FK_Assessment_Client FOREIGN KEY (Client_ID)
    REFERENCES Clients(Client_ID);

-- Foreign Key for Health_Assessments.Trainer_ID → Staff.Staff_ID
ALTER TABLE Health_Assessments
    ADD CONSTRAINT FK_Assessment_Trainer FOREIGN KEY (Trainer_ID)
    REFERENCES Staff(Staff_ID);

-- Foreign Key for Gym_Attendance.Client_ID → Clients.Client_ID
ALTER TABLE Gym_Attendance
    ADD CONSTRAINT FK_Attendance_Client FOREIGN KEY (Client_ID)
    REFERENCES Clients(Client_ID);

-- Foreign Key for Gym_Attendance.Facility_ID → Facilities.Facility_ID
ALTER TABLE Gym_Attendance
    ADD CONSTRAINT FK_Attendance_Facility FOREIGN KEY (Facility_ID)
    REFERENCES Facilities(Facility_ID);

-- Foreign Key for Billing.Client_ID → Clients.Client_ID
ALTER TABLE Billing
    ADD CONSTRAINT FK_Billing_Client FOREIGN KEY (Client_ID)
    REFERENCES Clients(Client_ID);

-- Foreign Key for Billing.Discount_ID → Discounts.Discount_ID
ALTER TABLE Billing
    ADD CONSTRAINT FK_Billing_Discount FOREIGN KEY (Discount_ID)
    REFERENCES Discounts(Discount_ID);

-- Foreign Key for Equipment_Rentals.Client_ID → Clients.Client_ID
ALTER TABLE Equipment_Rentals
    ADD CONSTRAINT FK_Rental_Client FOREIGN KEY (Client_ID)
    REFERENCES Clients(Client_ID);

-- Foreign Key for Equipment_Rentals.Facility_ID → Facilities.Facility_ID
ALTER TABLE Equipment_Rentals
    ADD CONSTRAINT FK_Rental_Facility FOREIGN KEY (Facility_ID)
    REFERENCES Facilities(Facility_ID);

