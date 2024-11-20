-- Table: Clients
CREATE TABLE Clients (
    Client_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Type ENUM('Member', 'Guest') NOT NULL,
    Relationship VARCHAR(50),
    Contact VARCHAR(15) NOT NULL,
    Emergency_Contact VARCHAR(15),
    Email VARCHAR(100) UNIQUE,
    Address TEXT
);

-- Table: Membership
CREATE TABLE Membership (
    Membership_ID INT PRIMARY KEY AUTO_INCREMENT,
    Client_ID INT NOT NULL,
    Plan_Type ENUM('Silver', 'Gold', 'Platinum') NOT NULL,
    Start_Date DATE NOT NULL,
    End_Date DATE NOT NULL,
    Status ENUM('Active', 'Inactive') NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Client_ID) REFERENCES Clients(Client_ID)
);

-- Table: Fitness Classes
CREATE TABLE Fitness_Classes (
    Class_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Type ENUM('Yoga', 'Pilates', 'HIIT', 'Spinning') NOT NULL,
    Schedule DATETIME NOT NULL,
    Instructor_ID INT NOT NULL,
    Max_Capacity INT NOT NULL
);

-- Table: Class Bookings
CREATE TABLE Class_Bookings (
    Booking_ID INT PRIMARY KEY AUTO_INCREMENT,
    Class_ID INT NOT NULL,
    Client_ID INT NOT NULL,
    Status ENUM('Confirmed', 'Canceled', 'Waitlisted') NOT NULL,
    FOREIGN KEY (Class_ID) REFERENCES Fitness_Classes(Class_ID),
    FOREIGN KEY (Client_ID) REFERENCES Clients(Client_ID)
);

-- Table: Training
CREATE TABLE Training (
    Training_ID INT PRIMARY KEY AUTO_INCREMENT,
    Client_ID INT NOT NULL,
    Trainer_ID INT NOT NULL,
    Session_Date DATETIME NOT NULL,
    Workout_Details JSON,
    FOREIGN KEY (Client_ID) REFERENCES Clients(Client_ID),
    FOREIGN KEY (Trainer_ID) REFERENCES Staff(Staff_ID)
);

-- Table: Health Assessments
CREATE TABLE Health_Assessments (
    Assessment_ID INT PRIMARY KEY AUTO_INCREMENT,
    Client_ID INT NOT NULL,
    Trainer_ID INT NOT NULL,
    Date DATE NOT NULL,
    Weight DECIMAL(5, 2),
    BMI DECIMAL(5, 2),
    Body_Fat_Percentage DECIMAL(5, 2),
    FOREIGN KEY (Client_ID) REFERENCES Clients(Client_ID),
    FOREIGN KEY (Trainer_ID) REFERENCES Staff(Staff_ID)
);

-- Table: Gym Attendance
CREATE TABLE Gym_Attendance (
    Attendance_ID INT PRIMARY KEY AUTO_INCREMENT,
    Client_ID INT NOT NULL,
    Date DATE NOT NULL,
    Check_in DATETIME NOT NULL,
    Check_out DATETIME,
    Facility VARCHAR(100) NOT NULL,
    FOREIGN KEY (Client_ID) REFERENCES Clients(Client_ID)
);

-- Table: Billing
CREATE TABLE Billing (
    Billing_ID INT PRIMARY KEY AUTO_INCREMENT,
    Client_ID INT NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    Date DATE NOT NULL,
    Payment_Method ENUM('Credit Card', 'Debit Card', 'Cash', 'Direct Debit') NOT NULL,
    Discount_Applied BOOLEAN DEFAULT FALSE,
    Discount_Amount DECIMAL(10, 2) DEFAULT 0.00,
    FOREIGN KEY (Client_ID) REFERENCES Clients(Client_ID)
);

-- Table: Discounts
CREATE TABLE Discounts (
    Discount_ID INT PRIMARY KEY AUTO_INCREMENT,
    Type ENUM('Promotion', 'Referral') NOT NULL,
    Code VARCHAR(20) UNIQUE NOT NULL,
    Usage_Count INT DEFAULT 0,
    Revenue_Loss DECIMAL(10, 2) DEFAULT 0.00
);

-- Table: Staff
CREATE TABLE Staff (
    Staff_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Role ENUM('Trainer', 'Instructor', 'Admin') NOT NULL,
    Specialization VARCHAR(50),
    Contact VARCHAR(15),
    Emergency_Contact VARCHAR(15),
    Salary DECIMAL(10, 2)
);

-- Table: Facilities
CREATE TABLE Facilities (
    Facility_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Location VARCHAR(100) NOT NULL
);

-- Table: Equipment Rentals
CREATE TABLE Equipment_Rentals (
    Rental_ID INT PRIMARY KEY AUTO_INCREMENT,
    Equipment_ID INT NOT NULL,
    Client_ID INT NOT NULL,
    Rental_Date DATE NOT NULL,
    Return_Date DATE,
    Maintenance_Schedule DATE,
    FOREIGN KEY (Client_ID) REFERENCES Clients(Client_ID)
);

