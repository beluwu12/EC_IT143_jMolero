-- Script: EC_IT143_6.3_fwf_s6_jm.sql
-- Author: Jeremy Molero
-- Date: 02/18/2026
-- Description: Step 6 - Compare UDF result vs ad hoc query result side by side.

USE EC_IT143_DA;
GO

SELECT
    ContactName,
    -- Ad hoc result
    LEFT(ContactName, CHARINDEX(' ', ContactName) - 1)    AS first_name_adhoc,
    -- UDF result
    dbo.fn_get_first_name_jm(ContactName)                 AS first_name_udf
FROM dbo.t_w3_schools_customers;
GO
-- Both columns should show identical results for every row.
