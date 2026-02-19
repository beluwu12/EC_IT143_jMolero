-- Script: EC_IT143_6.3_fwf_s4_jm.sql
-- Author: Jeremy Molero
-- Date: 02/18/2026
-- Description: Step 4 - Research and test a refined solution.
-- Source 1: https://learn.microsoft.com/en-us/sql/t-sql/functions/charindex-transact-sql
-- Source 2: https://stackoverflow.com/questions/5145791/extracting-first-name-and-last-name

USE EC_IT143_DA;
GO

-- Refined solution using SUBSTRING for better control:
-- SUBSTRING(string, start, length)
-- CHARINDEX finds the space; subtract 1 to get only the first name characters.

SELECT
    ContactName,
    SUBSTRING(ContactName, 1, CHARINDEX(' ', ContactName) - 1) AS first_name_test
FROM dbo.t_w3_schools_customers;
GO
