-- Script: EC_IT143_6.3_fwf_s7_jm.sql
-- Author: Jeremy Molero
-- Date: 02/18/2026
-- Description: Step 7 - "0 results expected" test using a CTE.
-- If the function works correctly, the UDF and ad hoc results will ALWAYS match,
-- and this query will return ZERO rows.

USE EC_IT143_DA;
GO

WITH cte_name_comparison AS
(
    SELECT
        ContactName,
        LEFT(ContactName, CHARINDEX(' ', ContactName) - 1)  AS first_name_adhoc,
        dbo.fn_get_first_name_jm(ContactName)               AS first_name_udf
    FROM dbo.t_w3_schools_customers
)
SELECT *
FROM cte_name_comparison
WHERE first_name_adhoc <> first_name_udf;
-- Expected result: 0 rows returned.
-- If any rows appear, the function has a bug.
GO
