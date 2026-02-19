-- Script: EC_IT143_6.3_fwf_s3_jm.sql
-- Author: Jeremy Molero
-- Date: 02/18/2026
-- Description: Step 3 - Create an ad hoc SQL query to extract the first name.

USE EC_IT143_DA;
GO

SELECT
    ContactName,
    CHARINDEX(' ', ContactName)                        AS space_position,
    LEFT(ContactName, CHARINDEX(' ', ContactName) - 1) AS first_name
FROM dbo.t_w3_schools_customers;
GO
