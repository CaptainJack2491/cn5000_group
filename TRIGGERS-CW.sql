-- ====================
--     TRIGGER: 1
-- ====================

CREATE OR REPLACE TRIGGER Update_Membership_Status
AFTER UPDATE ON Membership
FOR EACH ROW
BEGIN
    -- Check if the End_Date is equal to the current system date
    IF :NEW.End_Date = TRUNC(SYSDATE) THEN
        -- Update the membership status to 'Inactive'
        UPDATE Membership
        SET Status = 'Inactive'
        WHERE Membership_ID = :NEW.Membership_ID;
    END IF;
END;
/

-- ====================
--     TRIGGER: 2
-- ====================
-- divided this trigger into 3 triggers to simplify:
-- 1. 'trg_raise_error_no_slots' - raise error if no slots available
-- 2. 'trg_increase_slots_on_cancel' - increase slots available if booking is canceled
-- 3. 'trg_decrease_slots_on_confirm' = decrease slots available when booking is confirmed

-- =========================
--     SUB-TRIGGER: 2.1
-- =========================
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
        END IF;
    END IF;
END trg_raise_error_no_slots;
/

-- =========================
--     SUB-TRIGGER: 2.2
-- =========================
-- Trigger to increase slots for cancelled bookings
CREATE OR REPLACE TRIGGER trg_increase_slots_on_cancel
AFTER UPDATE OF Status ON Class_Bookings
FOR EACH ROW
BEGIN
    -- Check only for bookings updated to "Canceled"
    IF :NEW.Status = 'Canceled' THEN
        UPDATE Fitness_Classes
        SET Available_Slots = Available_Slots + 1
        WHERE Class_ID = :NEW.Class_ID;
    END IF;
END trg_increase_slots_on_cancel;
/

-- =========================
--     SUB-TRIGGER: 2.3
-- =========================
-- Trigger to decrease slots for confirmed bookings
CREATE OR REPLACE TRIGGER trg_decrease_slots_on_confirm
AFTER INSERT OR UPDATE OF Status ON Class_Bookings
FOR EACH ROW
BEGIN
    -- Check only for confirmed bookings
    IF :NEW.Status = 'Confirmed' THEN
        UPDATE Fitness_Classes
        SET Available_Slots = Available_Slots - 1
        WHERE Class_ID = :NEW.Class_ID;
    END IF;
END trg_decrease_slots_on_confirm;
/

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
        RAISE_APPLICATION_ERROR(-20001, 'Your membership is expiring soon. Please renew your membership before ' || TO_CHAR(:NEW.End_Date, 'DD-MON-YYYY');
    END IF;
END;
/
