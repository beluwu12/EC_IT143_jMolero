-- Script: EC_IT143_6.3_fwf_s5_jm.sql
-- Author: Jeremy Molero
-- Date: 02/18/2026
-- Description: Step 5 - Create a user-defined scalar function to extract the first name.
-- Source: https://learn.microsoft.com/en-us/sql/t-sql/statements/create-function-transact-sql

USE EC_IT143_DA;
GO

-- Drop function if it already exists
IF OBJECT_ID('dbo.fn_get_first_name_jm', 'FN') IS NOT NULL
    DROP FUNCTION dbo.fn_get_first_name_jm;
GO

CREATE FUNCTION dbo.fn_get_first_name_jm
(
    @full_name VARCHAR(100)   -- Input: full name in "FirstName LastName" format
)
RETURNS VARCHAR(50)           -- Output: first name only
AS
BEGIN
    -- Find the position of the space between first and last name
    -- Extract everything to the LEFT of that space
    RETURN LEFT(@full_name, CHARINDEX(' ', @full_name) - 1);
END;
GO
