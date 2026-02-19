-- Script: EC_IT143_6.3_fwf_s8_jm.sql
-- Author: Jeremy Molero
-- Date: 02/18/2026
-- Description: Step 8 - Ask the next question and repeat the process.
-- Q: How do I extract the LAST name from the ContactName column?

USE EC_IT143_DA;
GO

-- =============================================
-- STEP 1: New Question
-- Q: How do I extract the last name from ContactName?
-- =============================================

-- =============================================
-- STEP 2: Begin Answer
-- Everything AFTER the space is the last name.
-- RIGHT(ContactName, LEN(ContactName) - CHARINDEX(' ', ContactName))
-- =============================================

-- =============================================
-- STEP 3: Ad Hoc Query
-- =============================================
SELECT
    ContactName,
    RIGHT(ContactName, LEN(ContactName) - CHARINDEX(' ', ContactName)) AS last_name_adhoc
FROM dbo.t_w3_schools_customers;
GO

-- =============================================
-- STEP 4: Drop and recreate last name function
-- =============================================
IF OBJECT_ID('dbo.fn_get_last_name_jm', 'FN') IS NOT NULL
    DROP FUNCTION dbo.fn_get_last_name_jm;
GO

CREATE FUNCTION dbo.fn_get_last_name_jm
(
    @full_name VARCHAR(100)
)
RETURNS VARCHAR(50)
AS
BEGIN
    -- Find the space, extract everything to the RIGHT of it
    RETURN RIGHT(@full_name, LEN(@full_name) - CHARINDEX(' ', @full_name));
END;
GO

-- =============================================
-- STEP 5: Compare UDF vs Ad Hoc
-- =============================================
SELECT
    ContactName,
    RIGHT(ContactName, LEN(ContactName) - CHARINDEX(' ', ContactName)) AS last_name_adhoc,
    dbo.fn_get_last_name_jm(ContactName)                               AS last_name_udf
FROM dbo.t_w3_schools_customers;
GO

-- =============================================
-- STEP 6: Zero Results Test (CTE)
-- =============================================
WITH cte_last_name AS
(
    SELECT
        ContactName,
        RIGHT(ContactName, LEN(ContactName) - CHARINDEX(' ', ContactName)) AS last_name_adhoc,
        dbo.fn_get_last_name_jm(ContactName)                               AS last_name_udf
    FROM dbo.t_w3_schools_customers
)
SELECT *
FROM cte_last_name
WHERE last_name_adhoc <> last_name_udf;
-- Expected: 0 rows
GO
