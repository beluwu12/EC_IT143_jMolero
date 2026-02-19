-- Script: EC_IT143_6.3_fwt_s6_jm.sql
-- Author: Jeremy Molero
-- Date: 02/18/2026
-- Description: Step 6 - Ask the next question and repeat.
-- Q: How do I track WHO last modified a record using SUSER_NAME()?

USE EC_IT143_DA;
GO

-- =============================================
-- STEP 1: New Question
-- Q: How do I set the "last_modified_by" to the current server user?
-- =============================================

-- =============================================
-- STEP 2: Begin Answer
-- SUSER_NAME() returns the current SQL Server login.
-- Need to add last_modified_by column, then update it in the trigger.
-- =============================================

-- =============================================
-- STEP 3: Add the last_modified_by column
-- =============================================
IF NOT EXISTS (
    SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 't_w3_schools_customers'
      AND COLUMN_NAME = 'last_modified_by'
)
BEGIN
    ALTER TABLE dbo.t_w3_schools_customers
    ADD last_modified_by VARCHAR(100) NULL;
    PRINT 'Column last_modified_by added.';
END
ELSE
    PRINT 'Column last_modified_by already exists.';
GO

-- =============================================
-- STEP 4: Create/Update the trigger to include SUSER_NAME()
-- =============================================
IF OBJECT_ID('dbo.tr_w3_customers_last_modified_by_jm', 'TR') IS NOT NULL
    DROP TRIGGER dbo.tr_w3_customers_last_modified_by_jm;
GO

CREATE TRIGGER dbo.tr_w3_customers_last_modified_by_jm
ON dbo.t_w3_schools_customers
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Update both last_modified_date AND last_modified_by
    -- SUSER_NAME() captures the SQL Server login that ran the UPDATE.
    UPDATE dbo.t_w3_schools_customers
    SET
        last_modified_date = GETDATE(),
        last_modified_by   = SUSER_NAME()
    WHERE CustomerID IN (SELECT CustomerID FROM INSERTED);
END;
GO

-- =============================================
-- STEP 5: Test the new trigger
-- =============================================
UPDATE dbo.t_w3_schools_customers
SET City = 'Maracaibo'
WHERE CustomerID = 1;
GO

SELECT CustomerID, CustomerName, City, last_modified_date, last_modified_by
FROM dbo.t_w3_schools_customers
WHERE CustomerID = 1;
GO
-- Expected: last_modified_date = now, last_modified_by = your SQL login name.
