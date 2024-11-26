-- Trigger: Prevent guests from having memberships


CREATE OR REPLACE TRIGGER trg_check_membership_client
BEFORE INSERT OR UPDATE ON Membership
FOR EACH ROW
DECLARE
    client_category VARCHAR2(10);
BEGIN
    -- Fetch the client category from the Clients table
    SELECT Client_Category
    INTO client_category
    FROM Clients
    WHERE Client_ID = :NEW.Client_ID;

    -- Raise an error if the client is a guest
    IF client_category = 'Guest' THEN
        RAISE_APPLICATION_ERROR(-20001, 'Guests cannot have memberships.');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_default_transaction_id
BEFORE INSERT OR UPDATE ON Billing
FOR EACH ROW
BEGIN
    -- Allow NULL Transaction_ID for all Pending transactions
    IF :NEW.Payment_Status = 'PENDING' THEN
        -- Do nothing, NULL Transaction_ID is allowed
        NULL;

    -- Raise an error for Confirmed transactions if Transaction_ID is NULL
    ELSIF :NEW.Payment_Status = 'CONFIRMED' AND :NEW.Transaction_ID IS NULL THEN
        RAISE_APPLICATION_ERROR(-20012, 'Transaction_ID cannot be NULL for confirmed transactions.');

    -- Assign a default Transaction_ID of -1 for Cash payments if Transaction_ID is NULL
    ELSIF :NEW.Payment_Method = 'Cash' AND :NEW.Transaction_ID IS NULL THEN
        :NEW.Transaction_ID := -1;

    -- Raise an error for any other cases where Transaction_ID is NULL
    ELSIF :NEW.Transaction_ID IS NULL THEN
        RAISE_APPLICATION_ERROR(-20013, 'Transaction_ID cannot be NULL for this payment method or status.');
    END IF;
END;
/



-- Trigger: Assign default Transaction_ID for cash payments


CREATE OR REPLACE TRIGGER trg_default_transaction_id
BEFORE INSERT OR UPDATE ON Billing
FOR EACH ROW
BEGIN
    -- Assign a default Transaction_ID of -1 for cash payments
    IF :NEW.Payment_Method = 'Cash' AND :NEW.Transaction_ID IS NULL THEN
        :NEW.Transaction_ID := -1;
    END IF;
END;
/


-- Trigger: Update discount usage and revenue loss in Discounts table


CREATE OR REPLACE TRIGGER trg_update_discount_usage
AFTER INSERT OR UPDATE ON Billing
FOR EACH ROW
BEGIN
    -- Update discount usage count and revenue loss if a discount is applied
    IF :NEW.Discount_Applied = 'Y' AND :NEW.Discount_ID IS NOT NULL THEN
        UPDATE Discounts
        SET Usage_Count = Usage_Count + 1,
            Revenue_Loss = Revenue_Loss + :NEW.Discount_Amount
        WHERE Discount_ID = :NEW.Discount_ID;
    END IF;
END;
/


-- Trigger: Ensure Discount_Amount does not exceed £70


CREATE OR REPLACE TRIGGER trg_limit_discount_amount
BEFORE INSERT OR UPDATE OF Discount_Amount ON Billing
FOR EACH ROW
BEGIN
    -- Raise an error if the Discount_Amount exceeds £70
    IF :NEW.Discount_Amount > 70 THEN
        RAISE_APPLICATION_ERROR(-20003, 'Discount amount cannot exceed £70.');
    END IF;
END;
/


-- Trigger: Validate Membership Start_Date and End_Date


CREATE OR REPLACE TRIGGER trg_validate_membership_dates
BEFORE INSERT OR UPDATE OF Start_Date, End_Date ON Membership
FOR EACH ROW
BEGIN
    -- Ensure that End_Date is later than Start_Date
    IF :NEW.End_Date <= :NEW.Start_Date THEN
        RAISE_APPLICATION_ERROR(-20004, 'End_Date must be later than Start_Date.');
    END IF;
END;
/


-- Trigger: Mark Membership as Inactive when End_Date passes


CREATE OR REPLACE TRIGGER trg_update_membership_status
AFTER INSERT OR UPDATE OF End_Date ON Membership
FOR EACH ROW
BEGIN
    -- Update the Membership status to Inactive if End_Date has passed
    IF :NEW.End_Date < SYSDATE THEN
        UPDATE Membership
        SET Status = 'Inactive'
        WHERE Membership_ID = :NEW.Membership_ID;
    END IF;
END;
/


-- Trigger: Update Available_Slots based on Class_Bookings


CREATE OR REPLACE TRIGGER trg_update_Available_Slots
AFTER INSERT OR UPDATE OF Status ON Class_Bookings
FOR EACH ROW
DECLARE
    v_Available_Slots NUMBER;
BEGIN
    -- Lock the current Available_Slots for the Class_ID being booked
    SELECT Available_Slots
    INTO v_Available_Slots
    FROM Fitness_Classes
    WHERE Class_ID = :NEW.Class_ID
    FOR UPDATE;

    -- Adjust Available_Slots based on booking status
    IF :NEW.Status = 'Confirmed' THEN
        -- Reduce capacity for confirmed bookings
        IF v_Available_Slots > 0 THEN
            UPDATE Fitness_Classes
            SET Available_Slots = v_Available_Slots - 1
            WHERE Class_ID = :NEW.Class_ID;
        ELSE
            RAISE_APPLICATION_ERROR(-20005, 'Cannot confirm booking: Class is full.');
        END IF;

    ELSIF :NEW.Status = 'Waitlisted' THEN
        -- Reduce capacity for waitlisted bookings
        IF v_Available_Slots > 0 THEN
            UPDATE Fitness_Classes
            SET Available_Slots = v_Available_Slots - 1
            WHERE Class_ID = :NEW.Class_ID;
        ELSE
            RAISE_APPLICATION_ERROR(-20006, 'Cannot waitlist booking: Class is full.');
        END IF;

    ELSIF :NEW.Status = 'Canceled' THEN
        -- Increase capacity for canceled bookings
        UPDATE Fitness_Classes
        SET Available_Slots = v_Available_Slots + 1
        WHERE Class_ID = :NEW.Class_ID;
    END IF;
END;
/


-- Trigger: Prevent Membership or Classes with Past Dates


CREATE OR REPLACE TRIGGER trg_prevent_past_dates
BEFORE INSERT OR UPDATE ON Membership
FOR EACH ROW
BEGIN
    -- Ensure Membership Start_Date and End_Date are not in the past
    IF :NEW.Start_Date < SYSDATE THEN
        RAISE_APPLICATION_ERROR(-20007, 'Start_Date cannot be in the past.');
    END IF;
    IF :NEW.End_Date < SYSDATE THEN
        RAISE_APPLICATION_ERROR(-20008, 'End_Date cannot be in the past.');
    END IF;
END;
/


-- Trigger: Prevent duplicate bookings for the same class


CREATE OR REPLACE TRIGGER trg_prevent_duplicate_bookings
BEFORE INSERT OR UPDATE ON Class_Bookings
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    -- Check for existing confirmed bookings by the same client for the same class
    SELECT COUNT(*)
    INTO v_count
    FROM Class_Bookings
    WHERE Client_ID = :NEW.Client_ID AND Class_ID = :NEW.Class_ID AND Status = 'Confirmed';

    -- Raise an error if a duplicate booking is found
    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20009, 'Client has already confirmed this class.');
    END IF;
END;
/


-- Trigger: Ensure valid Trainer assignments


CREATE OR REPLACE TRIGGER trg_validate_trainer_assignment
BEFORE INSERT OR UPDATE ON Personal_Training_Sessions
FOR EACH ROW
DECLARE
    v_trainer_count NUMBER;
BEGIN
    -- Check if the Trainer_ID exists and matches the Trainer role
    SELECT COUNT(*)
    INTO v_trainer_count
    FROM Staff
    WHERE Staff_ID = :NEW.Trainer_ID AND Staff_Role = 'Trainer';

    -- Raise an error if no valid Trainer_ID is found
    IF v_trainer_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20010, 'Invalid Trainer_ID: No such trainer exists.');
    END IF;
END;
/


-- Trigger: Prevent schedule conflicts for instructors


CREATE OR REPLACE TRIGGER trg_check_instructor_schedule
BEFORE INSERT OR UPDATE ON Fitness_Classes
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    -- Check for overlapping schedules for the same Instructor
    SELECT COUNT(*)
    INTO v_count
    FROM Fitness_Classes
    WHERE Instructor_ID = :NEW.Instructor_ID
      AND Schedule BETWEEN :NEW.Schedule - INTERVAL '1' HOUR AND :NEW.Schedule + INTERVAL '1' HOUR;

    -- Raise an error if a conflict is found
    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20011, 'Instructor has a scheduling conflict.');
    END IF;
END;
/
