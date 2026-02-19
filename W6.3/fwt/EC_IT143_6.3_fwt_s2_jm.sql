-- Script: EC_IT143_6.3_fwt_s2_jm.sql
-- Author: Jeremy Molero
-- Date: 02/18/2026
-- Description: Step 2 - Begin creating an answer.

USE EC_IT143_DA;
GO

-- Current progress:
-- The table t_w3_schools_customers does not have a last_modified_date column.
-- I need to first ADD the column to the table using ALTER TABLE.

-- Next logical steps:
-- Step A: ALTER TABLE to add a last_modified_date column (datetime, null).
-- Step B: Create an AFTER UPDATE trigger that sets last_modified_date = GETDATE()
--         automatically every time any row is updated.

-- Key function to use:
-- GETDATE()    --> returns current server date and time
-- SUSER_NAME() --> returns the current SQL Server login name
