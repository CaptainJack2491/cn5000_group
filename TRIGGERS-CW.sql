-- ====================
--     TRIGGER: 1
-- ====================

CREATE OR REPLACE TRIGGER Update_Membership_Status
BEFORE UPDATE ON Membership
FOR EACH ROW
BEGIN
    -- Check if the End_Date is equal to or earlier than the current system date
    IF :NEW.End_Date <= TRUNC(SYSDATE) THEN
        -- Set the status to 'Inactive' directly in the new record
        :NEW.Status := 'Inactive';
    END IF;
END;
/
-- ––––––––––––––––––––
--  TESTING TRIGGER
-- ––––––––––––––––––––

-- Insert a test membership record
INSERT INTO Clients (Client_ID, First_Name, Last_Name, Client_Category, Relationship, Contact, Emergency_Contact, Email, Address)
VALUES (00000021, 'Dhara', 'Parekh', 'Member', Null, '+447123456789', '+447987654321', 'd.parekh@uel.ac.uk', 'University Way, London, E16 2RD');

INSERT INTO Membership (Membership_ID, Client_ID, Plan_Type, Start_Date, End_Date, Status, Price) 
VALUES (00000111, 00000021, 'Platinum', to_date('2024-10-20', 'YYYY-MM-DD'), to_date('2025-05-10', 'YYYY-MM-DD'), 'Active', 999);

-- Check the result
SELECT Status FROM Membership WHERE Client_ID = 21;

-- Update the membership end date to trigger the condition
UPDATE Membership
SET End_Date = to_date('2024-12-01', 'YYYY-MM-DD')
WHERE Client_ID = 21;

-- Check the result AGAIN
SELECT Status FROM Membership WHERE Client_ID = 21;


-- ====================
--     TRIGGER: 2
-- ====================
-- Trigger to raise error if no slots are available
CREATE OR REPLACE TRIGGER trg_raise_error_no_slots
BEFORE INSERT OR UPDATE OF Status ON Class_Bookings
FOR EACH ROW
DECLARE
    v_available_slots NUMBER;
BEGIN
    -- Check only for confirmed bookings
    IF :NEW.Status = 'Confirmed' THEN
        -- Retrieve the current number of available slots
        SELECT Available_Slots 
        INTO v_available_slots
        FROM Fitness_Classes
        WHERE Class_ID = :NEW.Class_ID;

        -- Raise an error if no slots are available
        IF v_available_slots <= 0 THEN
            RAISE_APPLICATION_ERROR(-20001, 'No slots available for this class');

        ELSE 
        UPDATE Fitness_Classes
        SET Available_Slots = Available_Slots - 1
        WHERE Class_ID = :NEW.Class_ID;
        END IF;
    END IF;
END trg_raise_error_no_slots;
/
-- ––––––––––––––––––––
--  TESTING TRIGGER
-- ––––––––––––––––––––
-- Insert a fitness class with no available slots
INSERT INTO Fitness_Classes (Class_ID, Class_Name, Class_Type, Schedule, Instructor_ID, Available_Slots)
VALUES (11000000, 'Trigger-Test Class', 'Yoga', SYSDATE + 1, 500, 1);

-- Attempt to insert a booking for the class with no slots
INSERT INTO Class_Bookings (Booking_ID, Class_ID, Client_ID, Status)
VALUES (11000016,11000000, 21, 'Confirmed');
--RUN IT TWICE
INSERT INTO Class_Bookings (Booking_ID, Class_ID, Client_ID, Status)
VALUES (11000017,11000000, 20, 'Confirmed');

-- ====================
--     TRIGGER: 3
-- ====================
    
CREATE OR REPLACE TRIGGER Notify_Expiring_Membership
AFTER UPDATE ON Membership
FOR EACH ROW
BEGIN
    -- Check if the End_Date is between system date + 1 and system date + 7
    IF :NEW.End_Date > TRUNC(SYSDATE) AND :NEW.End_Date <= TRUNC(SYSDATE) + 7 THEN
        -- Raise an application error to display a message in APEX
        RAISE_APPLICATION_ERROR(-20001, 'Your membership is expiring soon. Please renew your membership before ' || TO_CHAR(:NEW.End_Date, 'DD-MON-YYYY'));
    END IF;
END;
/
-- ––––––––––––––––––––
--  TESTING TRIGGER
-- ––––––––––––––––––––
-- Update the membership end date to trigger the condition
UPDATE Membership
SET End_Date = to_date('2024-12-09', 'YYYY-MM-DD')
WHERE Client_ID = 21;

-- Check the result
SELECT Status FROM Membership WHERE Client_ID = 21;
