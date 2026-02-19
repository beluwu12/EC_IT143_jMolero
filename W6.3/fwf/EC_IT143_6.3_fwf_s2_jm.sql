-- Script: EC_IT143_6.3_fwf_s2_jm.sql
-- Author: Jeremy Molero
-- Date: 02/18/2026
-- Description: Step 2 - Begin creating an answer.

USE EC_IT143_DA;
GO

-- Current progress:
-- The ContactName field contains "FirstName LastName" separated by a space.
-- To extract the first name, I need to find the position of the space.

-- Next logical step:
-- Use CHARINDEX(' ', ContactName) to find the position of the space.
-- Use SUBSTRING or LEFT to extract everything BEFORE the space.

-- Plan:
-- CHARINDEX(' ', ContactName)     --> gives position of the space
-- LEFT(ContactName, position - 1) --> gives the first name
