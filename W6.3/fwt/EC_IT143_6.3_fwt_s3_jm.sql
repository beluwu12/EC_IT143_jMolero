-- Script: EC_IT143_6.3_fwt_s3_jm.sql
-- Author: Jeremy Molero
-- Date: 02/18/2026
-- Description: Step 3 - Research and test a solution.
-- Source 1: https://learn.microsoft.com/en-us/sql/t-sql/statements/create-trigger-transact-sql
-- Source 2: https://stackoverflow.com/questions/57180663/sql-how-do-you-create-a-trigger

USE EC_IT143_DA;
GO

-- First: Add the last_modified_date column if it doesn't exist
IF NOT EXISTS (
    SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 't_w3_schools_customers'
      AND COLUMN_NAME = 'last_modified_date'
)
BEGIN
    ALTER TABLE dbo.t_w3_schools_customers
    ADD last_modified_date DATETIME NULL;
    PRINT 'Column last_modified_date added.';
END
ELSE
    PRINT 'Column last_modified_date already exists.';
GO

-- Verify the column was added
SELECT TOP 5
    CustomerID,
    CustomerName,
    last_modified_date
FROM dbo.t_w3_schools_customers;
GO
