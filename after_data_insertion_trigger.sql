-- trigger1
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

-- trigger3
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
