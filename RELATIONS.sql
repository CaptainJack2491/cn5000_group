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

-- Foreign Key for Training.Client_ID → Clients.Client_ID
ALTER TABLE Training
    ADD CONSTRAINT FK_Training_Client FOREIGN KEY (Client_ID)
    REFERENCES Clients(Client_ID);

-- Foreign Key for Training.Trainer_ID → Staff.Staff_ID
ALTER TABLE Training
    ADD CONSTRAINT FK_Training_Trainer FOREIGN KEY (Trainer_ID)
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
