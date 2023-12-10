/* Purpose: create a trigger to verify phone area code, and return error message.
Author: Lisi Cao
Date: 2023-08-17 */

-- 1. Create a trigger to verify phone area code, and return error message.

CREATE TRIGGER HR.tr_verity_phone_area_code
ON HR.employee
AFTER INSERT, UPDATE
AS
BEGIN 
    DECLARE @area_code NVARCHAR(3)
    DECLARE @StateCode NVARCHAR(2)
    DECLARE @phone NVARCHAR(20)

    SELECT @StateCode = [state], @phone = phone
    FROM INSERTED

    SET @area_code = LEFT(@phone, 3)

    IF ( 
        (@StateCode = 'OR' AND @area_code NOT IN ('541', '503', '971')) 
    )
        RAISERROR ('OR phone area codes should be 541, 503, or 971', 16, 1)

    ELSE IF (
        (@StateCode = 'WA' AND @area_code NOT IN ('425', '360', '206', '509', '253'))
    )
        RAISERROR ('WA phone area codes should be 425, 360, 206, 509, or 253', 16, 1)

    ELSE IF (
        (@StateCode = 'WY' AND @area_code <> '307')
    )
        RAISERROR ('WY phone area codes should be 307', 16, 1)
END

-- 2. Test the trigger
-- Assuming a record with emp_id = 55 does not exist in the HR.employee table.

-- 2.1 test insert statement
--  Test 1: Inserting an employee with an invalid phone area code for the state OR

INSERT INTO HR.employee
(emp_id, l_name, f_name, zip, phone, ssn, wh_id, street, city, state)
VALUES
(135, 'Smith', 'John', '97001', '540-123-4567', '123-45-6789', 'WY-1', '123 Elm St', 'Portland', 'OR');

-- Expected Output: Error: OR phone area codes should be 541, 503, or 971

-- Test 2: Inserting an employee with a valid phone area code for the state OR

INSERT INTO HR.employee
(emp_id, l_name, f_name, zip, phone, ssn, wh_id, street, city, state)
VALUES
(123, 'Doe', 'Jane', '97001', '541-123-4567', '234-56-7890', 'WH-1', '456 Oak St', 'Portland', 'OR');

-- Expected Output: Record inserted successfully



-- 2.2 test update statement
-- Assuming a record with emp_id = 2 already exists in the HR.employee table.

-- Test 2.1: Updating the phone of an existing employee to an invalid area code for the state WA

UPDATE HR.employee
SET phone = '500-123-4567'
WHERE emp_id = 2;

-- Expected Output: Error: WA phone area codes should be 425, 360, 206, 509, or 253

-- Test 2.2: Updating the phone of an existing employee to a valid area code for the state WA

UPDATE HR.employee
SET phone = '425-123-4567'
WHERE emp_id = 2;

-- Expected Output: Record updated successfully

